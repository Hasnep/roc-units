module [
    angstromsToMeters,
    astronomicalUnitsToMeters,
    atmospheresToPascals,
    barsToPascals,
    bitsToBytes,
    bitsToNibbles,
    bytesToBits,
    caloriesToJoules,
    caloriesToKiloCalories,
    centimetersToMeters,
    cubicCentimetersToLiters,
    cubicInchesToCubicMeters,
    cubicInchesToGallons,
    cubicInchesToLiters,
    cubicMetersToCubicInches,
    cubicMetersToLiters,
    daysToHours,
    daysToSeconds,
    daysToWeeks,
    feetPerSecondToMetersPerSecond,
    feetToInches,
    feetToMeters,
    feetToMiles,
    feetToYards,
    gallonsToCubicInches,
    gallonsToLiters,
    gallonsToQuarts,
    gramsToKilograms,
    hoursToDays,
    hoursToMinutes,
    hoursToSeconds,
    inchesToFeet,
    inchesToMeters,
    joulesToCalories,
    joulesToKiloCalories,
    joulesToKilowattHours,
    joulesToWattHours,
    kiloCaloriesToCalories,
    kiloCaloriesToJoules,
    kilogramsToGrams,
    kilogramsToOunces,
    kilogramsToPounds,
    kilogramsToTonnes,
    kilogramsToTons,
    kilometersPerHourToMetersPerSecond,
    kilometersToMeters,
    kilowattHoursToJoules,
    kilowattHoursToWattHours,
    knotsToMetersPerSecond,
    lightSpeedToMetersPerSecond,
    lightYearsToMeters,
    litersToCubicCentimeters,
    litersToCubicInches,
    litersToCubicMeters,
    litersToGallons,
    litersToPints,
    litersToQuarts,
    machToMetersPerSecond,
    metersPerSecondPerSecondToStandardGravity,
    metersPerSecondToFeetPerSecond,
    metersPerSecondToKilometersPerHour,
    metersPerSecondToKnots,
    metersPerSecondToLightSpeed,
    metersPerSecondToMach,
    metersPerSecondToMilesPerHour,
    metersToAngstroms,
    metersToAstronomicalUnits,
    metersToCentimeters,
    metersToFeet,
    metersToInches,
    metersToKilometers,
    metersToLightYears,
    metersToMiles,
    metersToNauticalMiles,
    metersToYards,
    milesPerHourToMetersPerSecond,
    milesToFeet,
    milesToMeters,
    minutesToHours,
    minutesToSeconds,
    nauticalMilesToMeters,
    newtonsToPoundForce,
    nibblesToBits,
    ouncesToKilograms,
    ouncesToPounds,
    pascalsToAtmospheres,
    pascalsToBars,
    pintsToLiters,
    pintsToQuarts,
    poundForceToNewtons,
    poundsToKilograms,
    poundsToOunces,
    poundsToTons,
    quartsToGallons,
    quartsToLiters,
    quartsToPints,
    secondsToDays,
    secondsToHours,
    secondsToMinutes,
    secondsToWeeks,
    squareFeetToSquareMeters,
    squareMetersToSquareFeet,
    standardGravityToMetersPerSecondPerSecond,
    tonnesToKilograms,
    tonsToKilograms,
    tonsToPounds,
    wattHoursToJoules,
    wattHoursToKilowattHours,
    weeksToDays,
    weeksToSeconds,
    yardsToFeet,
    yardsToMeters,
]

angstromsToMeters : F64 -> F64
angstromsToMeters = \x -> x * 1e-10
expect
    out = angstromsToMeters 10000000000.000f64
    out |> Num.isApproxEq 1.000f64 {}
astronomicalUnitsToMeters : F64 -> F64
astronomicalUnitsToMeters = \x -> x * 149597870700
expect
    out = astronomicalUnitsToMeters 1.000f64
    out |> Num.isApproxEq 149597870700.000f64 {}
atmospheresToPascals : F64 -> F64
atmospheresToPascals = \x -> x * 101325
expect
    out = atmospheresToPascals 1.000f64
    out |> Num.isApproxEq 101325.000f64 {}
