app [main] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.11.0/SY4WWMhWQ9NvQgvIthcv15AUeA7rAIJHAHgiaSHGhdY.tar.br",
    units: "../src/main.roc",
}

import cli.Stdout
import cli.Task
import units.Quantity

main =
    height = Quantity.feet 5 |> Quantity.add (Quantity.inches 11)
    Stdout.line! "Taylor Swift is $(height |> Quantity.toCentimeters |> Num.toStr) centimeters tall."
