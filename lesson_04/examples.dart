// LESSON 4: Polymorphism Examples - Different Driving Styles
// Run with: dart examples.dart

void main() {
  print('🏁 Welcome to Formula 1 Polymorphism! 🏁\n');

  example1_drivingStyles();
  print('\n${'=' * 60}\n');

  example2_carTypes();
  print('\n${'=' * 60}\n');

  example3_weatherConditions();
  print('\n${'=' * 60}\n');

  example4_teamStrategies();

  print('\n🏆 End of polymorphism examples! Try practice.dart next');
}

// =============================================================================
// EXAMPLE 1: Different driving styles
// =============================================================================

class Driver {
  String name;
  String team;
  int skillLevel;

  Driver(this.name, this.team, this.skillLevel);

  void performOvertake() {
    print('🏎️  $name performs a standard overtake');
  }

  void defendPosition() {
    print('🛡️  $name defends position normally');
  }

  void celebrate() {
    print('🎉 $name celebrates the victory!');
  }

  void displayInfo() {
    print('Driver: $name ($team) - Skill: $skillLevel/100');
  }
}

class AggressiveDriver extends Driver {
  AggressiveDriver(String name, String team, int skillLevel)
    : super(name, team, skillLevel);

  @override
  void performOvertake() {
    print('💥 $name makes a BOLD aggressive overtake on the inside!');
    print('   Taking huge risks for the position!');
  }

  @override
  void defendPosition() {
    print('🚫 $name aggressively blocks the racing line!');
    print('   Hard but fair racing!');
  }

  @override
  void celebrate() {
    print('🔥 $name pumps fist aggressively! WHAT A DRIVE!');
  }
}

class TechnicalDriver extends Driver {
  TechnicalDriver(String name, String team, int skillLevel)
    : super(name, team, skillLevel);

  @override
  void performOvertake() {
    print('🧠 $name calculates the perfect overtaking moment');
    print('   Waits for DRS zone and slipstream advantage');
  }

  @override
  void defendPosition() {
    print('📐 $name uses racing lines strategically');
    print('   Technical positioning makes overtaking difficult');
  }

  @override
  void celebrate() {
    print('🎯 $name raises hand calmly - another calculated victory');
  }
}

class DefensiveDriver extends Driver {
  DefensiveDriver(String name, String team, int skillLevel)
    : super(name, team, skillLevel);

  @override
  void performOvertake() {
    print('🔍 $name waits for opponent mistakes');
    print('   Patience and tire conservation strategy');
  }

  @override
  void defendPosition() {
    print('🏰 $name builds an impenetrable defense!');
    print('   Master of defensive positioning');
  }

  @override
  void celebrate() {
    print('😌 $name smiles quietly - experience wins again');
  }
}

void example1_drivingStyles() {
  print('📖 EXAMPLE 1: Different Driving Styles');
  print('=' * 40);

  List<Driver> drivers = [
    AggressiveDriver('Max Verstappen', 'Red Bull', 98),
    TechnicalDriver('Lewis Hamilton', 'Mercedes', 96),
    DefensiveDriver('Fernando Alonso', 'Aston Martin', 94),
    Driver('Logan Sargeant', 'Williams', 75), // Regular driver
  ];

  print('Grid positions:');
  for (int i = 0; i < drivers.length; i++) {
    print('P${i + 1}: ${drivers[i].name}');
  }

  print('\n🏁 Race simulation:');
  for (var driver in drivers) {
    driver.displayInfo();
  }

  print('\n🔄 Overtaking attempts:');
  for (var driver in drivers) {
    driver.performOvertake(); // Polymorphic behavior!
    print('');
  }

  print('🛡️  Defending positions:');
  for (var driver in drivers) {
    driver.defendPosition(); // Different defense styles!
    print('');
  }

  print('🏆 Victory celebrations:');
  drivers[0].celebrate(); // Winner celebrates in their style
}

// =============================================================================
// EXAMPLE 2: Different car configurations
// =============================================================================

abstract class RaceCar {
  String model;
  String team;
  int maxSpeed;

  RaceCar(this.model, this.team, this.maxSpeed);