barsToPascals : F64 -> F64
barsToPascals = \x -> x * 1e5
expect
    out = barsToPascals 1.000f64
    out |> Num.isApproxEq 100000.000f64 {}
bitsToBytes : F64 -> F64
bitsToBytes = \x -> (Num.toF64 x) / 8
expect
    out = bitsToBytes 8.000f64
    out |> Num.isApproxEq 1.000f64 {}
bitsToNibbles : F64 -> F64
bitsToNibbles = \x -> (Num.toF64 x) / 4
expect
    out = bitsToNibbles 4.000f64
    out |> Num.isApproxEq 1.000f64 {}
bytesToBits : F64 -> F64
bytesToBits = \x -> x * 8
expect
    out = bytesToBits 1.000f64
    out |> Num.isApproxEq 8.000f64 {}
caloriesToJoules : F64 -> F64
caloriesToJoules = \x -> x * 4.1868
expect
    out = caloriesToJoules 1000.000f64
    out |> Num.isApproxEq 4186.800f64 {}
caloriesToKiloCalories : F64 -> F64
caloriesToKiloCalories = \x -> (Num.toF64 x) / 1000
expect
    out = caloriesToKiloCalories 1000.000f64
    out |> Num.isApproxEq 1.000f64 {}
centimetersToMeters : F64 -> F64
centimetersToMeters = \x -> (Num.toF64 x) / 100
expect
    out = centimetersToMeters 100.000f64
    out |> Num.isApproxEq 1.000f64 {}
cubicCentimetersToLiters : F64 -> F64
cubicCentimetersToLiters = \x -> (Num.toF64 x) / 1000
expect
    out = cubicCentimetersToLiters 1000.000f64
    out |> Num.isApproxEq 1.000f64 {}
cubicInchesToCubicMeters : F64 -> F64
cubicInchesToCubicMeters = \x -> x |> cubicInchesToGallons |> gallonsToLiters |> litersToCubicMeters
cubicInchesToGallons : F64 -> F64
cubicInchesToGallons = \x -> (Num.toF64 x) / 231
expect
    out = cubicInchesToGallons 231.000f64
    out |> Num.isApproxEq 1.000f64 {}
cubicInchesToLiters : F64 -> F64
cubicInchesToLiters = \x -> x |> cubicInchesToGallons |> gallonsToLiters
cubicMetersToCubicInches : F64 -> F64
cubicMetersToCubicInches = \x -> x |> cubicMetersToLiters |> litersToGallons |> gallonsToCubicInches
cubicMetersToLiters : F64 -> F64
cubicMetersToLiters = \x -> x * 1000
expect
    out = cubicMetersToLiters 1.000f64
    out |> Num.isApproxEq 1000.000f64 {}
daysToHours : F64 -> F64
daysToHours = \x -> x * 24
expect
    out = daysToHours 1.000f64
    out |> Num.isApproxEq 24.000f64 {}
daysToSeconds : F64 -> F64
daysToSeconds = \x -> x |> daysToHours |> hoursToMinutes |> minutesToSeconds
expect
    out = daysToSeconds 1.000f64
    out |> Num.isApproxEq 86400.000f64 {}
daysToWeeks : F64 -> F64
daysToWeeks = \x -> (Num.toF64 x) / 7
expect
    out = daysToWeeks 7.000f64
    out |> Num.isApproxEq 1.000f64 {}
feetPerSecondToMetersPerSecond : F64 -> F64
feetPerSecondToMetersPerSecond = \x -> (Num.toF64 x) / (metersToFeet 1)
expect
    out = feetPerSecondToMetersPerSecond 328.084f64
    out |> Num.isApproxEq 100.000f64 {}
feetToInches : F64 -> F64
feetToInches = \x -> x * 12
expect
    out = feetToInches 1.000f64
    out |> Num.isApproxEq 12.000f64 {}
feetToMeters : F64 -> F64
feetToMeters = \x -> x |> feetToYards |> yardsToMeters
expect
    out = feetToMeters 3280.840f64
    out |> Num.isApproxEq 1000.000f64 {}
