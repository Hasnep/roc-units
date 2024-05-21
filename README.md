# Roc Units

Type-safe units of measure in Roc.

## Example

Feet, inches and centimeters are all `Length`s, so they can all be added to and converted to each other.

```roc
height = Quantity.feet 5 |> Quantity.add (Quantity.inches 11)
Stdout.line! "Taylor Swift is $(height |> Quantity.toCentimeters |> Num.toStr) centimeters tall."
```

```text
Taylor Swift is 180.34 centimeters tall.
```

But incompatible units cannot be used together.

```roc
isThisAKilometer = Quantity.kilograms 1 |> Quantity.add (Quantity.meters 1)
```

```text
This 2nd argument to add has an unexpected type: ...
```

For a list of all the supported units, see [the documentation](https://hasnep.github.io/roc-units).


## Licence

This project is released under the [UPL licence](./LICENCE) and is partly based on the [elm-units](https://package.elm-lang.org/packages/ianmackenzie/elm-units/latest/) library, which is licenced under the [BSD 3-Clause License](./LICENCE-elm-units).