  void accelerate(); // Abstract method - must be implemented
  void brake(); // Abstract method - must be implemented
  void applyDRS(); // Abstract method - must be implemented

  void startEngine() {
    print('🔥 $model engine starting... Ready to race!');
  }

  void displaySpecs() {
    print('Car: $model ($team) - Max Speed: ${maxSpeed}km/h');
  }
}

class F1Car extends RaceCar {
  F1Car(String model, String team) : super(model, team, 350);

  @override
  void accelerate() {
    print('🚀 $model: Hybrid power unit unleashed!');
    print('   0-200km/h in 4.4 seconds with ERS boost');
  }

  @override
  void brake() {
    print('🔥 $model: Carbon-ceramic brakes from 300km/h');
    print('   Stopping distance: incredible 65 meters');
  }

  @override
  void applyDRS() {
    print('💨 $model: DRS activated! Rear wing opens');
    print('   +15km/h speed advantage on straights');
  }
}

class KartCar extends RaceCar {
  KartCar(String model, String team) : super(model, team, 120);

  @override
  void accelerate() {
    print('⚡ $model: Quick acceleration due to lightweight');
    print('   0-100km/h in 3.2 seconds - amazing power-to-weight');
  }

  @override
  void brake() {
    print('🛑 $model: Mechanical disc brakes');
    print('   Direct feel and immediate response');
  }

  @override
  void applyDRS() {
    print('🏎️  $model: No DRS system in karting');
    print('   Pure racing skill without electronic aids');
  }
}

class FormulaECar extends RaceCar {
  FormulaECar(String model, String team) : super(model, team, 280);

  @override
  void accelerate() {
    print('⚡ $model: Electric motors provide instant torque');
    print('   Silent but deadly acceleration profile');
  }

  @override
  void brake() {
    print('🔋 $model: Regenerative braking recovers energy');
    print('   Charging battery while slowing down');
  }

  @override
  void applyDRS() {
    print('💨 $model: Attack Mode activated instead of DRS');
    print('   +35kW power boost for 4 minutes');
  }
}

void example2_carTypes() {
  print('📖 EXAMPLE 2: Different Car Types');
  print('=' * 35);

  List<RaceCar> cars = [
    F1Car('RB19', 'Red Bull Racing'),
    KartCar('Tony Kart Racer 401R', 'CRG Team'),
    FormulaECar('GEN3 EVO', 'Jaguar TCS Racing'),
  ];

  for (var car in cars) {
    car.displaySpecs();
    car.startEngine();
    print('');
    car.accelerate();
    car.brake();
    car.applyDRS();
    print('\n${'~' * 30}\n');
  }
}

// =============================================================================
// EXAMPLE 3: Weather conditions affecting driving
// =============================================================================

abstract class WeatherCondition {
  String condition;
  double visibility; // 0.0 to 1.0

  WeatherCondition(this.condition, this.visibility);

  void affectDriving(Driver driver);
  void recommendTyres();

  void displayCondition() {
    print('Weather: $condition (Visibility: ${(visibility * 100).toInt()}%)');
  }
}

class SunnyWeather extends WeatherCondition {
  SunnyWeather() : super('Sunny', 1.0);

  @override
  void affectDriving(Driver driver) {
    print('☀️  Perfect conditions for ${driver.name}');
    print('   Maximum grip and visibility - push to the limit!');
  }

  @override
  void recommendTyres() {
    print('🏎️  Recommended: Soft compound for maximum performance');
  }
}

class RainyWeather extends WeatherCondition {
  RainyWeather() : super('Heavy Rain', 0.4);

  @override
  void affectDriving(Driver driver) {
    print('🌧️  Challenging conditions for ${driver.name}');
    print('   Reduced grip - careful with throttle and braking!');
  }

  @override
  void recommendTyres() {
    print('🌊 Recommended: Full wet tyres for safety');
  }
}

class FoggyWeather extends WeatherCondition {
  FoggyWeather() : super('Dense Fog', 0.2);

  @override
  void affectDriving(Driver driver) {
    print('🌫️  Extremely limited visibility for ${driver.name}');
    print('   Safety car likely - follow racing line carefully!');
  }