feetToMiles : F64 -> F64
feetToMiles = \x -> (Num.toF64 x) / 5280
expect
    out = feetToMiles 5280.000f64
    out |> Num.isApproxEq 1.000f64 {}
feetToYards : F64 -> F64
feetToYards = \x -> (Num.toF64 x) / 3
gallonsToCubicInches : F64 -> F64
gallonsToCubicInches = \x -> x * 231
expect
    out = gallonsToCubicInches 1.000f64
    out |> Num.isApproxEq 231.000f64 {}
gallonsToLiters : F64 -> F64
gallonsToLiters = \x -> x |> gallonsToCubicInches |> cubicInchesToCubicMeters |> cubicMetersToLiters
gallonsToQuarts : F64 -> F64
gallonsToQuarts = \x -> x * 4
expect
    out = gallonsToQuarts 1.000f64
    out |> Num.isApproxEq 4.000f64 {}
gramsToKilograms : F64 -> F64
gramsToKilograms = \x -> (Num.toF64 x) / 1000
expect
    out = gramsToKilograms 1000.000f64
    out |> Num.isApproxEq 1.000f64 {}
hoursToDays : F64 -> F64
hoursToDays = \x -> (Num.toF64 x) / 24
expect
    out = hoursToDays 24.000f64
    out |> Num.isApproxEq 1.000f64 {}
hoursToMinutes : F64 -> F64
hoursToMinutes = \x -> x * 60
expect
    out = hoursToMinutes 1.000f64
    out |> Num.isApproxEq 60.000f64 {}
hoursToSeconds : F64 -> F64
hoursToSeconds = \x -> x |> hoursToMinutes |> minutesToSeconds
expect
    out = hoursToSeconds 1.000f64
    out |> Num.isApproxEq 3600.000f64 {}
inchesToFeet : F64 -> F64
inchesToFeet = \x -> (Num.toF64 x) / 12
expect
    out = inchesToFeet 12.000f64
    out |> Num.isApproxEq 1.000f64 {}
inchesToMeters : F64 -> F64
inchesToMeters = \x -> x |> inchesToFeet |> feetToYards |> yardsToMeters
expect
    out = inchesToMeters 39.370f64
    out |> Num.isApproxEq 1.000f64 {}
joulesToCalories : F64 -> F64
joulesToCalories = \x -> (Num.toF64 x) / 4.1868
expect
    out = joulesToCalories 4186.800f64
    out |> Num.isApproxEq 1000.000f64 {}
joulesToKiloCalories : F64 -> F64
joulesToKiloCalories = \x -> x |> joulesToCalories |> caloriesToKiloCalories
joulesToKilowattHours : F64 -> F64
joulesToKilowattHours = \x -> x |> joulesToWattHours |> wattHoursToKilowattHours
expect
    out = joulesToKilowattHours 3600000.000f64
    out |> Num.isApproxEq 1.000f64 {}
joulesToWattHours : F64 -> F64
joulesToWattHours = \x -> (Num.toF64 x) / hoursToSeconds 1
expect
    out = joulesToWattHours 3600.000f64
    out |> Num.isApproxEq 1.000f64 {}
kiloCaloriesToCalories : F64 -> F64
kiloCaloriesToCalories = \x -> x * 1000
expect
    out = kiloCaloriesToCalories 1.000f64
    out |> Num.isApproxEq 1000.000f64 {}
kiloCaloriesToJoules : F64 -> F64
kiloCaloriesToJoules = \x -> x |> kiloCaloriesToCalories |> caloriesToJoules
kilogramsToGrams : F64 -> F64
kilogramsToGrams = \x -> x * 1000
expect
    out = kilogramsToGrams 1.000f64
    out |> Num.isApproxEq 1000.000f64 {}
kilogramsToOunces : F64 -> F64
kilogramsToOunces = \x -> x |> kilogramsToPounds |> poundsToOunces
expect
    out = kilogramsToOunces 1.000f64
    out |> Num.isApproxEq 35.274f64 {}
