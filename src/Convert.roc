module [
    angstroms_to_meters,
    astronomical_units_to_meters,
    atmospheres_to_pascals,
    bars_to_pascals,
    bits_to_bytes,
    bits_to_nibbles,
    bytes_to_bits,
    calories_to_joules,
    calories_to_kilocalories,
    centimeters_to_meters,
    coulombs_to_elementary_charges,
    cubic_centimeters_to_liters,
    cubic_inches_to_cubic_meters,
    cubic_inches_to_gallons,
    cubic_inches_to_liters,
    cubic_meters_to_cubic_inches,
    cubic_meters_to_liters,
    days_to_hours,
    days_to_seconds,
    days_to_weeks,
    elementary_charges_to_coulombs,
    feet_per_second_to_meters_per_second,
    feet_to_inches,
    feet_to_meters,
    feet_to_miles,
    feet_to_yards,
    foot_pound_force_to_joules,
    gallons_to_cubic_inches,
    gallons_to_liters,
    gallons_to_quarts,
    grams_to_kilograms,
    horsepower_to_watts,
    hours_to_days,
    hours_to_minutes,
    hours_to_seconds,
    inches_to_feet,
    inches_to_meters,
    joules_to_calories,
    joules_to_foot_pound_force,
    joules_to_kilocalories,
    joules_to_kilowatt_hours,
    joules_to_watt_hours,
    kilocalories_to_calories,
    kilocalories_to_joules,
    kilograms_to_grams,
    kilograms_to_ounces,
    kilograms_to_pounds,
    kilograms_to_tonnes,
    kilograms_to_tons,
    kilometers_per_hour_to_meters_per_second,
    kilometers_to_meters,
    kilowatt_hours_to_joules,
    kilowatt_hours_to_watt_hours,
    knots_to_meters_per_second,
    light_speed_to_meters_per_second,
    light_years_to_meters,
    liters_to_cubic_centimeters,
    liters_to_cubic_inches,
    liters_to_cubic_meters,
    liters_to_gallons,
    liters_to_milliliters,
    liters_to_pints,
    liters_to_quarts,
    liters_to_tablespoons,
    liters_to_teaspoons,
    mach_to_meters_per_second,
    meters_per_second_per_second_to_standard_gravity,
    meters_per_second_to_feet_per_second,
    meters_per_second_to_kilometers_per_hour,
    meters_per_second_to_knots,
    meters_per_second_to_light_speed,
    meters_per_second_to_mach,
    meters_per_second_to_miles_per_hour,
    meters_to_angstroms,
    meters_to_astronomical_units,
    meters_to_centimeters,
    meters_to_feet,
    meters_to_inches,
    meters_to_kilometers,
    meters_to_light_years,
    meters_to_miles,
    meters_to_nautical_miles,
    meters_to_yards,
    miles_per_hour_to_meters_per_second,
    miles_to_feet,
    miles_to_meters,
    milliliters_to_liters,
    milliliters_to_tablespoons,
    milliliters_to_teaspoons,
    minutes_to_hours,
    minutes_to_seconds,
    nautical_miles_to_meters,
    newtons_to_pound_force,
    nibbles_to_bits,
    ounces_to_kilograms,
    ounces_to_pounds,
    pascals_to_atmospheres,
    pascals_to_bars,
    pints_to_liters,
    pints_to_quarts,
    pound_force_to_newtons,
    pounds_to_kilograms,
    pounds_to_ounces,
    pounds_to_tons,
    quarts_to_gallons,
    quarts_to_liters,
    quarts_to_pints,
    seconds_to_days,
    seconds_to_hours,
    seconds_to_minutes,
    seconds_to_weeks,
    square_feet_to_square_meters,
    square_meters_to_square_feet,
    standard_gravity_to_meters_per_second_per_second,
    tablespoons_to_liters,
    tablespoons_to_milliliters,
    teaspoons_to_liters,
    teaspoons_to_milliliters,
    tonnes_to_kilograms,
    tons_to_kilograms,
    tons_to_pounds,
    watt_hours_to_joules,
    watt_hours_to_kilowatt_hours,
    watts_to_horsepower,
    weeks_to_days,
    weeks_to_seconds,
    yards_to_feet,
    yards_to_meters,
]

