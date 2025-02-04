module [
    quantity,
    add,
    sub,
    mul,
    square,
    # Acceleration
    meters_per_second_per_second,
    to_meters_per_second_per_second,
    standard_gravity,
    to_standard_gravity,
    # Area
    square_meters,
    to_square_meters,
    square_feet,
    to_square_feet,
    # Capacitance
    farads,
    to_farads,
    # Charge
    coulombs,
    to_coulombs,
    elementary_charges,
    to_elementary_charges,
    # Current
    amperes,
    to_amperes,
    # Data
    bits,
    to_bits,
    bytes,
    to_bytes,
    nibbles,
    to_nibbles,
    # Energy
    joules,
    to_joules,
    calories,
    to_calories,
    foot_pound_force,
    to_foot_pound_force,
    kilocalories,
    to_kilocalories,
    kilowatt_hours,
    to_kilowatt_hours,
    # Force
    newtons,
    to_newtons,
    pound_force,
    to_pound_force,
    # Inductance
    henrys,
    to_henrys,
    # Length
    meters,
    to_meters,
    angstroms,
    to_angstroms,
    astronomical_units,
    to_astronomical_units,
    centimeters,
    to_centimeters,
    feet,
    to_feet,
    inches,
    to_inches,
    kilometers,
    to_kilometers,
    light_years,
    to_light_years,
    miles,
    to_miles,
    nautical_miles,
    to_nautical_miles,
    # Magnetic flux
    webers,
    to_webers,
    # Mass
    kilograms,
    to_kilograms,
    grams,
    to_grams,
    ounces,
    to_ounces,
    pounds,
    to_pounds,
    tonnes,
    to_tonnes,
    tons,
    to_tons,
    # Power
    watts,
    to_watts,
    horsepower,
    to_horsepower,
    # Pressure
    pascals,
    to_pascals,
    atmospheres,
    to_atmospheres,
    bars,
    to_bars,
    # Resistance
    ohms,
    to_ohms,
    # Speed
    meters_per_second,
    to_meters_per_second,
    feet_per_second,
    to_feet_per_second,
    kilometers_per_hour,
    to_kilometers_per_hour,
    knots,
    to_knots,
    light_speed,
    to_light_speed,
    mach,
    to_mach,
    miles_per_hour,
    to_miles_per_hour,
    # Time
    seconds,
    to_seconds,
    days,
    to_days,
    hours,
    to_hours,
    minutes,
    to_minutes,
    weeks,
    to_weeks,
    # Voltage
    volts,
    to_volts,
    # Volume
    liters,
    to_liters,
    cubic_centimeters,
    to_cubic_centimeters,
    cubic_inches,
    to_cubic_inches,
    cubic_meters,
    to_cubic_meters,
    gallons,
    to_gallons,
    pints,
    to_pints,
    quarts,
    to_quarts,
    tablespoons,
    to_tablespoons,
    teaspoons,
    to_teaspoons,
]

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
# Acceleration

## Parse a number as a acceleration in meters per second per second (m·s⁻²).
meters_per_second_per_second : F64 -> Acceleration F64
meters_per_second_per_second = |x| @Quantity(x)

## Convert a acceleration to a number of meters per second per second (m·s⁻²).
to_meters_per_second_per_second : Acceleration F64 -> F64
to_meters_per_second_per_second = |@Quantity(x)| x

## Parse a number as a acceleration in standard gravity.
standard_gravity : F64 -> Acceleration F64
standard_gravity = |x| meters_per_second_per_second(Convert.standard_gravity_to_meters_per_second_per_second(x))

## Convert a acceleration to a number of standard gravity.
to_standard_gravity : Acceleration F64 -> F64
to_standard_gravity = |@Quantity(x)| Convert.meters_per_second_per_second_to_standard_gravity(x)

# Area

## Parse a number as a area in square meters.
square_meters : F64 -> Area F64
square_meters = |x| @Quantity(x)