kilogramsToPounds : F64 -> F64
kilogramsToPounds = \x -> (Num.toF64 x) / 0.45359237
expect
    out = kilogramsToPounds 1000.000f64
    out |> Num.isApproxEq 2204.623f64 {}
kilogramsToTonnes : F64 -> F64
kilogramsToTonnes = \x -> (Num.toF64 x) / 1000
expect
    out = kilogramsToTonnes 1000.000f64
    out |> Num.isApproxEq 1.000f64 {}
kilogramsToTons : F64 -> F64
kilogramsToTons = \x -> x |> kilogramsToPounds |> poundsToTons
expect
    out = kilogramsToTons 907.185f64
    out |> Num.isApproxEq 1.000f64 {}
kilometersPerHourToMetersPerSecond : F64 -> F64
kilometersPerHourToMetersPerSecond = \x -> x * (kilometersToMeters 1 / (1 |> hoursToMinutes |> minutesToSeconds))
expect
    out = kilometersPerHourToMetersPerSecond 36.000f64
    out |> Num.isApproxEq 10.000f64 {}
kilometersToMeters : F64 -> F64
kilometersToMeters = \x -> x * 1000
expect
    out = kilometersToMeters 1.000f64
    out |> Num.isApproxEq 1000.000f64 {}
kilowattHoursToJoules : F64 -> F64
kilowattHoursToJoules = \x -> x |> kilowattHoursToWattHours |> wattHoursToJoules
expect
    out = kilowattHoursToJoules 1.000f64
    out |> Num.isApproxEq 3600000.000f64 {}
kilowattHoursToWattHours : F64 -> F64
kilowattHoursToWattHours = \x -> x * 1000
expect
    out = kilowattHoursToWattHours 1.000f64
    out |> Num.isApproxEq 1000.000f64 {}
knotsToMetersPerSecond : F64 -> F64
knotsToMetersPerSecond = \x -> x * ((nauticalMilesToMeters 1) / (1 |> hoursToMinutes |> minutesToSeconds))
expect
    out = knotsToMetersPerSecond 623.974f64
    out |> Num.isApproxEq 321.000f64 {}
lightSpeedToMetersPerSecond : F64 -> F64
lightSpeedToMetersPerSecond = \x -> x * 299792458
expect
    out = lightSpeedToMetersPerSecond 1.000f64
    out |> Num.isApproxEq 299792458.000f64 {}
lightYearsToMeters : F64 -> F64
lightYearsToMeters = \x -> x * ((lightSpeedToMetersPerSecond 1) * (daysToSeconds (365 + (1 / 4))))
expect
    out = lightYearsToMeters 1.000f64
    out |> Num.isApproxEq 9460730473000000.000f64 {}
litersToCubicCentimeters : F64 -> F64
litersToCubicCentimeters = \x -> x * 1000
expect
    out = litersToCubicCentimeters 1.000f64
    out |> Num.isApproxEq 1000.000f64 {}
litersToCubicInches : F64 -> F64
litersToCubicInches = \x -> x |> litersToCubicMeters |> cubicMetersToCubicInches
litersToCubicMeters : F64 -> F64
litersToCubicMeters = \x -> (Num.toF64 x) / 1000
expect
    out = litersToCubicMeters 1000.000f64
    out |> Num.isApproxEq 1.000f64 {}
litersToGallons : F64 -> F64
litersToGallons = \x -> x |> litersToCubicMeters |> cubicMetersToCubicInches |> cubicInchesToGallons
litersToPints : F64 -> F64
litersToPints = \x -> x |> litersToCubicMeters |> cubicMetersToCubicInches |> cubicInchesToGallons |> gallonsToQuarts |> quartsToPints
litersToQuarts : F64 -> F64
litersToQuarts = \x -> x |> litersToCubicMeters |> cubicMetersToCubicInches |> cubicInchesToGallons |> gallonsToQuarts
machToMetersPerSecond : F64 -> F64
machToMetersPerSecond = \x -> x * 331.46
expect
    out = machToMetersPerSecond 1.000f64
    out |> Num.isApproxEq 331.460f64 {}