  @override
  void recommendTyres() {
    print('👁️  Recommended: Intermediate tyres with extreme caution');
  }
}

void example3_weatherConditions() {
  print('📖 EXAMPLE 3: Weather Impact on Driving');
  print('=' * 42);

  Driver hamilton = TechnicalDriver('Lewis Hamilton', 'Mercedes', 96);

  List<WeatherCondition> conditions = [
    SunnyWeather(),
    RainyWeather(),
    FoggyWeather(),
  ];

  for (var weather in conditions) {
    weather.displayCondition();
    weather.affectDriving(hamilton); // Polymorphic weather effects!
    weather.recommendTyres();
    print('\n${'~' * 25}\n');
  }
}

// =============================================================================
// EXAMPLE 4: Team strategies
// =============================================================================

abstract class TeamStrategy {
  String strategyName;
  String team;

  TeamStrategy(this.strategyName, this.team);

  void planPitStops();
  void manageTyres();
  void reactToSafetyCar();

  void displayStrategy() {
    print('Strategy: $strategyName ($team)');
  }
}

class AggressiveStrategy extends TeamStrategy {
  AggressiveStrategy(String team) : super('All-Out Attack', team);

  @override
  void planPitStops() {
    print('🔴 $team: Minimal pit stops - go for track position!');
    print('   Risk everything for the win');
  }

  @override
  void manageTyres() {
    print('🔥 Push the tyres to maximum performance');
    print('   Extract every tenth of a second');
  }

  @override
  void reactToSafetyCar() {
    print('⚡ Immediate pit stop opportunity!');
    print('   Take fresh tyres and charge through the field');
  }
}

class ConservativeStrategy extends TeamStrategy {
  ConservativeStrategy(String team) : super('Points Finish', team);

  @override
  void planPitStops() {
    print('🟢 $team: Strategic pit windows to avoid traffic');
    print('   Consistent pace for reliable points');
  }

  @override
  void manageTyres() {
    print('🧠 Preserve tyre life for consistent lap times');
    print('   Think about the championship, not just this race');
  }

  @override
  void reactToSafetyCar() {
    print('🤔 Analyze risk vs reward carefully');
    print('   Protect current position if in points');
  }
}

void example4_teamStrategies() {
  print('📖 EXAMPLE 4: Team Strategy Polymorphism');
  print('=' * 43);

  List<TeamStrategy> strategies = [
    AggressiveStrategy('Red Bull Racing'),
    ConservativeStrategy('Mercedes'),
    AggressiveStrategy('Ferrari'),
  ];

  print('🏁 Race situation: 20 laps remaining, Safety Car deployed\n');

  for (var strategy in strategies) {
    strategy.displayStrategy();
    strategy.planPitStops();
    strategy.manageTyres();
    strategy.reactToSafetyCar();
    print('\n${'~' * 35}\n');
  }
}

// =============================================================================
// POLYMORPHISM DEMONSTRATION FUNCTION
// =============================================================================

void demonstratePolymorphism() {
  print('🔄 POLYMORPHISM IN ACTION');
  print('=' * 30);

  // Same list type (Driver), different behaviors!
  List<Driver> mixedGrid = [
    AggressiveDriver('Verstappen', 'Red Bull', 98),
    TechnicalDriver('Hamilton', 'Mercedes', 96),
    DefensiveDriver('Alonso', 'Aston Martin', 94),
  ];

  // Same method call, different implementations!
  for (var driver in mixedGrid) {
    driver.performOvertake(); // Polymorphic magic! ✨
  }
}

/*
KEY TAKEAWAYS:

1. POLYMORPHISM = Same interface, different behavior
2. @override ensures we're actually overriding parent methods
3. Abstract classes force subclasses to implement methods
4. Lists can hold objects of different subclasses
5. Dart runtime determines which method to call (late binding)

BENEFITS:
- Flexible and extensible code
- Easy to add new types without changing existing code
- Clean and readable interfaces
- Real-world modeling of different behaviors

NEXT: Learn about Abstraction and Interfaces!
*/