## Convert a area to a number of square meters.
to_square_meters : Area F64 -> F64
to_square_meters = |@Quantity(x)| x

## Parse a number as a area in square feet.
square_feet : F64 -> Area F64
square_feet = |x| square_meters(Convert.square_feet_to_square_meters(x))

## Convert a area to a number of square feet.
to_square_feet : Area F64 -> F64
to_square_feet = |@Quantity(x)| Convert.square_meters_to_square_feet(x)

# Capacitance

## Parse a number as a capacitance in farads (F).
farads : F64 -> Capacitance F64
farads = |x| @Quantity(x)

## Convert a capacitance to a number of farads (F).
to_farads : Capacitance F64 -> F64
to_farads = |@Quantity(x)| x

# Charge

## Parse a number as a charge in coulombs (C).
coulombs : F64 -> Charge F64
coulombs = |x| @Quantity(x)

## Convert a charge to a number of coulombs (C).
to_coulombs : Charge F64 -> F64
to_coulombs = |@Quantity(x)| x

## Parse a number as a charge in elementary charges (e).
elementary_charges : F64 -> Charge F64
elementary_charges = |x| coulombs(Convert.elementary_charges_to_coulombs(x))

## Convert a charge to a number of elementary charges (e).
to_elementary_charges : Charge F64 -> F64
to_elementary_charges = |@Quantity(x)| Convert.coulombs_to_elementary_charges(x)

# Current

## Parse a number as a current in amperes (A).
amperes : F64 -> Current F64
amperes = |x| @Quantity(x)

## Convert a current to a number of amperes (A).
to_amperes : Current F64 -> F64
to_amperes = |@Quantity(x)| x

# Data

## Parse a number as a data in bits (b).
bits : F64 -> Data F64
bits = |x| @Quantity(x)

## Convert a data to a number of bits (b).
to_bits : Data F64 -> F64
to_bits = |@Quantity(x)| x

## Parse a number as a data in bytes (B).
bytes : F64 -> Data F64
bytes = |x| bits(Convert.bytes_to_bits(x))

## Convert a data to a number of bytes (B).
to_bytes : Data F64 -> F64
to_bytes = |@Quantity(x)| Convert.bits_to_bytes(x)

## Parse a number as a data in nibbles.
nibbles : F64 -> Data F64
nibbles = |x| bits(Convert.nibbles_to_bits(x))

## Convert a data to a number of nibbles.
to_nibbles : Data F64 -> F64
to_nibbles = |@Quantity(x)| Convert.bits_to_nibbles(x)

# Energy

## Parse a number as a energy in joules (J).
joules : F64 -> Energy F64
joules = |x| @Quantity(x)

## Convert a energy to a number of joules (J).
to_joules : Energy F64 -> F64
to_joules = |@Quantity(x)| x

## Parse a number as a energy in calories.
calories : F64 -> Energy F64
calories = |x| joules(Convert.calories_to_joules(x))

## Convert a energy to a number of calories.
to_calories : Energy F64 -> F64
to_calories = |@Quantity(x)| Convert.joules_to_calories(x)

## Parse a number as a energy in foot pound-force (ft·lbf).
foot_pound_force : F64 -> Energy F64
foot_pound_force = |x| joules(Convert.foot_pound_force_to_joules(x))

## Convert a energy to a number of foot pound-force (ft·lbf).
to_foot_pound_force : Energy F64 -> F64
to_foot_pound_force = |@Quantity(x)| Convert.joules_to_foot_pound_force(x)

## Parse a number as a energy in kilocalories.
kilocalories : F64 -> Energy F64
kilocalories = |x| joules(Convert.kilocalories_to_joules(x))

## Convert a energy to a number of kilocalories.
to_kilocalories : Energy F64 -> F64
to_kilocalories = |@Quantity(x)| Convert.joules_to_kilocalories(x)

## Parse a number as a energy in kilowatt hours (kWh).
kilowatt_hours : F64 -> Energy F64
kilowatt_hours = |x| joules(Convert.kilowatt_hours_to_joules(x))