angstroms_to_meters : F64 -> F64
angstroms_to_meters = |x| x * 1e-10
expect
    out = angstroms_to_meters(10000000000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
astronomical_units_to_meters : F64 -> F64
astronomical_units_to_meters = |x| x * 149597870700
expect
    out = astronomical_units_to_meters(1.000f64)
    out |> Num.is_approx_eq(149597870700.000f64, {})
atmospheres_to_pascals : F64 -> F64
atmospheres_to_pascals = |x| x * 101325
expect
    out = atmospheres_to_pascals(1.000f64)
    out |> Num.is_approx_eq(101325.000f64, {})
bars_to_pascals : F64 -> F64
bars_to_pascals = |x| x * 1e5
expect
    out = bars_to_pascals(1.000f64)
    out |> Num.is_approx_eq(100000.000f64, {})
bits_to_bytes : F64 -> F64
bits_to_bytes = |x| Num.to_f64(x) / 8
expect
    out = bits_to_bytes(8.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
bits_to_nibbles : F64 -> F64
bits_to_nibbles = |x| Num.to_f64(x) / 4
expect
    out = bits_to_nibbles(4.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
bytes_to_bits : F64 -> F64
bytes_to_bits = |x| x * 8
expect
    out = bytes_to_bits(1.000f64)
    out |> Num.is_approx_eq(8.000f64, {})
calories_to_joules : F64 -> F64
calories_to_joules = |x| x * 4.184
expect
    out = calories_to_joules(1000.000f64)
    out |> Num.is_approx_eq(4184.000f64, {})
calories_to_kilocalories : F64 -> F64
calories_to_kilocalories = |x| Num.to_f64(x) / 1000
centimeters_to_meters : F64 -> F64
centimeters_to_meters = |x| Num.to_f64(x) / 100
expect
    out = centimeters_to_meters(100.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
coulombs_to_elementary_charges : F64 -> F64
coulombs_to_elementary_charges = |x| Num.to_f64(x) / 1.60217e-19
expect
    out = coulombs_to_elementary_charges(1.000f64)
    out |> Num.is_approx_eq(6241509074000000000.000f64, {})
cubic_centimeters_to_liters : F64 -> F64
cubic_centimeters_to_liters = |x| Num.to_f64(x) / 1000
expect
    out = cubic_centimeters_to_liters(1000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
cubic_inches_to_cubic_meters : F64 -> F64
cubic_inches_to_cubic_meters = |x| x |> cubic_inches_to_gallons |> gallons_to_liters |> liters_to_cubic_meters
cubic_inches_to_gallons : F64 -> F64
cubic_inches_to_gallons = |x| Num.to_f64(x) / 231
expect
    out = cubic_inches_to_gallons(231.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
cubic_inches_to_liters : F64 -> F64
cubic_inches_to_liters = |x| x |> cubic_inches_to_gallons |> gallons_to_liters
cubic_meters_to_cubic_inches : F64 -> F64
cubic_meters_to_cubic_inches = |x| x |> cubic_meters_to_liters |> liters_to_gallons |> gallons_to_cubic_inches
cubic_meters_to_liters : F64 -> F64
cubic_meters_to_liters = |x| x * 1000
expect
    out = cubic_meters_to_liters(1.000f64)
    out |> Num.is_approx_eq(1000.000f64, {})
days_to_hours : F64 -> F64
days_to_hours = |x| x * 24
expect
    out = days_to_hours(1.000f64)
    out |> Num.is_approx_eq(24.000f64, {})
days_to_seconds : F64 -> F64
days_to_seconds = |x| x |> days_to_hours |> hours_to_minutes |> minutes_to_seconds
expect
    out = days_to_seconds(1.000f64)
    out |> Num.is_approx_eq(86400.000f64, {})
days_to_weeks : F64 -> F64
days_to_weeks = |x| Num.to_f64(x) / 7
expect
    out = days_to_weeks(7.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
elementary_charges_to_coulombs : F64 -> F64
elementary_charges_to_coulombs = |x| x * 1.60217e-19
expect
    out = elementary_charges_to_coulombs(6241509074000000000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
feet_per_second_to_meters_per_second : F64 -> F64
feet_per_second_to_meters_per_second = |x| Num.to_f64(x) / meters_to_feet(1)
expect
    out = feet_per_second_to_meters_per_second(328.084f64)
    out |> Num.is_approx_eq(100.000f64, {})
feet_to_inches : F64 -> F64
feet_to_inches = |x| x * 12
expect
    out = feet_to_inches(1.000f64)
    out |> Num.is_approx_eq(12.000f64, {})
feet_to_meters : F64 -> F64
feet_to_meters = |x| x |> feet_to_yards |> yards_to_meters
expect
    out = feet_to_meters(3280.840f64)
    out |> Num.is_approx_eq(1000.000f64, {})
feet_to_miles : F64 -> F64
feet_to_miles = |x| Num.to_f64(x) / 5280
expect
    out = feet_to_miles(5280.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
feet_to_yards : F64 -> F64
feet_to_yards = |x| Num.to_f64(x) / 3
foot_pound_force_to_joules : F64 -> F64
foot_pound_force_to_joules = |x| x * (feet_to_meters(1) * pound_force_to_newtons(1))
expect
    out = foot_pound_force_to_joules(7375.621f64)
    out |> Num.is_approx_eq(10000.000f64, {})
gallons_to_cubic_inches : F64 -> F64
gallons_to_cubic_inches = |x| x * 231
expect
    out = gallons_to_cubic_inches(1.000f64)
    out |> Num.is_approx_eq(231.000f64, {})
gallons_to_liters : F64 -> F64
gallons_to_liters = |x| x |> gallons_to_cubic_inches |> cubic_inches_to_cubic_meters |> cubic_meters_to_liters
gallons_to_quarts : F64 -> F64
gallons_to_quarts = |x| x * 4
expect
    out = gallons_to_quarts(1.000f64)
    out |> Num.is_approx_eq(4.000f64, {})
grams_to_kilograms : F64 -> F64
grams_to_kilograms = |x| Num.to_f64(x) / 1000
expect
    out = grams_to_kilograms(1000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
horsepower_to_watts : F64 -> F64
horsepower_to_watts = |x| x * foot_pound_force_to_joules(550)
hours_to_days : F64 -> F64
hours_to_days = |x| Num.to_f64(x) / 24
expect
    out = hours_to_days(24.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
hours_to_minutes : F64 -> F64
hours_to_minutes = |x| x * 60
expect
    out = hours_to_minutes(1.000f64)
    out |> Num.is_approx_eq(60.000f64, {})
hours_to_seconds : F64 -> F64
hours_to_seconds = |x| x |> hours_to_minutes |> minutes_to_seconds
expect
    out = hours_to_seconds(1.000f64)
    out |> Num.is_approx_eq(3600.000f64, {})
inches_to_feet : F64 -> F64
inches_to_feet = |x| Num.to_f64(x) / 12
expect
    out = inches_to_feet(12.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
inches_to_meters : F64 -> F64
inches_to_meters = |x| x |> inches_to_feet |> feet_to_yards |> yards_to_meters
expect
    out = inches_to_meters(39.370f64)
    out |> Num.is_approx_eq(1.000f64, {})
joules_to_calories : F64 -> F64
joules_to_calories = |x| Num.to_f64(x) / 4.184
expect
    out = joules_to_calories(4184.000f64)
    out |> Num.is_approx_eq(1000.000f64, {})
joules_to_foot_pound_force : F64 -> F64
joules_to_foot_pound_force = |x| Num.to_f64(x) / (feet_to_meters(1) * pound_force_to_newtons(1))
expect
    out = joules_to_foot_pound_force(10000.000f64)
    out |> Num.is_approx_eq(7375.621f64, {})
joules_to_kilocalories : F64 -> F64
joules_to_kilocalories = |x| x |> joules_to_calories |> calories_to_kilocalories
joules_to_kilowatt_hours : F64 -> F64
joules_to_kilowatt_hours = |x| x |> joules_to_watt_hours |> watt_hours_to_kilowatt_hours
expect
    out = joules_to_kilowatt_hours(3600000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
joules_to_watt_hours : F64 -> F64
joules_to_watt_hours = |x| Num.to_f64(x) / hours_to_seconds(1)
expect
    out = joules_to_watt_hours(3600.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
kilocalories_to_calories : F64 -> F64
kilocalories_to_calories = |x| x * 1000
kilocalories_to_joules : F64 -> F64
kilocalories_to_joules = |x| x |> kilocalories_to_calories |> calories_to_joules
kilograms_to_grams : F64 -> F64
kilograms_to_grams = |x| x * 1000
expect
    out = kilograms_to_grams(1.000f64)
    out |> Num.is_approx_eq(1000.000f64, {})
kilograms_to_ounces : F64 -> F64
kilograms_to_ounces = |x| x |> kilograms_to_pounds |> pounds_to_ounces
expect
    out = kilograms_to_ounces(1.000f64)
    out |> Num.is_approx_eq(35.274f64, {})
kilograms_to_pounds : F64 -> F64
kilograms_to_pounds = |x| Num.to_f64(x) / 0.45359237
expect
    out = kilograms_to_pounds(1000.000f64)
    out |> Num.is_approx_eq(2204.623f64, {})
kilograms_to_tonnes : F64 -> F64
kilograms_to_tonnes = |x| Num.to_f64(x) / 1000
expect
    out = kilograms_to_tonnes(1000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
kilograms_to_tons : F64 -> F64
kilograms_to_tons = |x| x |> kilograms_to_pounds |> pounds_to_tons
expect
    out = kilograms_to_tons(907.185f64)
    out |> Num.is_approx_eq(1.000f64, {})
kilometers_per_hour_to_meters_per_second : F64 -> F64
kilometers_per_hour_to_meters_per_second = |x| x * (kilometers_to_meters(1) / (1 |> hours_to_minutes() |> minutes_to_seconds()))
expect
    out = kilometers_per_hour_to_meters_per_second(36.000f64)
    out |> Num.is_approx_eq(10.000f64, {})
kilometers_to_meters : F64 -> F64
kilometers_to_meters = |x| x * 1000
expect
    out = kilometers_to_meters(1.000f64)
    out |> Num.is_approx_eq(1000.000f64, {})
kilowatt_hours_to_joules : F64 -> F64
kilowatt_hours_to_joules = |x| x |> kilowatt_hours_to_watt_hours |> watt_hours_to_joules
expect
    out = kilowatt_hours_to_joules(1.000f64)
    out |> Num.is_approx_eq(3600000.000f64, {})
kilowatt_hours_to_watt_hours : F64 -> F64
kilowatt_hours_to_watt_hours = |x| x * 1000
expect
    out = kilowatt_hours_to_watt_hours(1.000f64)
    out |> Num.is_approx_eq(1000.000f64, {})
knots_to_meters_per_second : F64 -> F64
knots_to_meters_per_second = |x| x * (nautical_miles_to_meters(1) / (1 |> hours_to_minutes |> minutes_to_seconds))
expect
    out = knots_to_meters_per_second(623.974f64)
    out |> Num.is_approx_eq(321.000f64, {})
light_speed_to_meters_per_second : F64 -> F64
light_speed_to_meters_per_second = |x| x * 299792458
expect
    out = light_speed_to_meters_per_second(1.000f64)
    out |> Num.is_approx_eq(299792458.000f64, {})
light_years_to_meters : F64 -> F64
light_years_to_meters = |x| x * (light_speed_to_meters_per_second(1) * days_to_seconds(365 + (1 / 4)))
expect
    out = light_years_to_meters(1.000f64)
    out |> Num.is_approx_eq(9460730473000000.000f64, {})
liters_to_cubic_centimeters : F64 -> F64
liters_to_cubic_centimeters = |x| x * 1000
expect
    out = liters_to_cubic_centimeters(1.000f64)
    out |> Num.is_approx_eq(1000.000f64, {})
liters_to_cubic_inches : F64 -> F64
liters_to_cubic_inches = |x| x |> liters_to_cubic_meters |> cubic_meters_to_cubic_inches
liters_to_cubic_meters : F64 -> F64
liters_to_cubic_meters = |x| Num.to_f64(x) / 1000
expect
    out = liters_to_cubic_meters(1000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
liters_to_gallons : F64 -> F64
liters_to_gallons = |x| x |> liters_to_cubic_meters |> cubic_meters_to_cubic_inches |> cubic_inches_to_gallons
liters_to_milliliters : F64 -> F64
liters_to_milliliters = |x| x * 1000
liters_to_pints : F64 -> F64
liters_to_pints = |x| x |> liters_to_cubic_meters |> cubic_meters_to_cubic_inches |> cubic_inches_to_gallons |> gallons_to_quarts |> quarts_to_pints
liters_to_quarts : F64 -> F64
liters_to_quarts = |x| x |> liters_to_cubic_meters |> cubic_meters_to_cubic_inches |> cubic_inches_to_gallons |> gallons_to_quarts
liters_to_tablespoons : F64 -> F64
liters_to_tablespoons = |x| x |> liters_to_milliliters |> milliliters_to_tablespoons
liters_to_teaspoons : F64 -> F64
liters_to_teaspoons = |x| x |> liters_to_milliliters |> milliliters_to_teaspoons
mach_to_meters_per_second : F64 -> F64
mach_to_meters_per_second = |x| x * 331.46
expect
    out = mach_to_meters_per_second(1.000f64)
    out |> Num.is_approx_eq(331.460f64, {})
meters_per_second_per_second_to_standard_gravity : F64 -> F64
meters_per_second_per_second_to_standard_gravity = |x| Num.to_f64(x) / 9.80665
expect
    out = meters_per_second_per_second_to_standard_gravity(98.067f64)
    out |> Num.is_approx_eq(10.000f64, {})
meters_per_second_to_feet_per_second : F64 -> F64
meters_per_second_to_feet_per_second = |x| x * meters_to_feet(1)
expect
    out = meters_per_second_to_feet_per_second(100.000f64)
    out |> Num.is_approx_eq(328.084f64, {})
meters_per_second_to_kilometers_per_hour : F64 -> F64
meters_per_second_to_kilometers_per_hour = |x| Num.to_f64(x) / (kilometers_to_meters(1) / (1 |> hours_to_minutes() |> minutes_to_seconds()))
expect
    out = meters_per_second_to_kilometers_per_hour(10.000f64)
    out |> Num.is_approx_eq(36.000f64, {})
meters_per_second_to_knots : F64 -> F64
meters_per_second_to_knots = |x| Num.to_f64(x) / (nautical_miles_to_meters(1) / (1 |> hours_to_minutes |> minutes_to_seconds))
expect
    out = meters_per_second_to_knots(321.000f64)
    out |> Num.is_approx_eq(623.974f64, {})
meters_per_second_to_light_speed : F64 -> F64
meters_per_second_to_light_speed = |x| Num.to_f64(x) / 299792458
expect
    out = meters_per_second_to_light_speed(299792458.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
meters_per_second_to_mach : F64 -> F64
meters_per_second_to_mach = |x| Num.to_f64(x) / 331.46
expect
    out = meters_per_second_to_mach(331.460f64)
    out |> Num.is_approx_eq(1.000f64, {})
meters_per_second_to_miles_per_hour : F64 -> F64
meters_per_second_to_miles_per_hour = |x| Num.to_f64(x) / (miles_to_meters(1) / (1 |> hours_to_minutes |> minutes_to_seconds))
expect
    out = meters_per_second_to_miles_per_hour(54.986f64)
    out |> Num.is_approx_eq(123.000f64, {})
meters_to_angstroms : F64 -> F64
meters_to_angstroms = |x| Num.to_f64(x) / 1e-10
expect
    out = meters_to_angstroms(1.000f64)
    out |> Num.is_approx_eq(10000000000.000f64, {})
meters_to_astronomical_units : F64 -> F64
meters_to_astronomical_units = |x| Num.to_f64(x) / 149597870700
expect
    out = meters_to_astronomical_units(149597870700.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
meters_to_centimeters : F64 -> F64
meters_to_centimeters = |x| x * 100
expect
    out = meters_to_centimeters(1.000f64)
    out |> Num.is_approx_eq(100.000f64, {})
meters_to_feet : F64 -> F64
meters_to_feet = |x| x |> meters_to_yards |> yards_to_feet
expect
    out = meters_to_feet(1000.000f64)
    out |> Num.is_approx_eq(3280.840f64, {})
meters_to_inches : F64 -> F64
meters_to_inches = |x| x |> meters_to_yards |> yards_to_feet |> feet_to_inches
expect
    out = meters_to_inches(1.000f64)
    out |> Num.is_approx_eq(39.370f64, {})
meters_to_kilometers : F64 -> F64
meters_to_kilometers = |x| Num.to_f64(x) / 1000
expect
    out = meters_to_kilometers(1000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
meters_to_light_years : F64 -> F64
meters_to_light_years = |x| Num.to_f64(x) / (light_speed_to_meters_per_second(1) * days_to_seconds(365 + (1 / 4)))
expect
    out = meters_to_light_years(9460730473000000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
meters_to_miles : F64 -> F64
meters_to_miles = |x| x |> meters_to_yards |> yards_to_feet |> feet_to_miles
expect
    out = meters_to_miles(1609.340f64)
    out |> Num.is_approx_eq(1.000f64, {})
meters_to_nautical_miles : F64 -> F64
meters_to_nautical_miles = |x| Num.to_f64(x) / 1852
expect
    out = meters_to_nautical_miles(1852.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
meters_to_yards : F64 -> F64
meters_to_yards = |x| Num.to_f64(x) / 0.9144
miles_per_hour_to_meters_per_second : F64 -> F64
miles_per_hour_to_meters_per_second = |x| x * (miles_to_meters(1) / (1 |> hours_to_minutes |> minutes_to_seconds))
expect
    out = miles_per_hour_to_meters_per_second(123.000f64)
    out |> Num.is_approx_eq(54.986f64, {})
miles_to_feet : F64 -> F64
miles_to_feet = |x| x * 5280
expect
    out = miles_to_feet(1.000f64)
    out |> Num.is_approx_eq(5280.000f64, {})
miles_to_meters : F64 -> F64
miles_to_meters = |x| x |> miles_to_feet |> feet_to_yards |> yards_to_meters
expect
    out = miles_to_meters(1.000f64)
    out |> Num.is_approx_eq(1609.340f64, {})
milliliters_to_liters : F64 -> F64
milliliters_to_liters = |x| Num.to_f64(x) / 1000
milliliters_to_tablespoons : F64 -> F64
milliliters_to_tablespoons = |x| Num.to_f64(x) / 14.78676
milliliters_to_teaspoons : F64 -> F64
milliliters_to_teaspoons = |x| Num.to_f64(x) / 4.928922
minutes_to_hours : F64 -> F64
minutes_to_hours = |x| Num.to_f64(x) / 60
expect
    out = minutes_to_hours(60.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
minutes_to_seconds : F64 -> F64
minutes_to_seconds = |x| x * 60
expect
    out = minutes_to_seconds(1.000f64)
    out |> Num.is_approx_eq(60.000f64, {})
nautical_miles_to_meters : F64 -> F64
nautical_miles_to_meters = |x| x * 1852
expect
    out = nautical_miles_to_meters(1.000f64)
    out |> Num.is_approx_eq(1852.000f64, {})
newtons_to_pound_force : F64 -> F64
newtons_to_pound_force = |x| Num.to_f64(x) / pounds_to_kilograms(standard_gravity_to_meters_per_second_per_second(1))
expect
    out = newtons_to_pound_force(10000.000f64)
    out |> Num.is_approx_eq(2248.089f64, {})
nibbles_to_bits : F64 -> F64
nibbles_to_bits = |x| x * 4
expect
    out = nibbles_to_bits(1.000f64)
    out |> Num.is_approx_eq(4.000f64, {})
ounces_to_kilograms : F64 -> F64
ounces_to_kilograms = |x| x |> ounces_to_pounds |> pounds_to_kilograms
expect
    out = ounces_to_kilograms(35.274f64)
    out |> Num.is_approx_eq(1.000f64, {})
ounces_to_pounds : F64 -> F64
ounces_to_pounds = |x| Num.to_f64(x) / 16
expect
    out = ounces_to_pounds(16.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
pascals_to_atmospheres : F64 -> F64
pascals_to_atmospheres = |x| Num.to_f64(x) / 101325
expect
    out = pascals_to_atmospheres(101325.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
pascals_to_bars : F64 -> F64
pascals_to_bars = |x| Num.to_f64(x) / 1e5
expect
    out = pascals_to_bars(100000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
pints_to_liters : F64 -> F64
pints_to_liters = |x| x |> pints_to_quarts |> quarts_to_gallons |> gallons_to_cubic_inches |> cubic_inches_to_cubic_meters |> cubic_meters_to_liters
pints_to_quarts : F64 -> F64
pints_to_quarts = |x| Num.to_f64(x) / 2
pound_force_to_newtons : F64 -> F64
pound_force_to_newtons = |x| x * pounds_to_kilograms(standard_gravity_to_meters_per_second_per_second(1))
expect
    out = pound_force_to_newtons(2248.089f64)
    out |> Num.is_approx_eq(10000.000f64, {})
pounds_to_kilograms : F64 -> F64
pounds_to_kilograms = |x| x * 0.45359237
expect
    out = pounds_to_kilograms(2204.623f64)
    out |> Num.is_approx_eq(1000.000f64, {})
pounds_to_ounces : F64 -> F64
pounds_to_ounces = |x| x * 16
expect
    out = pounds_to_ounces(1.000f64)
    out |> Num.is_approx_eq(16.000f64, {})
pounds_to_tons : F64 -> F64
pounds_to_tons = |x| Num.to_f64(x) / 2000
expect
    out = pounds_to_tons(2000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
quarts_to_gallons : F64 -> F64
quarts_to_gallons = |x| Num.to_f64(x) / 4
expect
    out = quarts_to_gallons(4.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
quarts_to_liters : F64 -> F64
quarts_to_liters = |x| x |> quarts_to_gallons |> gallons_to_cubic_inches |> cubic_inches_to_cubic_meters |> cubic_meters_to_liters
quarts_to_pints : F64 -> F64
quarts_to_pints = |x| x * 2
seconds_to_days : F64 -> F64
seconds_to_days = |x| x |> seconds_to_minutes |> minutes_to_hours |> hours_to_days
expect
    out = seconds_to_days(86400.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
seconds_to_hours : F64 -> F64
seconds_to_hours = |x| x |> seconds_to_minutes |> minutes_to_hours
expect
    out = seconds_to_hours(3600.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
seconds_to_minutes : F64 -> F64
seconds_to_minutes = |x| Num.to_f64(x) / 60
expect
    out = seconds_to_minutes(60.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
seconds_to_weeks : F64 -> F64
seconds_to_weeks = |x| x |> seconds_to_minutes |> minutes_to_hours |> hours_to_days |> days_to_weeks
expect
    out = seconds_to_weeks(604800.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
square_feet_to_square_meters : F64 -> F64
square_feet_to_square_meters = |x| x * Num.pow(feet_to_meters(1), 2)
expect
    out = square_feet_to_square_meters(1076.391f64)
    out |> Num.is_approx_eq(100.000f64, {})
square_meters_to_square_feet : F64 -> F64
square_meters_to_square_feet = |x| Num.to_f64(x) / Num.pow(feet_to_meters(1), 2)
expect
    out = square_meters_to_square_feet(100.000f64)
    out |> Num.is_approx_eq(1076.391f64, {})
standard_gravity_to_meters_per_second_per_second : F64 -> F64
standard_gravity_to_meters_per_second_per_second = |x| x * 9.80665
expect
    out = standard_gravity_to_meters_per_second_per_second(10.000f64)
    out |> Num.is_approx_eq(98.067f64, {})
tablespoons_to_liters : F64 -> F64
tablespoons_to_liters = |x| x |> tablespoons_to_milliliters |> milliliters_to_liters
tablespoons_to_milliliters : F64 -> F64
tablespoons_to_milliliters = |x| x * 14.78676
teaspoons_to_liters : F64 -> F64
teaspoons_to_liters = |x| x |> teaspoons_to_milliliters |> milliliters_to_liters
teaspoons_to_milliliters : F64 -> F64
teaspoons_to_milliliters = |x| x * 4.928922
tonnes_to_kilograms : F64 -> F64
tonnes_to_kilograms = |x| x * 1000
expect
    out = tonnes_to_kilograms(1.000f64)
    out |> Num.is_approx_eq(1000.000f64, {})
tons_to_kilograms : F64 -> F64
tons_to_kilograms = |x| x |> tons_to_pounds |> pounds_to_kilograms
expect
    out = tons_to_kilograms(1.000f64)
    out |> Num.is_approx_eq(907.185f64, {})
tons_to_pounds : F64 -> F64
tons_to_pounds = |x| x * 2000
expect
    out = tons_to_pounds(1.000f64)
    out |> Num.is_approx_eq(2000.000f64, {})
watt_hours_to_joules : F64 -> F64
watt_hours_to_joules = |x| x * hours_to_seconds(1)
expect
    out = watt_hours_to_joules(1.000f64)
    out |> Num.is_approx_eq(3600.000f64, {})
watt_hours_to_kilowatt_hours : F64 -> F64
watt_hours_to_kilowatt_hours = |x| Num.to_f64(x) / 1000
expect
    out = watt_hours_to_kilowatt_hours(1000.000f64)
    out |> Num.is_approx_eq(1.000f64, {})
watts_to_horsepower : F64 -> F64
watts_to_horsepower = |x| Num.to_f64(x) / foot_pound_force_to_joules(550)
weeks_to_days : F64 -> F64
weeks_to_days = |x| x * 7
expect
    out = weeks_to_days(1.000f64)
    out |> Num.is_approx_eq(7.000f64, {})
weeks_to_seconds : F64 -> F64
weeks_to_seconds = |x| x |> weeks_to_days |> days_to_hours |> hours_to_minutes |> minutes_to_seconds
expect
    out = weeks_to_seconds(1.000f64)
    out |> Num.is_approx_eq(604800.000f64, {})
yards_to_feet : F64 -> F64
yards_to_feet = |x| x * 3
yards_to_meters : F64 -> F64
yards_to_meters = |x| x * 0.9144
