// LESSON 4: Solutions - Polymorphism
// Run with: dart solutions.dart

import 'dart:math';

void main() {
  print('Solutions for Lesson 4: Polymorphism\n');

  solution1();
  print('\n${'=' * 50}\n');

  solution2();
  print('\n${'=' * 50}\n');

  solution3();
  print('\n${'=' * 50}\n');

  solution4();
  print('\n${'=' * 50}\n');

  solution5();

  print('\nAll polymorphism solutions completed!');
}

// =============================================================================
// SOLUTION 1: Different tire types
// =============================================================================

abstract class Tire {
  String compound;
  int durability;
  double grip;

  Tire(this.compound, this.durability, this.grip);

  void performanceDuringRace();
  void degradeOverTime();
}

class SoftTire extends Tire {
  SoftTire() : super('Soft', 15, 0.9);

  @override
  void performanceDuringRace() {
    print('🔴 Soft tire: Maximum grip and speed!');
    print('   Perfect for qualifying and short stints');
  }

  @override
  void degradeOverTime() {
    print('⚠️  Degrades quickly - ${durability} laps maximum');
    print('   Performance drops rapidly after 10 laps');
  }
}

class MediumTire extends Tire {
  MediumTire() : super('Medium', 25, 0.7);

  @override
  void performanceDuringRace() {
    print('🟡 Medium tire: Balanced performance');
    print('   Good for versatile race strategies');
  }

  @override
  void degradeOverTime() {
    print('📊 Consistent degradation - ${durability} laps lifespan');
    print('   Predictable performance drop');
  }
}

class HardTire extends Tire {
  HardTire() : super('Hard', 40, 0.5);

  @override
  void performanceDuringRace() {
    print('⚪ Hard tire: Lower grip but consistent');
    print('   Perfect for long stint strategies');
  }

  @override
  void degradeOverTime() {
    print('💪 Extremely durable - ${durability} laps possible');
    print('   Slow but steady degradation');
  }
}

class WetTire extends Tire {
  WetTire() : super('Wet', 20, 0.8);

  @override
  void performanceDuringRace() {
    print('🌧️  Wet tire: Maximum water displacement');
    print('   Essential for rainy conditions');
  }

  @override
  void degradeOverTime() {
    print('🌊 Weather dependent - ${durability} laps in wet');
    print('   Degrades fast on dry track!');
  }
}

void solution1() {
  print('SOLUTION 1: Different tire types');
  print('=' * 32);

  List<Tire> tireSet = [SoftTire(), MediumTire(), HardTire(), WetTire()];

  for (var tire in tireSet) {
    print('Compound: ${tire.compound} (Grip: ${tire.grip})');
    tire.performanceDuringRace();
    tire.degradeOverTime();
    print('');
  }
}

// =============================================================================
// SOLUTION 2: Racing flags
// =============================================================================

abstract class RacingFlag {
  String color;
  String meaning;

  RacingFlag(this.color, this.meaning);

  void displayToDrivers();
}

class GreenFlag extends RacingFlag {
  GreenFlag() : super('Green', 'Race start/restart');

  @override
  void displayToDrivers() {
    print('🟢 GREEN FLAG WAVING!');
    print('   RACE IS ON! Full speed ahead!');
    print('   Give it everything you\'ve got!');
  }
}

class YellowFlag extends RacingFlag {
  YellowFlag() : super('Yellow', 'Caution');

  @override
  void displayToDrivers() {
    print('🟡 YELLOW FLAG - CAUTION!');
    print('   SLOW DOWN - DANGER AHEAD');
    print('   No overtaking until green flag');
  }
}

class RedFlag extends RacingFlag {
  RedFlag() : super('Red', 'Stop race');

  @override
  void displayToDrivers() {
    print('🔴 RED FLAG - STOP IMMEDIATELY!');
    print('   SAFETY ISSUE - RETURN TO PITS');
    print('   Race suspended until further notice');
  }
}

class ChequeredFlag extends RacingFlag {
  ChequeredFlag() : super('Chequered', 'Race finish');