## Convert a energy to a number of kilowatt hours (kWh).
to_kilowatt_hours : Energy F64 -> F64
to_kilowatt_hours = |@Quantity(x)| Convert.joules_to_kilowatt_hours(x)

# Force

## Parse a number as a force in newtons (N).
newtons : F64 -> Force F64
newtons = |x| @Quantity(x)

## Convert a force to a number of newtons (N).
to_newtons : Force F64 -> F64
to_newtons = |@Quantity(x)| x

## Parse a number as a force in pound-force (lbf).
pound_force : F64 -> Force F64
pound_force = |x| newtons(Convert.pound_force_to_newtons(x))

## Convert a force to a number of pound-force (lbf).
to_pound_force : Force F64 -> F64
to_pound_force = |@Quantity(x)| Convert.newtons_to_pound_force(x)

# Inductance

## Parse a number as a inductance in henrys (H).
henrys : F64 -> Inductance F64
henrys = |x| @Quantity(x)

## Convert a inductance to a number of henrys (H).
to_henrys : Inductance F64 -> F64
to_henrys = |@Quantity(x)| x

# Length

## Parse a number as a length in meters (m).
meters : F64 -> Length F64
meters = |x| @Quantity(x)

## Convert a length to a number of meters (m).
to_meters : Length F64 -> F64
to_meters = |@Quantity(x)| x

## Parse a number as a length in angstroms.
angstroms : F64 -> Length F64
angstroms = |x| meters(Convert.angstroms_to_meters(x))

## Convert a length to a number of angstroms.
to_angstroms : Length F64 -> F64
to_angstroms = |@Quantity(x)| Convert.meters_to_angstroms(x)

## Parse a number as a length in astronomical units (AU).
astronomical_units : F64 -> Length F64
astronomical_units = |x| meters(Convert.astronomical_units_to_meters(x))

## Convert a length to a number of astronomical units (AU).
to_astronomical_units : Length F64 -> F64
to_astronomical_units = |@Quantity(x)| Convert.meters_to_astronomical_units(x)

## Parse a number as a length in centimeters (cm).
centimeters : F64 -> Length F64
centimeters = |x| meters(Convert.centimeters_to_meters(x))

## Convert a length to a number of centimeters (cm).
to_centimeters : Length F64 -> F64
to_centimeters = |@Quantity(x)| Convert.meters_to_centimeters(x)

## Parse a number as a length in feet (ft).
feet : F64 -> Length F64
feet = |x| meters(Convert.feet_to_meters(x))

## Convert a length to a number of feet (ft).
to_feet : Length F64 -> F64
to_feet = |@Quantity(x)| Convert.meters_to_feet(x)

## Parse a number as a length in inches (in).
inches : F64 -> Length F64
inches = |x| meters(Convert.inches_to_meters(x))

## Convert a length to a number of inches (in).
to_inches : Length F64 -> F64
to_inches = |@Quantity(x)| Convert.meters_to_inches(x)

## Parse a number as a length in kilometers (km).
kilometers : F64 -> Length F64
kilometers = |x| meters(Convert.kilometers_to_meters(x))

## Convert a length to a number of kilometers (km).
to_kilometers : Length F64 -> F64
to_kilometers = |@Quantity(x)| Convert.meters_to_kilometers(x)

## Parse a number as a length in light years (ly).
light_years : F64 -> Length F64
light_years = |x| meters(Convert.light_years_to_meters(x))

## Convert a length to a number of light years (ly).
to_light_years : Length F64 -> F64
to_light_years = |@Quantity(x)| Convert.meters_to_light_years(x)

## Parse a number as a length in miles (mi).
miles : F64 -> Length F64
miles = |x| meters(Convert.miles_to_meters(x))

## Convert a length to a number of miles (mi).
to_miles : Length F64 -> F64
to_miles = |@Quantity(x)| Convert.meters_to_miles(x)

