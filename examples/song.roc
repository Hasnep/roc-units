app [main] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.15.0/SlwdbJ-3GR7uBWQo6zlmYWNYOxnvo8r6YABXD-45UOw.tar.br",
    units: "../src/main.roc",
}

import cli.Stdout
import cli.Task
import units.Quantity

main =
    distance = Quantity.miles 500
    distanceKilometers = Quantity.toKilometers distance
    Stdout.line! "I would walk $(Num.toStr distanceKilometers) kilometers."
    Stdout.line! "And I would walk $(Num.toStr distanceKilometers) more."
    distanceLightYears = Quantity.toLightYears distance
    Stdout.line! "I would walk $(Num.toStr distanceLightYears) light years."
    Stdout.line! "And I would walk $(Num.toStr distanceLightYears) more."
    distanceAngstroms = Quantity.toAngstroms distance
    Stdout.line! "I would walk $(Num.toStr distanceAngstroms) ångströms."
    Stdout.line! "And I would walk $(Num.toStr distanceAngstroms) more."