  @override
  void displayToDrivers() {
    print('🏁 CHEQUERED FLAG!');
    print('   RACE FINISHED - CONGRATULATIONS!');
    print('   Proceed to cool-down lap');
  }
}

class BlueFlag extends RacingFlag {
  BlueFlag() : super('Blue', 'Let faster car pass');

  @override
  void displayToDrivers() {
    print('🔵 BLUE FLAG - MOVE ASIDE!');
    print('   FASTER CAR APPROACHING');
    print('   Allow overtake within 3 corners');
  }
}

void solution2() {
  print('SOLUTION 2: Racing flags polymorphism');
  print('=' * 37);

  List<RacingFlag> raceFlags = [
    GreenFlag(),
    YellowFlag(),
    BlueFlag(),
    ChequeredFlag(),
  ];

  print('Race Marshal communicating with drivers:\n');
  for (var flag in raceFlags) {
    flag.displayToDrivers();
    print('');
  }
}

// =============================================================================
// SOLUTION 3: Engine types
// =============================================================================

abstract class Engine {
  int horsepower;
  String fuelType;
  String engineType;

  Engine(this.horsepower, this.fuelType, this.engineType);

  void startEngine();
  void accelerate();
  void engineSound();
}

class V6TurboEngine extends Engine {
  V6TurboEngine() : super(1000, 'Hybrid', 'V6 Turbo Hybrid');

  @override
  void startEngine() {
    print('🔥 V6 Turbo starting...');
    print('   Hybrid system online - ERS ready');
  }

  @override
  void accelerate() {
    print('🚀 Instant torque delivery!');
    print('   Turbo spooling + electric boost');
  }

  @override
  void engineSound() {
    print('🎵 VROOOOM-whistle (turbo) + electric whir');
  }
}

class V8Engine extends Engine {
  V8Engine() : super(750, 'Gasoline', 'Naturally Aspirated V8');

  @override
  void startEngine() {
    print('🔥 V8 roaring to life!');
    print('   Pure mechanical power');
  }

  @override
  void accelerate() {
    print('💪 Raw power delivery!');
    print('   Linear acceleration curve');
  }

  @override
  void engineSound() {
    print('🎵 VROOOOOOM! Classic V8 rumble');
  }
}

class ElectricEngine extends Engine {
  ElectricEngine() : super(400, 'Battery', 'Electric Motor');

  @override
  void startEngine() {
    print('⚡ Electric motor ready...');
    print('   Silent operation mode');
  }

  @override
  void accelerate() {
    print('⚡ Instant maximum torque!');
    print('   No gear changes needed');
  }

  @override
  void engineSound() {
    print('🎵 Whoooosh (wind) + futuristic whir');
  }
}

class V12Engine extends Engine {
  V12Engine() : super(900, 'Gasoline', 'V12 Classic');

  @override
  void startEngine() {
    print('🔥 V12 symphony begins!');
    print('   12 cylinders harmonizing');
  }

  @override
  void accelerate() {
    print('🎶 Smooth power delivery!');
    print('   High-rev screaming machine');
  }

  @override
  void engineSound() {
    print('🎵 EEEEEEEEEE! High-pitched V12 scream');
  }
}

void solution3() {
  print('SOLUTION 3: Engine polymorphism');
  print('=' * 30);

  List<Engine> engines = [
    V6TurboEngine(),
    V8Engine(),
    ElectricEngine(),
    V12Engine(),
  ];

  print('Testing different engines:\n');
  for (var engine in engines) {
    print('Engine: ${engine.engineType}');
    engine.startEngine();
    engine.accelerate();
    engine.engineSound();
    print('HP: ${engine.horsepower}, Fuel: ${engine.fuelType}');
    print('~' * 25);
  }
}

// =============================================================================
// SOLUTION 4: Track surfaces
// =============================================================================

abstract class TrackSurface {
  String surfaceType;
  double gripLevel;
  int temperature;

  TrackSurface(this.surfaceType, this.gripLevel, this.temperature);

