app [main] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.11.0/SY4WWMhWQ9NvQgvIthcv15AUeA7rAIJHAHgiaSHGhdY.tar.br",
    units: "../src/main.roc",
}

import cli.Stdout
import cli.Task
import units.Quantity

main =
    distance = Quantity.miles 500
    [
        (Quantity.toKilometers, "kilometers"),
        (Quantity.toLightYears, "light years"),
        (Quantity.toAngstroms, "angstroms"),
    ]
    |> Task.forEach \(toUnit, unitName) ->
        Stdout.line! "I would walk $(distance |> toUnit |> Num.toStr) $(unitName)."
        Stdout.line! "And I would walk $(distance |> toUnit |> Num.toStr) more."