## Parse a number as a length in nautical miles.
nautical_miles : F64 -> Length F64
nautical_miles = |x| meters(Convert.nautical_miles_to_meters(x))

## Convert a length to a number of nautical miles.
to_nautical_miles : Length F64 -> F64
to_nautical_miles = |@Quantity(x)| Convert.meters_to_nautical_miles(x)

# Magnetic flux

## Parse a number as a magnetic flux in webers (Wb).
webers : F64 -> MagneticFlux F64
webers = |x| @Quantity(x)

## Convert a magnetic flux to a number of webers (Wb).
to_webers : MagneticFlux F64 -> F64
to_webers = |@Quantity(x)| x

# Mass

## Parse a number as a mass in kilograms (kg).
kilograms : F64 -> Mass F64
kilograms = |x| @Quantity(x)

## Convert a mass to a number of kilograms (kg).
to_kilograms : Mass F64 -> F64
to_kilograms = |@Quantity(x)| x

## Parse a number as a mass in grams (g).
grams : F64 -> Mass F64
grams = |x| kilograms(Convert.grams_to_kilograms(x))

## Convert a mass to a number of grams (g).
to_grams : Mass F64 -> F64
to_grams = |@Quantity(x)| Convert.kilograms_to_grams(x)

## Parse a number as a mass in ounces (oz).
ounces : F64 -> Mass F64
ounces = |x| kilograms(Convert.ounces_to_kilograms(x))

## Convert a mass to a number of ounces (oz).
to_ounces : Mass F64 -> F64
to_ounces = |@Quantity(x)| Convert.kilograms_to_ounces(x)

## Parse a number as a mass in pounds (lb).
pounds : F64 -> Mass F64
pounds = |x| kilograms(Convert.pounds_to_kilograms(x))

## Convert a mass to a number of pounds (lb).
to_pounds : Mass F64 -> F64
to_pounds = |@Quantity(x)| Convert.kilograms_to_pounds(x)

## Parse a number as a mass in tonnes (T).
tonnes : F64 -> Mass F64
tonnes = |x| kilograms(Convert.tonnes_to_kilograms(x))

## Convert a mass to a number of tonnes (T).
to_tonnes : Mass F64 -> F64
to_tonnes = |@Quantity(x)| Convert.kilograms_to_tonnes(x)

## Parse a number as a mass in tons.
tons : F64 -> Mass F64
tons = |x| kilograms(Convert.tons_to_kilograms(x))

## Convert a mass to a number of tons.
to_tons : Mass F64 -> F64
to_tons = |@Quantity(x)| Convert.kilograms_to_tons(x)

# Power

## Parse a number as a power in watts (W).
watts : F64 -> Power F64
watts = |x| @Quantity(x)

## Convert a power to a number of watts (W).
to_watts : Power F64 -> F64
to_watts = |@Quantity(x)| x

## Parse a number as a power in horsepower (hp).
horsepower : F64 -> Power F64
horsepower = |x| watts(Convert.horsepower_to_watts(x))

## Convert a power to a number of horsepower (hp).
to_horsepower : Power F64 -> F64
to_horsepower = |@Quantity(x)| Convert.watts_to_horsepower(x)

# Pressure

## Parse a number as a pressure in pascals (Pa).
pascals : F64 -> Pressure F64
pascals = |x| @Quantity(x)

## Convert a pressure to a number of pascals (Pa).
to_pascals : Pressure F64 -> F64
to_pascals = |@Quantity(x)| x

## Parse a number as a pressure in atmospheres.
atmospheres : F64 -> Pressure F64
atmospheres = |x| pascals(Convert.atmospheres_to_pascals(x))

## Convert a pressure to a number of atmospheres.
to_atmospheres : Pressure F64 -> F64
to_atmospheres = |@Quantity(x)| Convert.pascals_to_atmospheres(x)

## Parse a number as a pressure in bars.
bars : F64 -> Pressure F64
bars = |x| pascals(Convert.bars_to_pascals(x))

