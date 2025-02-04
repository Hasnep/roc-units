import itertools
from collections import OrderedDict
from collections.abc import Generator, Iterable
from pathlib import Path
from textwrap import dedent
from typing import TypeVar

import msgspec
from msgspec import Struct

T = TypeVar("T")


class Unit(Struct):
    name: str
    symbol: str | None = None


class ConversionFactor(Struct):
    from_unit: str
    to_unit: str
    scale_factor: str


class TestCase(Struct):
    from_unit: str
    to_unit: str
    from_value: float
    to_value: float


def enparen(s: str) -> str:
    return f"({s})"


def flatten(nested_iterable: Iterable[Iterable[T]]) -> list[T]:
    return [item for sublist in nested_iterable for item in sublist]


def split_words(s: str) -> list[str]:
    return flatten(w.split("-") for w in s.split(" "))


def upper_camel_case(s: str) -> str:
    return "".join(word.capitalize() for word in split_words(s))


def snake_case(*parts: str) -> str:
    return "_".join(word for word in flatten(split_words(s) for s in parts))


def get_path_between_units(
    conversion_factors_in_category: Iterable[ConversionFactor],
    from_unit: str,
    to_unit: str,
) -> list[str]:
    def is_in_graph(node: str, graph: set[tuple[str, str]]) -> bool:
        return any(node in edge for edge in graph)

    def depth_first_search(
        start: str, target: str, graph: set[tuple[str, str]]
    ) -> list[str] | None:
        stack = [(start, [start])]
        visited: set[str] = set()

        while stack:
            current, path = stack.pop()
            if current == target:
                return path

            if current not in visited:
                visited = visited | {current}
                for left_node, right_node in graph:
                    if left_node == current and right_node not in visited:
                        stack = [*stack, (right_node, [*path, right_node])]
                    elif right_node == current and left_node not in visited:
                        stack = [*stack, (left_node, [*path, left_node])]

        return None

    graph = {(c.from_unit, c.to_unit) for c in conversion_factors_in_category}
    if is_in_graph(from_unit, graph) and is_in_graph(to_unit, graph):
        result = depth_first_search(from_unit, to_unit, graph)
        if result:
            return result
        else:
            raise ValueError(f"No path between `{from_unit}` and `{to_unit}`.")
    else:
        raise KeyError(f"Either `{from_unit}` or `{to_unit}` not found in graph")


def get_conversion_function_name(from_unit_name: str, to_unit_name: str) -> str:
    return snake_case(from_unit_name, "to", to_unit_name)


def get_quantity_function(unit: Unit, canonical_unit: Unit, category: str) -> str:
    unit_symbol = unit.symbol
    unit_full_name = f"{unit.name}{' '+enparen(unit_symbol) if unit_symbol else ''}"
    if unit == canonical_unit:
        return (
            dedent(
                f"""
                ## Parse a number as a {category} in {unit_full_name}.
                {snake_case(unit.name)} : F64 -> {upper_camel_case(category,)} F64
                {snake_case(unit.name)} = |x| @Quantity(x)

                ## Convert a {category} to a number of {unit_full_name}.
                {snake_case("to", unit.name)} : {upper_camel_case(category)} F64 -> F64
                {snake_case("to", unit.name)} = |@Quantity(x)| x
                """
            ).strip()
            + "\n"
        )
    else:
        return (
            dedent(
                f"""
                ## Parse a number as a {category} in {unit_full_name}.
                {snake_case(unit.name)} : F64 -> {upper_camel_case(category)} F64
                {snake_case(unit.name)} = |x| {snake_case(canonical_unit.name)}(Convert.{get_conversion_function_name(unit.name,canonical_unit.name)}(x))

                ## Convert a {category} to a number of {unit_full_name}.
                {snake_case("to",unit.name)} : {upper_camel_case(category)} F64 -> F64
                {snake_case("to",unit.name)} = |@Quantity(x)| Convert.{get_conversion_function_name(canonical_unit.name,unit.name)}(x)
                """
            ).strip()
            + "\n"
        )


