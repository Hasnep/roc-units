module [
    quantity,
    add,
    sub,
    mul,
    square,
    # Acceleration
    metersPerSecondPerSecond,
    toMetersPerSecondPerSecond,
    standardGravity,
    toStandardGravity,
    # Area
    squareMeters,
    toSquareMeters,
    squareFeet,
    toSquareFeet,
    # Capacitance
    farads,
    toFarads,
    # Charge
    coulombs,
    toCoulombs,
    elementaryCharges,
    toElementaryCharges,
    # Current
    amperes,
    toAmperes,
    # Data
    bits,
    toBits,
    bytes,
    toBytes,
    nibbles,
    toNibbles,
    # Energy
    joules,
    toJoules,
    calories,
    toCalories,
    footPoundForce,
    toFootPoundForce,
    kilocalories,
    toKilocalories,
    kilowattHours,
    toKilowattHours,
    # Force
    newtons,
    toNewtons,
    poundForce,
    toPoundForce,
    # Inductance
    henrys,
    toHenrys,
    # Length
    meters,
    toMeters,
    angstroms,
    toAngstroms,
    astronomicalUnits,
    toAstronomicalUnits,
    centimeters,
    toCentimeters,
    feet,
    toFeet,
    inches,
    toInches,
    kilometers,
    toKilometers,
    lightYears,
    toLightYears,
    miles,
    toMiles,
    nauticalMiles,
    toNauticalMiles,
    # Magnetic flux
    webers,
    toWebers,
    # Mass
    kilograms,
    toKilograms,
    grams,
    toGrams,
    ounces,
    toOunces,
    pounds,
    toPounds,
    tonnes,
    toTonnes,
    tons,
    toTons,
    # Power
    watts,
    toWatts,
    horsepower,
    toHorsepower,
    # Pressure
    pascals,
    toPascals,
    atmospheres,
    toAtmospheres,
    bars,
    toBars,
    # Resistance
    ohms,
    toOhms,
    # Speed
    metersPerSecond,
    toMetersPerSecond,
    feetPerSecond,
    toFeetPerSecond,
    kilometersPerHour,
    toKilometersPerHour,
    knots,
    toKnots,
    lightSpeed,
    toLightSpeed,
    mach,
    toMach,
    milesPerHour,
    toMilesPerHour,
    # Time
    seconds,
    toSeconds,
    days,
    toDays,
    hours,
    toHours,
    minutes,
    toMinutes,
    weeks,
    toWeeks,
    # Voltage
    volts,
    toVolts,
    # Volume
    liters,
    toLiters,
    cubicCentimeters,
    toCubicCentimeters,
    cubicInches,
    toCubicInches,
    cubicMeters,
    toCubicMeters,
    gallons,
    toGallons,
    pints,
    toPints,
    quarts,
    toQuarts,
    tablespoons,
    toTablespoons,
    teaspoons,
    toTeaspoons,
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
quantity = \num, _ -> @Quantity num

add : Quantity F64 units, Quantity F64 units -> Quantity F64 units
add = \@Quantity x, @Quantity y -> @Quantity (x + y)

sub : Quantity F64 units, Quantity F64 units -> Quantity F64 units
sub = \@Quantity x, @Quantity y -> @Quantity (x - y)

mul : Quantity F64 unitsA, Quantity F64 unitsB -> Quantity F64 (Product unitsA unitsB)
mul = \@Quantity x, @Quantity y -> @Quantity (x * y)

square : Quantity F64 units -> Quantity F64 (Squared units)
square = \@Quantity x -> @Quantity (x * x)

expect
    a = meters 10
    out = square a
    out |> isApproxEq (squareMeters 100) {}

isApproxEq : Quantity F64 units, Quantity F64 units, {} -> Bool
isApproxEq = \@Quantity x, @Quantity y, _ -> Num.isApproxEq x y {}
# Acceleration

## Parse a number as a acceleration in meters per second per second (m·s⁻²).
metersPerSecondPerSecond : F64 -> Acceleration F64
metersPerSecondPerSecond = \x -> @Quantity x

## Convert a acceleration to a number of meters per second per second (m·s⁻²).
toMetersPerSecondPerSecond : Acceleration F64 -> F64
toMetersPerSecondPerSecond = \@Quantity x -> x

## Parse a number as a acceleration in standard gravity.
standardGravity : F64 -> Acceleration F64
standardGravity = \x -> metersPerSecondPerSecond (Convert.standardGravityToMetersPerSecondPerSecond x)

## Convert a acceleration to a number of standard gravity.
toStandardGravity : Acceleration F64 -> F64
toStandardGravity = \@Quantity x -> Convert.metersPerSecondPerSecondToStandardGravity x

# Area

## Parse a number as a area in square meters.
squareMeters : F64 -> Area F64
squareMeters = \x -> @Quantity x

## Convert a area to a number of square meters.
toSquareMeters : Area F64 -> F64
toSquareMeters = \@Quantity x -> x

## Parse a number as a area in square feet.
squareFeet : F64 -> Area F64
squareFeet = \x -> squareMeters (Convert.squareFeetToSquareMeters x)

## Convert a area to a number of square feet.
toSquareFeet : Area F64 -> F64
toSquareFeet = \@Quantity x -> Convert.squareMetersToSquareFeet x

# Capacitance

## Parse a number as a capacitance in farads (F).
farads : F64 -> Capacitance F64
farads = \x -> @Quantity x

## Convert a capacitance to a number of farads (F).
toFarads : Capacitance F64 -> F64
toFarads = \@Quantity x -> x

# Charge

## Parse a number as a charge in coulombs (C).
coulombs : F64 -> Charge F64
coulombs = \x -> @Quantity x

## Convert a charge to a number of coulombs (C).
toCoulombs : Charge F64 -> F64
toCoulombs = \@Quantity x -> x

## Parse a number as a charge in elementary charges (e).
elementaryCharges : F64 -> Charge F64
elementaryCharges = \x -> coulombs (Convert.elementaryChargesToCoulombs x)

## Convert a charge to a number of elementary charges (e).
toElementaryCharges : Charge F64 -> F64
toElementaryCharges = \@Quantity x -> Convert.coulombsToElementaryCharges x

# Current

## Parse a number as a current in amperes (A).
amperes : F64 -> Current F64
amperes = \x -> @Quantity x

## Convert a current to a number of amperes (A).
toAmperes : Current F64 -> F64
toAmperes = \@Quantity x -> x

# Data

## Parse a number as a data in bits (b).
bits : F64 -> Data F64
bits = \x -> @Quantity x

## Convert a data to a number of bits (b).
toBits : Data F64 -> F64
toBits = \@Quantity x -> x

## Parse a number as a data in bytes (B).
bytes : F64 -> Data F64
bytes = \x -> bits (Convert.bytesToBits x)

## Convert a data to a number of bytes (B).
toBytes : Data F64 -> F64
toBytes = \@Quantity x -> Convert.bitsToBytes x

## Parse a number as a data in nibbles.
nibbles : F64 -> Data F64
nibbles = \x -> bits (Convert.nibblesToBits x)

## Convert a data to a number of nibbles.
toNibbles : Data F64 -> F64
toNibbles = \@Quantity x -> Convert.bitsToNibbles x

# Energy

## Parse a number as a energy in joules (J).
joules : F64 -> Energy F64
joules = \x -> @Quantity x

## Convert a energy to a number of joules (J).
toJoules : Energy F64 -> F64
toJoules = \@Quantity x -> x

## Parse a number as a energy in calories.
calories : F64 -> Energy F64
calories = \x -> joules (Convert.caloriesToJoules x)

## Convert a energy to a number of calories.
toCalories : Energy F64 -> F64
toCalories = \@Quantity x -> Convert.joulesToCalories x

## Parse a number as a energy in foot pound-force (ft·lbf).
footPoundForce : F64 -> Energy F64
footPoundForce = \x -> joules (Convert.footPoundForceToJoules x)

## Convert a energy to a number of foot pound-force (ft·lbf).
toFootPoundForce : Energy F64 -> F64
toFootPoundForce = \@Quantity x -> Convert.joulesToFootPoundForce x

## Parse a number as a energy in kilocalories.
kilocalories : F64 -> Energy F64
kilocalories = \x -> joules (Convert.kilocaloriesToJoules x)

## Convert a energy to a number of kilocalories.
toKilocalories : Energy F64 -> F64
toKilocalories = \@Quantity x -> Convert.joulesToKilocalories x

## Parse a number as a energy in kilowatt hours (kWh).
kilowattHours : F64 -> Energy F64
kilowattHours = \x -> joules (Convert.kilowattHoursToJoules x)

## Convert a energy to a number of kilowatt hours (kWh).
toKilowattHours : Energy F64 -> F64
toKilowattHours = \@Quantity x -> Convert.joulesToKilowattHours x

# Force

## Parse a number as a force in newtons (N).
newtons : F64 -> Force F64
newtons = \x -> @Quantity x

## Convert a force to a number of newtons (N).
toNewtons : Force F64 -> F64
toNewtons = \@Quantity x -> x

## Parse a number as a force in pound-force (lbf).
poundForce : F64 -> Force F64
poundForce = \x -> newtons (Convert.poundForceToNewtons x)

## Convert a force to a number of pound-force (lbf).
toPoundForce : Force F64 -> F64
toPoundForce = \@Quantity x -> Convert.newtonsToPoundForce x

# Inductance

## Parse a number as a inductance in henrys (H).
henrys : F64 -> Inductance F64
henrys = \x -> @Quantity x

## Convert a inductance to a number of henrys (H).
toHenrys : Inductance F64 -> F64
toHenrys = \@Quantity x -> x

# Length

## Parse a number as a length in meters (m).
meters : F64 -> Length F64
meters = \x -> @Quantity x

## Convert a length to a number of meters (m).
toMeters : Length F64 -> F64
toMeters = \@Quantity x -> x

## Parse a number as a length in angstroms.
angstroms : F64 -> Length F64
angstroms = \x -> meters (Convert.angstromsToMeters x)

## Convert a length to a number of angstroms.
toAngstroms : Length F64 -> F64
toAngstroms = \@Quantity x -> Convert.metersToAngstroms x

## Parse a number as a length in astronomical units (AU).
astronomicalUnits : F64 -> Length F64
astronomicalUnits = \x -> meters (Convert.astronomicalUnitsToMeters x)

## Convert a length to a number of astronomical units (AU).
toAstronomicalUnits : Length F64 -> F64
toAstronomicalUnits = \@Quantity x -> Convert.metersToAstronomicalUnits x

## Parse a number as a length in centimeters (cm).
centimeters : F64 -> Length F64
centimeters = \x -> meters (Convert.centimetersToMeters x)

## Convert a length to a number of centimeters (cm).
toCentimeters : Length F64 -> F64
toCentimeters = \@Quantity x -> Convert.metersToCentimeters x

## Parse a number as a length in feet (ft).
feet : F64 -> Length F64
feet = \x -> meters (Convert.feetToMeters x)

## Convert a length to a number of feet (ft).
toFeet : Length F64 -> F64
toFeet = \@Quantity x -> Convert.metersToFeet x

## Parse a number as a length in inches (in).
inches : F64 -> Length F64
inches = \x -> meters (Convert.inchesToMeters x)

## Convert a length to a number of inches (in).
toInches : Length F64 -> F64
toInches = \@Quantity x -> Convert.metersToInches x

## Parse a number as a length in kilometers (km).
kilometers : F64 -> Length F64
kilometers = \x -> meters (Convert.kilometersToMeters x)

## Convert a length to a number of kilometers (km).
toKilometers : Length F64 -> F64
toKilometers = \@Quantity x -> Convert.metersToKilometers x

## Parse a number as a length in light years (ly).
lightYears : F64 -> Length F64
lightYears = \x -> meters (Convert.lightYearsToMeters x)

## Convert a length to a number of light years (ly).
toLightYears : Length F64 -> F64
toLightYears = \@Quantity x -> Convert.metersToLightYears x

## Parse a number as a length in miles (mi).
miles : F64 -> Length F64
miles = \x -> meters (Convert.milesToMeters x)

## Convert a length to a number of miles (mi).
toMiles : Length F64 -> F64
toMiles = \@Quantity x -> Convert.metersToMiles x

## Parse a number as a length in nautical miles.
nauticalMiles : F64 -> Length F64
nauticalMiles = \x -> meters (Convert.nauticalMilesToMeters x)

## Convert a length to a number of nautical miles.
toNauticalMiles : Length F64 -> F64
toNauticalMiles = \@Quantity x -> Convert.metersToNauticalMiles x

# Magnetic flux

## Parse a number as a magnetic flux in webers (Wb).
webers : F64 -> MagneticFlux F64
webers = \x -> @Quantity x

## Convert a magnetic flux to a number of webers (Wb).
toWebers : MagneticFlux F64 -> F64
toWebers = \@Quantity x -> x

# Mass

## Parse a number as a mass in kilograms (kg).
kilograms : F64 -> Mass F64
kilograms = \x -> @Quantity x

## Convert a mass to a number of kilograms (kg).
toKilograms : Mass F64 -> F64
toKilograms = \@Quantity x -> x

## Parse a number as a mass in grams (g).
grams : F64 -> Mass F64
grams = \x -> kilograms (Convert.gramsToKilograms x)

## Convert a mass to a number of grams (g).
toGrams : Mass F64 -> F64
toGrams = \@Quantity x -> Convert.kilogramsToGrams x

## Parse a number as a mass in ounces (oz).
ounces : F64 -> Mass F64
ounces = \x -> kilograms (Convert.ouncesToKilograms x)

## Convert a mass to a number of ounces (oz).
toOunces : Mass F64 -> F64
toOunces = \@Quantity x -> Convert.kilogramsToOunces x

## Parse a number as a mass in pounds (lb).
pounds : F64 -> Mass F64
pounds = \x -> kilograms (Convert.poundsToKilograms x)

## Convert a mass to a number of pounds (lb).
toPounds : Mass F64 -> F64
toPounds = \@Quantity x -> Convert.kilogramsToPounds x

## Parse a number as a mass in tonnes (T).
tonnes : F64 -> Mass F64
tonnes = \x -> kilograms (Convert.tonnesToKilograms x)

## Convert a mass to a number of tonnes (T).
toTonnes : Mass F64 -> F64
toTonnes = \@Quantity x -> Convert.kilogramsToTonnes x

## Parse a number as a mass in tons.
tons : F64 -> Mass F64
tons = \x -> kilograms (Convert.tonsToKilograms x)

## Convert a mass to a number of tons.
toTons : Mass F64 -> F64
toTons = \@Quantity x -> Convert.kilogramsToTons x

# Power

## Parse a number as a power in watts (W).
watts : F64 -> Power F64
watts = \x -> @Quantity x

## Convert a power to a number of watts (W).
toWatts : Power F64 -> F64
toWatts = \@Quantity x -> x

## Parse a number as a power in horsepower (hp).
horsepower : F64 -> Power F64
horsepower = \x -> watts (Convert.horsepowerToWatts x)

## Convert a power to a number of horsepower (hp).
toHorsepower : Power F64 -> F64
toHorsepower = \@Quantity x -> Convert.wattsToHorsepower x

# Pressure

## Parse a number as a pressure in pascals (Pa).
pascals : F64 -> Pressure F64
pascals = \x -> @Quantity x

## Convert a pressure to a number of pascals (Pa).
toPascals : Pressure F64 -> F64
toPascals = \@Quantity x -> x

## Parse a number as a pressure in atmospheres.
atmospheres : F64 -> Pressure F64
atmospheres = \x -> pascals (Convert.atmospheresToPascals x)

## Convert a pressure to a number of atmospheres.
toAtmospheres : Pressure F64 -> F64
toAtmospheres = \@Quantity x -> Convert.pascalsToAtmospheres x

## Parse a number as a pressure in bars.
bars : F64 -> Pressure F64
bars = \x -> pascals (Convert.barsToPascals x)

## Convert a pressure to a number of bars.
toBars : Pressure F64 -> F64
toBars = \@Quantity x -> Convert.pascalsToBars x

# Resistance

## Parse a number as a resistance in ohms (Ω).
ohms : F64 -> Resistance F64
ohms = \x -> @Quantity x

## Convert a resistance to a number of ohms (Ω).
toOhms : Resistance F64 -> F64
toOhms = \@Quantity x -> x

# Speed

## Parse a number as a speed in meters per second (m·s⁻¹).
metersPerSecond : F64 -> Speed F64
metersPerSecond = \x -> @Quantity x

## Convert a speed to a number of meters per second (m·s⁻¹).
toMetersPerSecond : Speed F64 -> F64
toMetersPerSecond = \@Quantity x -> x

## Parse a number as a speed in feet per second (ft·s⁻¹).
feetPerSecond : F64 -> Speed F64
feetPerSecond = \x -> metersPerSecond (Convert.feetPerSecondToMetersPerSecond x)

## Convert a speed to a number of feet per second (ft·s⁻¹).
toFeetPerSecond : Speed F64 -> F64
toFeetPerSecond = \@Quantity x -> Convert.metersPerSecondToFeetPerSecond x

## Parse a number as a speed in kilometers per hour (kph).
kilometersPerHour : F64 -> Speed F64
kilometersPerHour = \x -> metersPerSecond (Convert.kilometersPerHourToMetersPerSecond x)

## Convert a speed to a number of kilometers per hour (kph).
toKilometersPerHour : Speed F64 -> F64
toKilometersPerHour = \@Quantity x -> Convert.metersPerSecondToKilometersPerHour x

## Parse a number as a speed in knots.
knots : F64 -> Speed F64
knots = \x -> metersPerSecond (Convert.knotsToMetersPerSecond x)

## Convert a speed to a number of knots.
toKnots : Speed F64 -> F64
toKnots = \@Quantity x -> Convert.metersPerSecondToKnots x

## Parse a number as a speed in light speed (c).
lightSpeed : F64 -> Speed F64
lightSpeed = \x -> metersPerSecond (Convert.lightSpeedToMetersPerSecond x)

## Convert a speed to a number of light speed (c).
toLightSpeed : Speed F64 -> F64
toLightSpeed = \@Quantity x -> Convert.metersPerSecondToLightSpeed x

## Parse a number as a speed in mach.
mach : F64 -> Speed F64
mach = \x -> metersPerSecond (Convert.machToMetersPerSecond x)

## Convert a speed to a number of mach.
toMach : Speed F64 -> F64
toMach = \@Quantity x -> Convert.metersPerSecondToMach x

## Parse a number as a speed in miles per hour (mph).
milesPerHour : F64 -> Speed F64
milesPerHour = \x -> metersPerSecond (Convert.milesPerHourToMetersPerSecond x)

## Convert a speed to a number of miles per hour (mph).
toMilesPerHour : Speed F64 -> F64
toMilesPerHour = \@Quantity x -> Convert.metersPerSecondToMilesPerHour x

# Time

## Parse a number as a time in seconds (s).
seconds : F64 -> Time F64
seconds = \x -> @Quantity x

## Convert a time to a number of seconds (s).
toSeconds : Time F64 -> F64
toSeconds = \@Quantity x -> x

## Parse a number as a time in days.
days : F64 -> Time F64
days = \x -> seconds (Convert.daysToSeconds x)

## Convert a time to a number of days.
toDays : Time F64 -> F64
toDays = \@Quantity x -> Convert.secondsToDays x

## Parse a number as a time in hours.
hours : F64 -> Time F64
hours = \x -> seconds (Convert.hoursToSeconds x)

## Convert a time to a number of hours.
toHours : Time F64 -> F64
toHours = \@Quantity x -> Convert.secondsToHours x

## Parse a number as a time in minutes.
minutes : F64 -> Time F64
minutes = \x -> seconds (Convert.minutesToSeconds x)

## Convert a time to a number of minutes.
toMinutes : Time F64 -> F64
toMinutes = \@Quantity x -> Convert.secondsToMinutes x

## Parse a number as a time in weeks.
weeks : F64 -> Time F64
weeks = \x -> seconds (Convert.weeksToSeconds x)

## Convert a time to a number of weeks.
toWeeks : Time F64 -> F64
toWeeks = \@Quantity x -> Convert.secondsToWeeks x

# Voltage

## Parse a number as a voltage in volts (V).
volts : F64 -> Voltage F64
volts = \x -> @Quantity x

## Convert a voltage to a number of volts (V).
toVolts : Voltage F64 -> F64
toVolts = \@Quantity x -> x

# Volume

## Parse a number as a volume in liters (L).
liters : F64 -> Volume F64
liters = \x -> @Quantity x

## Convert a volume to a number of liters (L).
toLiters : Volume F64 -> F64
toLiters = \@Quantity x -> x

## Parse a number as a volume in cubic centimeters (cm³).
cubicCentimeters : F64 -> Volume F64
cubicCentimeters = \x -> liters (Convert.cubicCentimetersToLiters x)

## Convert a volume to a number of cubic centimeters (cm³).
toCubicCentimeters : Volume F64 -> F64
toCubicCentimeters = \@Quantity x -> Convert.litersToCubicCentimeters x

## Parse a number as a volume in cubic inches (in³).
cubicInches : F64 -> Volume F64
cubicInches = \x -> liters (Convert.cubicInchesToLiters x)

## Convert a volume to a number of cubic inches (in³).
toCubicInches : Volume F64 -> F64
toCubicInches = \@Quantity x -> Convert.litersToCubicInches x

## Parse a number as a volume in cubic meters.
cubicMeters : F64 -> Volume F64
cubicMeters = \x -> liters (Convert.cubicMetersToLiters x)

## Convert a volume to a number of cubic meters.
toCubicMeters : Volume F64 -> F64
toCubicMeters = \@Quantity x -> Convert.litersToCubicMeters x

## Parse a number as a volume in gallons.
gallons : F64 -> Volume F64
gallons = \x -> liters (Convert.gallonsToLiters x)

## Convert a volume to a number of gallons.
toGallons : Volume F64 -> F64
toGallons = \@Quantity x -> Convert.litersToGallons x

## Parse a number as a volume in pints.
pints : F64 -> Volume F64
pints = \x -> liters (Convert.pintsToLiters x)

## Convert a volume to a number of pints.
toPints : Volume F64 -> F64
toPints = \@Quantity x -> Convert.litersToPints x

## Parse a number as a volume in quarts.
quarts : F64 -> Volume F64
quarts = \x -> liters (Convert.quartsToLiters x)

## Convert a volume to a number of quarts.
toQuarts : Volume F64 -> F64
toQuarts = \@Quantity x -> Convert.litersToQuarts x

## Parse a number as a volume in tablespoons (tbsp).
tablespoons : F64 -> Volume F64
tablespoons = \x -> liters (Convert.tablespoonsToLiters x)

## Convert a volume to a number of tablespoons (tbsp).
toTablespoons : Volume F64 -> F64
toTablespoons = \@Quantity x -> Convert.litersToTablespoons x

## Parse a number as a volume in teaspoons (tsp).
teaspoons : F64 -> Volume F64
teaspoons = \x -> liters (Convert.teaspoonsToLiters x)

## Convert a volume to a number of teaspoons (tsp).
toTeaspoons : Volume F64 -> F64
toTeaspoons = \@Quantity x -> Convert.litersToTeaspoons x