## Convert a pressure to a number of bars.
to_bars : Pressure F64 -> F64
to_bars = |@Quantity(x)| Convert.pascals_to_bars(x)

# Resistance

## Parse a number as a resistance in ohms (Ω).
ohms : F64 -> Resistance F64
ohms = |x| @Quantity(x)

## Convert a resistance to a number of ohms (Ω).
to_ohms : Resistance F64 -> F64
to_ohms = |@Quantity(x)| x

# Speed

## Parse a number as a speed in meters per second (m·s⁻¹).
meters_per_second : F64 -> Speed F64
meters_per_second = |x| @Quantity(x)

## Convert a speed to a number of meters per second (m·s⁻¹).
to_meters_per_second : Speed F64 -> F64
to_meters_per_second = |@Quantity(x)| x

## Parse a number as a speed in feet per second (ft·s⁻¹).
feet_per_second : F64 -> Speed F64
feet_per_second = |x| meters_per_second(Convert.feet_per_second_to_meters_per_second(x))

## Convert a speed to a number of feet per second (ft·s⁻¹).
to_feet_per_second : Speed F64 -> F64
to_feet_per_second = |@Quantity(x)| Convert.meters_per_second_to_feet_per_second(x)

## Parse a number as a speed in kilometers per hour (kph).
kilometers_per_hour : F64 -> Speed F64
kilometers_per_hour = |x| meters_per_second(Convert.kilometers_per_hour_to_meters_per_second(x))

## Convert a speed to a number of kilometers per hour (kph).
to_kilometers_per_hour : Speed F64 -> F64
to_kilometers_per_hour = |@Quantity(x)| Convert.meters_per_second_to_kilometers_per_hour(x)

## Parse a number as a speed in knots.
knots : F64 -> Speed F64
knots = |x| meters_per_second(Convert.knots_to_meters_per_second(x))

## Convert a speed to a number of knots.
to_knots : Speed F64 -> F64
to_knots = |@Quantity(x)| Convert.meters_per_second_to_knots(x)

## Parse a number as a speed in light speed (c).
light_speed : F64 -> Speed F64
light_speed = |x| meters_per_second(Convert.light_speed_to_meters_per_second(x))

## Convert a speed to a number of light speed (c).
to_light_speed : Speed F64 -> F64
to_light_speed = |@Quantity(x)| Convert.meters_per_second_to_light_speed(x)

## Parse a number as a speed in mach.
mach : F64 -> Speed F64
mach = |x| meters_per_second(Convert.mach_to_meters_per_second(x))

## Convert a speed to a number of mach.
to_mach : Speed F64 -> F64
to_mach = |@Quantity(x)| Convert.meters_per_second_to_mach(x)

## Parse a number as a speed in miles per hour (mph).
miles_per_hour : F64 -> Speed F64
miles_per_hour = |x| meters_per_second(Convert.miles_per_hour_to_meters_per_second(x))

## Convert a speed to a number of miles per hour (mph).
to_miles_per_hour : Speed F64 -> F64
to_miles_per_hour = |@Quantity(x)| Convert.meters_per_second_to_miles_per_hour(x)

# Time

## Parse a number as a time in seconds (s).
seconds : F64 -> Time F64
seconds = |x| @Quantity(x)

## Convert a time to a number of seconds (s).
to_seconds : Time F64 -> F64
to_seconds = |@Quantity(x)| x

## Parse a number as a time in days.
days : F64 -> Time F64
days = |x| seconds(Convert.days_to_seconds(x))

## Convert a time to a number of days.
to_days : Time F64 -> F64
to_days = |@Quantity(x)| Convert.seconds_to_days(x)

## Parse a number as a time in hours.
hours : F64 -> Time F64
hours = |x| seconds(Convert.hours_to_seconds(x))

## Convert a time to a number of hours.
to_hours : Time F64 -> F64
to_hours = |@Quantity(x)| Convert.seconds_to_hours(x)

