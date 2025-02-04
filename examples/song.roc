app [main] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.15.0/SlwdbJ-3GR7uBWQo6zlmYWNYOxnvo8r6YABXD-45UOw.tar.br",
    units: "../src/main.roc",
}

import cli.Stdout
import cli.Task
import units.Quantity

main =
    distance = Quantity.miles(500)
    distance_kilometers = Quantity.to_kilometers(distance)
    Stdout.line!("I would walk ${Num.to_str(distance_kilometers)} kilometers.")
    Stdout.line!("And I would walk ${Num.to_str(distance_kilometers)} more.")
    distance_light_years = Quantity.to_light_years(distance)
    Stdout.line!("I would walk ${Num.to_str(distance_light_years)} light years.")
    Stdout.line!("And I would walk ${Num.to_str(distance_light_years)} more.")
    distance_angstroms = Quantity.to_angstroms(distance)
    Stdout.line!("I would walk ${Num.to_str(distance_angstroms)} ångströms.")
    Stdout.line!("And I would walk ${Num.to_str(distance_angstroms)} more.")