def get_convert_function(
    from_unit: str,
    to_unit: str,
    conversion_factors_in_category: Iterable[ConversionFactor],
    all_test_cases: Iterable[TestCase],
) -> str:
    path = get_path_between_units(conversion_factors_in_category, from_unit, to_unit)
    if tuple(path) == (from_unit, to_unit):
        multiplicative = next(
            (
                f"x * {c.scale_factor}"
                for c in conversion_factors_in_category
                if c.from_unit == from_unit and c.to_unit == to_unit
            ),
            None,
        )
        dividing = next(
            (
                f"Num.to_f64(x) / {c.scale_factor}"
                for c in conversion_factors_in_category
                if c.from_unit == to_unit and c.to_unit == from_unit
            ),
            None,
        )
        how_to_convert = multiplicative or dividing or "???"

    else:
        how_to_convert = " |> ".join(
            ["x"]
            + [
                get_conversion_function_name(path[i], path[i + 1])
                for i in range(len(path) - 1)
            ]
        )

    conversion_function_name = get_conversion_function_name(from_unit, to_unit)

    test_cases = [
        test_case
        for test_case in all_test_cases
        if test_case.from_unit == from_unit and test_case.to_unit == to_unit
    ] + [
        TestCase(
            from_unit=test_case.to_unit,
            to_unit=test_case.from_unit,
            from_value=test_case.to_value,
            to_value=test_case.from_value,
        )
        for test_case in all_test_cases
        if test_case.to_unit == from_unit and test_case.from_unit == to_unit
    ]
    return dedent(
        f"""
        {conversion_function_name} : F64 -> F64
        {conversion_function_name} = |x| {how_to_convert}
        """
    ).strip() + (
        "\n"
        + "\n".join(
            [
                f"expect\n    out = {conversion_function_name}({test_case.from_value:.3f}f64)\n    out |> Num.is_approx_eq({test_case.to_value:.3f}f64, {{}})"
                for test_case in test_cases
            ]
        )
        if len(test_cases) > 0
        else ""
    )


def get_paths_to_generate(
    units: dict[str, list[Unit]],
) -> dict[str, set[tuple[str, str]]]:
    def _helper(
        units_in_category: list[Unit],
    ) -> Generator[tuple[str, str], None, None]:
        canonical_unit = units_in_category[0]
        for unit in units_in_category[1:]:
            yield canonical_unit.name, unit.name
            yield unit.name, canonical_unit.name

    return {
        category: set(_helper(units_in_category))
        for category, units_in_category in units.items()
    }


def get_conversion_functions_to_generate(
    paths: Iterable[list[str]], canonical_unit: str
) -> set[tuple[str, str]]:
    def _helper(paths: Iterable[list[str]]) -> Generator[tuple[str, str], None, None]:
        for path in paths:
            yield from itertools.pairwise(path)
            yield from itertools.pairwise(reversed(path))

    non_canonical_units = set(flatten(paths)) - {canonical_unit}
    return (
        set(_helper(paths))
        | {(canonical_unit, unit) for unit in non_canonical_units}
        | {(unit, canonical_unit) for unit in non_canonical_units}
    )