metersPerSecondPerSecondToStandardGravity : F64 -> F64
metersPerSecondPerSecondToStandardGravity = \x -> (Num.toF64 x) / 9.80665
metersPerSecondToFeetPerSecond : F64 -> F64
metersPerSecondToFeetPerSecond = \x -> x * (metersToFeet 1)
expect
    out = metersPerSecondToFeetPerSecond 100.000f64
    out |> Num.isApproxEq 328.084f64 {}
metersPerSecondToKilometersPerHour : F64 -> F64
metersPerSecondToKilometersPerHour = \x -> (Num.toF64 x) / (kilometersToMeters 1 / (1 |> hoursToMinutes |> minutesToSeconds))
expect
    out = metersPerSecondToKilometersPerHour 10.000f64
    out |> Num.isApproxEq 36.000f64 {}
metersPerSecondToKnots : F64 -> F64
metersPerSecondToKnots = \x -> (Num.toF64 x) / ((nauticalMilesToMeters 1) / (1 |> hoursToMinutes |> minutesToSeconds))
expect
    out = metersPerSecondToKnots 321.000f64
    out |> Num.isApproxEq 623.974f64 {}
metersPerSecondToLightSpeed : F64 -> F64
metersPerSecondToLightSpeed = \x -> (Num.toF64 x) / 299792458
expect
    out = metersPerSecondToLightSpeed 299792458.000f64
    out |> Num.isApproxEq 1.000f64 {}
metersPerSecondToMach : F64 -> F64
metersPerSecondToMach = \x -> (Num.toF64 x) / 331.46
expect
    out = metersPerSecondToMach 331.460f64
    out |> Num.isApproxEq 1.000f64 {}
metersPerSecondToMilesPerHour : F64 -> F64
metersPerSecondToMilesPerHour = \x -> (Num.toF64 x) / (milesToMeters 1 / (1 |> hoursToMinutes |> minutesToSeconds))
expect
    out = metersPerSecondToMilesPerHour 54.986f64
    out |> Num.isApproxEq 123.000f64 {}
metersToAngstroms : F64 -> F64
metersToAngstroms = \x -> (Num.toF64 x) / 1e-10
expect
    out = metersToAngstroms 1.000f64
    out |> Num.isApproxEq 10000000000.000f64 {}
metersToAstronomicalUnits : F64 -> F64
metersToAstronomicalUnits = \x -> (Num.toF64 x) / 149597870700
expect
    out = metersToAstronomicalUnits 149597870700.000f64
    out |> Num.isApproxEq 1.000f64 {}
metersToCentimeters : F64 -> F64
metersToCentimeters = \x -> x * 100
expect
    out = metersToCentimeters 1.000f64
    out |> Num.isApproxEq 100.000f64 {}
metersToFeet : F64 -> F64
metersToFeet = \x -> x |> metersToYards |> yardsToFeet
expect
    out = metersToFeet 1000.000f64
    out |> Num.isApproxEq 3280.840f64 {}
metersToInches : F64 -> F64
metersToInches = \x -> x |> metersToYards |> yardsToFeet |> feetToInches
expect
    out = metersToInches 1.000f64
    out |> Num.isApproxEq 39.370f64 {}
metersToKilometers : F64 -> F64
metersToKilometers = \x -> (Num.toF64 x) / 1000
expect
    out = metersToKilometers 1000.000f64
    out |> Num.isApproxEq 1.000f64 {}
metersToLightYears : F64 -> F64
metersToLightYears = \x -> (Num.toF64 x) / ((lightSpeedToMetersPerSecond 1) * (daysToSeconds (365 + (1 / 4))))
expect
    out = metersToLightYears 9460730473000000.000f64
    out |> Num.isApproxEq 1.000f64 {}
metersToMiles : F64 -> F64
metersToMiles = \x -> x |> metersToYards |> yardsToFeet |> feetToMiles
expect
    out = metersToMiles 1609.340f64
    out |> Num.isApproxEq 1.000f64 {}