## Parse a number as a time in minutes.
minutes : F64 -> Time F64
minutes = |x| seconds(Convert.minutes_to_seconds(x))

## Convert a time to a number of minutes.
to_minutes : Time F64 -> F64
to_minutes = |@Quantity(x)| Convert.seconds_to_minutes(x)

## Parse a number as a time in weeks.
weeks : F64 -> Time F64
weeks = |x| seconds(Convert.weeks_to_seconds(x))

## Convert a time to a number of weeks.
to_weeks : Time F64 -> F64
to_weeks = |@Quantity(x)| Convert.seconds_to_weeks(x)

# Voltage

## Parse a number as a voltage in volts (V).
volts : F64 -> Voltage F64
volts = |x| @Quantity(x)

## Convert a voltage to a number of volts (V).
to_volts : Voltage F64 -> F64
to_volts = |@Quantity(x)| x

# Volume

## Parse a number as a volume in liters (L).
liters : F64 -> Volume F64
liters = |x| @Quantity(x)

## Convert a volume to a number of liters (L).
to_liters : Volume F64 -> F64
to_liters = |@Quantity(x)| x

## Parse a number as a volume in cubic centimeters (cm³).
cubic_centimeters : F64 -> Volume F64
cubic_centimeters = |x| liters(Convert.cubic_centimeters_to_liters(x))

## Convert a volume to a number of cubic centimeters (cm³).
to_cubic_centimeters : Volume F64 -> F64
to_cubic_centimeters = |@Quantity(x)| Convert.liters_to_cubic_centimeters(x)

## Parse a number as a volume in cubic inches (in³).
cubic_inches : F64 -> Volume F64
cubic_inches = |x| liters(Convert.cubic_inches_to_liters(x))

## Convert a volume to a number of cubic inches (in³).
to_cubic_inches : Volume F64 -> F64
to_cubic_inches = |@Quantity(x)| Convert.liters_to_cubic_inches(x)

## Parse a number as a volume in cubic meters.
cubic_meters : F64 -> Volume F64
cubic_meters = |x| liters(Convert.cubic_meters_to_liters(x))

## Convert a volume to a number of cubic meters.
to_cubic_meters : Volume F64 -> F64
to_cubic_meters = |@Quantity(x)| Convert.liters_to_cubic_meters(x)

## Parse a number as a volume in gallons.
gallons : F64 -> Volume F64
gallons = |x| liters(Convert.gallons_to_liters(x))

## Convert a volume to a number of gallons.
to_gallons : Volume F64 -> F64
to_gallons = |@Quantity(x)| Convert.liters_to_gallons(x)

## Parse a number as a volume in pints.
pints : F64 -> Volume F64
pints = |x| liters(Convert.pints_to_liters(x))

## Convert a volume to a number of pints.
to_pints : Volume F64 -> F64
to_pints = |@Quantity(x)| Convert.liters_to_pints(x)

## Parse a number as a volume in quarts.
quarts : F64 -> Volume F64
quarts = |x| liters(Convert.quarts_to_liters(x))

## Convert a volume to a number of quarts.
to_quarts : Volume F64 -> F64
to_quarts = |@Quantity(x)| Convert.liters_to_quarts(x)

## Parse a number as a volume in tablespoons (tbsp).
tablespoons : F64 -> Volume F64
tablespoons = |x| liters(Convert.tablespoons_to_liters(x))

## Convert a volume to a number of tablespoons (tbsp).
to_tablespoons : Volume F64 -> F64
to_tablespoons = |@Quantity(x)| Convert.liters_to_tablespoons(x)

## Parse a number as a volume in teaspoons (tsp).
teaspoons : F64 -> Volume F64
teaspoons = |x| liters(Convert.teaspoons_to_liters(x))

## Convert a volume to a number of teaspoons (tsp).
to_teaspoons : Volume F64 -> F64
to_teaspoons = |@Quantity(x)| Convert.liters_to_teaspoons(x)