def main() -> None:
    print("Generating code.")
    with (Path() / "data" / "units.toml").open() as f:
        print("Reading unit data.")
        units_raw: dict[str, list[Unit]] = msgspec.toml.decode(
            f.read(), type=dict[str, list[Unit]]
        )
    # Sort the categories and the units within each category
    units = OrderedDict(
        [
            (
                category,
                [
                    category_units[0],  # Put the canonical unit first
                    # Then sort the rest of the units
                    *sorted(category_units[1:], key=lambda u: u.name),
                ],
            )
            for category, category_units in sorted(
                units_raw.items(), key=lambda kv: kv[0]
            )
        ]
    )

    with (Path() / "data" / "conversion-factors.toml").open() as f:
        print("Reading conversion factors.")
        conversion_factors = msgspec.toml.decode(
            f.read(), type=dict[str, list[ConversionFactor]]
        )

    with (Path() / "data" / "test-cases.toml").open() as f:
        print("Reading test cases.")
        test_cases = msgspec.toml.decode(f.read(), type=dict[str, list[TestCase]])

    paths_to_generate = get_paths_to_generate(units)

    paths = {
        category: [
            get_path_between_units(
                conversion_factors.get(category, []), from_unit, to_unit
            )
            for (from_unit, to_unit) in paths_to_generate_in_category
        ]
        for category, paths_to_generate_in_category in paths_to_generate.items()
    }

    conversion_functions_to_generate = {
        category: get_conversion_functions_to_generate(
            paths_in_category, units.get(category, [])[0].name
        )
        for category, paths_in_category in paths.items()
    }

    generated_convert_functions = {
        category: {
            get_convert_function(
                from_unit,
                to_unit,
                conversion_factors.get(category, []),
                test_cases.get(category, []),
            )
            for (from_unit, to_unit) in conversion_functions_to_generate_in_category
        }
        for category, conversion_functions_to_generate_in_category in conversion_functions_to_generate.items()
    }

    with (Path() / "src" / "Convert.roc").open("w") as f:
        print("Generating Convert.roc.")
        _ = f.write(
            "module [\n"
            + "\n".join(
                sorted(
                    f"    {get_conversion_function_name(from_unit, to_unit)},"
                    for (from_unit, to_unit) in flatten(
                        conversion_functions_to_generate.values()
                    )
                )
            )
            + "\n]\n\n"
            + "\n".join(sorted(flatten(generated_convert_functions.values())))
            + "\n"
        )

    generated_quantity_functions = [
        "\n".join(
            [
                f"# {category.capitalize()}\n",
                get_quantity_function(
                    units_in_category[0], units_in_category[0], category
                ),
                *[
                    get_quantity_function(unit, units_in_category[0], category)
                    for unit in units_in_category[1:]
                ],
            ]
        )
        for category, units_in_category in units.items()
    ]

    with (Path() / "src" / "Quantity.roc").open("w") as f:
        print("Generating Quantity.roc.")
        _ = f.write(
            "module [\n"
            + "\n".join(
                [
                    f"    {x},"
                    for x in [
                        "quantity",
                        # "toStr",
                        "add",
                        "sub",
                        "mul",
                        # "div",
                        # "divChecked",
                        "square",
                        # "compare",
                        # "isLt",
                        # "isGt",
                        # "isLte",
                        # "isGte",
                        # "is_approx_eq",
                        # "isZero",
                        # "isPositive",
                        # "isNegative",
                        # "abs",
                        # "absDiff",
                        # "neg",
                        # "min",
                        # "max",
                        # "divCeil",
                        # "divCeilChecked",
                        # "divTrunc",
                        # "divTruncChecked",
                        # "rem",
                        # "remChecked",
                        # "round",
                        # "floor",
                        # "ceiling",
                        # "pow",
                    ]
                ]
            )
            + "\n"
            + "\n".join(
                f"    # {category.capitalize()}\n"
                + "\n".join(
                    [
                        f"    {x},"
                        for x in flatten(
                            [
                                [snake_case(unit.name), snake_case("to", unit.name)]
                                for unit in category_units
                            ]
                        )
                    ]
                )
                for category, category_units in units.items()
            )
            + "\n]\n"
            + dedent(
                """
import Convert

Quantity number units := number
Product a b := [Product]
Per a b := [Per]
Squared a : Product a a

# Quantities
Acceleration a : Quantity a MetersPerSecond
Area a : Quantity a SquareMeters
Capacitance a : Quantity a Farads
Charge a : Quantity a Coulombs
Current a : Quantity a Amperes
Data a : Quantity a Bits
Energy a : Quantity a Joules
Force a : Quantity a Newtons
Inductance a : Quantity a Henrys
Length a : Quantity a Meters
MagneticFlux a : Quantity a Webers
Mass a : Quantity a Kilograms
Power a : Quantity a Watts
Pressure a : Quantity a Pascals
Resistance a : Quantity a Ohms
Speed a : Quantity a MetersPerSecond
Time a : Quantity a Seconds
Voltage a : Quantity a Volts
Volume a : Quantity a Liters

# Canonical units
Amperes := [Amperes]
Bits := [Bits]
Coulombs : Product Amperes Seconds
Farads : Per Coulombs Volts
Henrys : Per Volts Amperes
Joules : Product Newtons Meters
Kilograms := [Kilograms]
Liters : Squared (Squared Meters)
Meters := [Meters]
MetersPerSecond : Per Meters Seconds
Newtons : Per (Product Kilograms Meters) (Squared Seconds)
Ohms : Per Volts Amperes
Pascals : Per Newtons SquareMeters
Seconds := [Seconds]
SquareMeters : Squared Meters
Volts := [Volts]
Watts : Per Joules Seconds
Webers : Product Volts Seconds

quantity : F64, units -> Quantity F64 units
quantity = |num, _| @Quantity(num)

add : Quantity F64 units, Quantity F64 units -> Quantity F64 units
add = |@Quantity(x), @Quantity(y)| @Quantity(x + y)

sub : Quantity F64 units, Quantity F64 units -> Quantity F64 units
sub = |@Quantity(x), @Quantity(y)| @Quantity(x - y)

mul : Quantity F64 units_a, Quantity F64 units_b -> Quantity F64 (Product units_a units_b)
mul = |@Quantity(x), @Quantity(y)| @Quantity(x * y)

square : Quantity F64 units -> Quantity F64 (Squared units)
square = |@Quantity(x)| @Quantity(x * x)

expect
    a = meters(10)
    out = square(a)
    out |> is_approx_eq(square_meters(100), {})

is_approx_eq : Quantity F64 units, Quantity F64 units, {} -> Bool
is_approx_eq = |@Quantity(x), @Quantity(y), _| Num.is_approx_eq(x, y, {})
"""
            )
            + "\n".join(generated_quantity_functions)
        )
    print("Code generation complete.")


if __name__ == "__main__":
    main()