metersToNauticalMiles : F64 -> F64
metersToNauticalMiles = \x -> (Num.toF64 x) / 1852
expect
    out = metersToNauticalMiles 1852.000f64
    out |> Num.isApproxEq 1.000f64 {}
metersToYards : F64 -> F64
metersToYards = \x -> (Num.toF64 x) / 0.9144
milesPerHourToMetersPerSecond : F64 -> F64
milesPerHourToMetersPerSecond = \x -> x * (milesToMeters 1 / (1 |> hoursToMinutes |> minutesToSeconds))
expect
    out = milesPerHourToMetersPerSecond 123.000f64
    out |> Num.isApproxEq 54.986f64 {}
milesToFeet : F64 -> F64
milesToFeet = \x -> x * 5280
expect
    out = milesToFeet 1.000f64
    out |> Num.isApproxEq 5280.000f64 {}
milesToMeters : F64 -> F64
milesToMeters = \x -> x |> milesToFeet |> feetToYards |> yardsToMeters
expect
    out = milesToMeters 1.000f64
    out |> Num.isApproxEq 1609.340f64 {}
minutesToHours : F64 -> F64
minutesToHours = \x -> (Num.toF64 x) / 60
expect
    out = minutesToHours 60.000f64
    out |> Num.isApproxEq 1.000f64 {}
minutesToSeconds : F64 -> F64
minutesToSeconds = \x -> x * 60
expect
    out = minutesToSeconds 1.000f64
    out |> Num.isApproxEq 60.000f64 {}
nauticalMilesToMeters : F64 -> F64
nauticalMilesToMeters = \x -> x * 1852
expect
    out = nauticalMilesToMeters 1.000f64
    out |> Num.isApproxEq 1852.000f64 {}
newtonsToPoundForce : F64 -> F64
newtonsToPoundForce = \x -> x * (poundsToKilograms 1) / (standardGravityToMetersPerSecondPerSecond 1)
nibblesToBits : F64 -> F64
nibblesToBits = \x -> x * 4
expect
    out = nibblesToBits 1.000f64
    out |> Num.isApproxEq 4.000f64 {}
ouncesToKilograms : F64 -> F64
ouncesToKilograms = \x -> x |> ouncesToPounds |> poundsToKilograms
expect
    out = ouncesToKilograms 35.274f64
    out |> Num.isApproxEq 1.000f64 {}
ouncesToPounds : F64 -> F64
ouncesToPounds = \x -> (Num.toF64 x) / 16
expect
    out = ouncesToPounds 16.000f64
    out |> Num.isApproxEq 1.000f64 {}
pascalsToAtmospheres : F64 -> F64
pascalsToAtmospheres = \x -> (Num.toF64 x) / 101325
expect
    out = pascalsToAtmospheres 101325.000f64
    out |> Num.isApproxEq 1.000f64 {}
pascalsToBars : F64 -> F64
pascalsToBars = \x -> (Num.toF64 x) / 1e5
expect
    out = pascalsToBars 100000.000f64
    out |> Num.isApproxEq 1.000f64 {}
pintsToLiters : F64 -> F64
pintsToLiters = \x -> x |> pintsToQuarts |> quartsToGallons |> gallonsToCubicInches |> cubicInchesToCubicMeters |> cubicMetersToLiters
pintsToQuarts : F64 -> F64
pintsToQuarts = \x -> (Num.toF64 x) / 2
poundForceToNewtons : F64 -> F64
poundForceToNewtons = \x -> (Num.toF64 x) / (poundsToKilograms 1) / (standardGravityToMetersPerSecondPerSecond 1)
poundsToKilograms : F64 -> F64
poundsToKilograms = \x -> x * 0.45359237
expect
    out = poundsToKilograms 2204.623f64
    out |> Num.isApproxEq 1000.000f64 {}
poundsToOunces : F64 -> F64
poundsToOunces = \x -> x * 16
expect
    out = poundsToOunces 1.000f64
    out |> Num.isApproxEq 16.000f64 {}
poundsToTons : F64 -> F64
poundsToTons = \x -> (Num.toF64 x) / 2000
expect
    out = poundsToTons 2000.000f64
    out |> Num.isApproxEq 1.000f64 {}