  void affectCar(String carName);
  void recommendedSpeed();
  void tireDegradation();
}

class AsphaltSurface extends TrackSurface {
  AsphaltSurface() : super('Asphalt', 0.9, 45);

  @override
  void affectCar(String carName) {
    print('🏎️  $carName: Optimal grip conditions');
    print('   Perfect for maximum attack mode');
  }

  @override
  void recommendedSpeed() {
    print('🚀 Recommended: Full speed - ${temperature}°C surface');
  }

  @override
  void tireDegradation() {
    print('⭐ Normal tire wear - standard degradation');
  }
}

class ConcreteSurface extends TrackSurface {
  ConcreteSurface() : super('Concrete', 0.7, 38);

  @override
  void affectCar(String carName) {
    print('🏗️  $carName: Moderate grip conditions');
    print('   Be careful with aggressive moves');
  }

  @override
  void recommendedSpeed() {
    print('📊 Recommended: 85% speed - ${temperature}°C surface');
  }

  @override
  void tireDegradation() {
    print('🔥 High tire wear - consider strategy');
  }
}

class WetAsphalt extends TrackSurface {
  WetAsphalt() : super('Wet Asphalt', 0.4, 25);

  @override
  void affectCar(String carName) {
    print('🌧️  $carName: Slippery conditions!');
    print('   Hydroplaning risk - extreme caution');
  }

  @override
  void recommendedSpeed() {
    print('⚠️  Recommended: 60% speed - ${temperature}°C wet surface');
  }

  @override
  void tireDegradation() {
    print('💧 Low tire wear but safety priority');
  }
}

class IceSurface extends TrackSurface {
  IceSurface() : super('Ice', 0.1, -5);

  @override
  void affectCar(String carName) {
    print('🧊 $carName: EXTREMELY dangerous!');
    print('   Minimal grip - survival mode only');
  }

  @override
  void recommendedSpeed() {
    print('🚨 Recommended: 20% speed - ${temperature}°C ice!');
  }

  @override
  void tireDegradation() {
    print('❄️  Minimal tire wear but huge crash risk');
  }
}

void solution4() {
  print('SOLUTION 4: Track surface polymorphism');
  print('=' * 37);

  String carName = 'Ferrari SF-75';
  List<TrackSurface> surfaces = [
    AsphaltSurface(),
    ConcreteSurface(),
    WetAsphalt(),
    IceSurface(),
  ];

  for (var surface in surfaces) {
    print('Surface: ${surface.surfaceType} (Grip: ${surface.gripLevel})');
    surface.affectCar(carName);
    surface.recommendedSpeed();
    surface.tireDegradation();
    print('');
  }
}

// =============================================================================
// SOLUTION 5: Race commentator system
// =============================================================================

abstract class RaceCommentator {
  String name;
  int experience;
  String specialty;

  RaceCommentator(this.name, this.experience, this.specialty);

  void commentOnOvertake(String driver1, String driver2);
  void commentOnCrash(String driver);
  void commentOnVictory(String winner);
  String getExcitement();
}

class ExcitedCommentator extends RaceCommentator {
  ExcitedCommentator(String name, int experience, String specialty)
    : super(name, experience, specialty);

  @override
  void commentOnOvertake(String driver1, String driver2) {
    print('🔥 OH MY GOODNESS! $driver1 SENDS IT down the inside!');
    print('   WHAT A MOVE on $driver2! ABSOLUTELY INCREDIBLE!');
  }

  @override
  void commentOnCrash(String driver) {
    print('💥 OH NO! $driver has gone off!');
    print('   That\'s a MASSIVE impact! Safety car incoming!');
  }

  @override
  void commentOnVictory(String winner) {
    print('🏆 $winner WINS! WHAT A DRIVE!');
    print('   LIGHTS OUT AND AWAY WE... oh wait, race is over!');
  }

  @override
  String getExcitement() {
    return 'MAXIMUM ENERGY! 🚀🔥⚡';
  }
}

class TechnicalCommentator extends RaceCommentator {
  TechnicalCommentator(String name, int experience, String specialty)
    : super(name, experience, specialty);