quartsToGallons : F64 -> F64
quartsToGallons = \x -> (Num.toF64 x) / 4
expect
    out = quartsToGallons 4.000f64
    out |> Num.isApproxEq 1.000f64 {}
quartsToLiters : F64 -> F64
quartsToLiters = \x -> x |> quartsToGallons |> gallonsToCubicInches |> cubicInchesToCubicMeters |> cubicMetersToLiters
quartsToPints : F64 -> F64
quartsToPints = \x -> x * 2
secondsToDays : F64 -> F64
secondsToDays = \x -> x |> secondsToMinutes |> minutesToHours |> hoursToDays
expect
    out = secondsToDays 86400.000f64
    out |> Num.isApproxEq 1.000f64 {}
secondsToHours : F64 -> F64
secondsToHours = \x -> x |> secondsToMinutes |> minutesToHours
expect
    out = secondsToHours 3600.000f64
    out |> Num.isApproxEq 1.000f64 {}
secondsToMinutes : F64 -> F64
secondsToMinutes = \x -> (Num.toF64 x) / 60
expect
    out = secondsToMinutes 60.000f64
    out |> Num.isApproxEq 1.000f64 {}
secondsToWeeks : F64 -> F64
secondsToWeeks = \x -> x |> secondsToMinutes |> minutesToHours |> hoursToDays |> daysToWeeks
expect
    out = secondsToWeeks 604800.000f64
    out |> Num.isApproxEq 1.000f64 {}
squareFeetToSquareMeters : F64 -> F64
squareFeetToSquareMeters = \x -> x * (1 |> feetToMeters |> Num.pow 2)
expect
    out = squareFeetToSquareMeters 1076.391f64
    out |> Num.isApproxEq 100.000f64 {}
squareMetersToSquareFeet : F64 -> F64
squareMetersToSquareFeet = \x -> (Num.toF64 x) / (1 |> feetToMeters |> Num.pow 2)
expect
    out = squareMetersToSquareFeet 100.000f64
    out |> Num.isApproxEq 1076.391f64 {}
standardGravityToMetersPerSecondPerSecond : F64 -> F64
standardGravityToMetersPerSecondPerSecond = \x -> x * 9.80665
tonnesToKilograms : F64 -> F64
tonnesToKilograms = \x -> x * 1000
expect
    out = tonnesToKilograms 1.000f64
    out |> Num.isApproxEq 1000.000f64 {}
tonsToKilograms : F64 -> F64
tonsToKilograms = \x -> x |> tonsToPounds |> poundsToKilograms
expect
    out = tonsToKilograms 1.000f64
    out |> Num.isApproxEq 907.185f64 {}
tonsToPounds : F64 -> F64
tonsToPounds = \x -> x * 2000
expect
    out = tonsToPounds 1.000f64
    out |> Num.isApproxEq 2000.000f64 {}
wattHoursToJoules : F64 -> F64
wattHoursToJoules = \x -> x * hoursToSeconds 1
expect
    out = wattHoursToJoules 1.000f64
    out |> Num.isApproxEq 3600.000f64 {}
wattHoursToKilowattHours : F64 -> F64
wattHoursToKilowattHours = \x -> (Num.toF64 x) / 1000
expect
    out = wattHoursToKilowattHours 1000.000f64
    out |> Num.isApproxEq 1.000f64 {}
weeksToDays : F64 -> F64
weeksToDays = \x -> x * 7
expect
    out = weeksToDays 1.000f64
    out |> Num.isApproxEq 7.000f64 {}
weeksToSeconds : F64 -> F64
weeksToSeconds = \x -> x |> weeksToDays |> daysToHours |> hoursToMinutes |> minutesToSeconds
expect
    out = weeksToSeconds 1.000f64
    out |> Num.isApproxEq 604800.000f64 {}
yardsToFeet : F64 -> F64
yardsToFeet = \x -> x * 3
yardsToMeters : F64 -> F64
yardsToMeters = \x -> x * 0.9144