  @override
  void commentOnOvertake(String driver1, String driver2) {
    print('🧠 Excellent positioning by $driver1 there');
    print('   Used the slipstream perfectly to get alongside $driver2');
  }

  @override
  void commentOnCrash(String driver) {
    print('📊 $driver has lost the rear end mid-corner');
    print('   That\'s the aerodynamic balance gone there');
  }

  @override
  void commentOnVictory(String winner) {
    print('🎯 Masterful drive from $winner today');
    print('   Perfect tire management and racecraft');
  }

  @override
  String getExcitement() {
    return 'Controlled analysis 📐🔍';
  }
}

class EmotionalCommentator extends RaceCommentator {
  EmotionalCommentator(String name, int experience, String specialty)
    : super(name, experience, specialty);

  @override
  void commentOnOvertake(String driver1, String driver2) {
    print('😱 I can\'t believe what I\'m seeing!');
    print('   $driver1 has just produced MAGIC against $driver2!');
  }

  @override
  void commentOnCrash(String driver) {
    print('😢 Oh no, not $driver! My heart is in my mouth!');
    print('   This is devastating for the championship!');
  }

  @override
  void commentOnVictory(String winner) {
    print('😭 I\'m getting emotional here!');
    print('   $winner has driven their heart out! Beautiful!');
  }

  @override
  String getExcitement() {
    return 'Pure emotion! 😭❤️🎭';
  }
}

class ComedyCommentator extends RaceCommentator {
  ComedyCommentator(String name, int experience, String specialty)
    : super(name, experience, specialty);

  @override
  void commentOnOvertake(String driver1, String driver2) {
    print('😄 Well, $driver2 just got served a knuckle sandwich!');
    print('   $driver1 went past like $driver2 was standing still!');
  }

  @override
  void commentOnCrash(String driver) {
    print('😅 $driver has gone agricultural there!');
    print('   That\'s more plowing than racing! Hope they\'re okay!');
  }

  @override
  void commentOnVictory(String winner) {
    print('🎪 $winner wins! Time for a victory dance!');
    print('   That was easier than stealing candy from a baby!');
  }

  @override
  String getExcitement() {
    return 'Comedy gold! 😂🎭🃏';
  }
}

void solution5() {
  print('SOLUTION 5: Race commentator polymorphism');
  print('=' * 40);

  List<RaceCommentator> commentators = [
    ExcitedCommentator('David Croft', 15, 'High Energy'),
    TechnicalCommentator('Martin Brundle', 25, 'Technical Analysis'),
    EmotionalCommentator('Murray Walker', 35, 'Emotional Drama'),
    ComedyCommentator('James Hunt', 20, 'Witty Remarks'),
  ];

  print('RACE BROADCAST SYSTEM\n');

  for (var commentator in commentators) {
    print('${commentator.name} (${commentator.experience} years) commenting:');
    commentator.commentOnOvertake('Hamilton', 'Verstappen');
    commentator.commentOnVictory('Leclerc');
    print('Style: ${commentator.getExcitement()}');
    print('~' * 30);
  }
}

/*
KEY LEARNINGS FROM POLYMORPHISM:

1. ABSTRACT CLASSES:
   - Define common interface with abstract methods
   - Force all subclasses to implement required behavior
   - Can mix abstract and concrete methods

2. METHOD OVERRIDING:
   - @override annotation ensures method exists in parent
   - Child classes provide specific implementations
   - Same method name, different behaviors

3. POLYMORPHIC LISTS:
   - List<Parent> can hold different child objects
   - Each object responds to method calls differently
   - Runtime determines which method to execute

4. REAL-WORLD MODELING:
   - Polymorphism mirrors real-world differences
   - Same action (overtake) performed differently by different drivers
   - Clean, extensible code design

5. BENEFITS:
   - Add new types without changing existing code
   - Uniform interface for different behaviors
   - Flexible and maintainable codebase
   - Easy testing and debugging

NEXT: Learn about Abstraction and Interfaces for even more flexibility!
*/
