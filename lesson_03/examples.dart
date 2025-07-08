// LESSON 3: Inheritance Examples - Formula 1
// Run with: dart examples.dart

void main() {
  print('🏁 Formula 1 OOP: Inheritance Examples 🏁\n');

  example1_BasicInheritance();
  example2_MethodOverriding();
  example3_SuperKeyword();
  example4_ComplexHierarchy();
}

// =============================================================================
// EXAMPLE 1: Basic Inheritance - Vehicle Hierarchy
// =============================================================================

void example1_BasicInheritance() {
  print('📖 EXAMPLE 1: Basic Inheritance');
  print('=' * 35);

  // Create base vehicle
  Vehicle truck = Vehicle('Mercedes', 150, 'Diesel');
  truck.start();
  truck.displayInfo();

  print('');

  // Create F1 car (inherits from Vehicle)
  F1Car redBull = F1Car('Honda', 350, 'Hybrid', 'Red Bull Racing', 95);
  redBull.start(); // Inherited method
  redBull.displayInfo(); // Inherited method
  redBull.deployDRS(); // New method specific to F1Car
  redBull.adjustAero(98); // New method specific to F1Car

  print('');
}

// Base class
class Vehicle {
  String engine;
  int maxSpeed;
  String fuelType;
  bool isRunning = false;

  Vehicle(this.engine, this.maxSpeed, this.fuelType);

  void start() {
    isRunning = true;
    print('🔥 $engine engine started');
  }

  void stop() {
    isRunning = false;
    print('🛑 Engine stopped');
  }

  void displayInfo() {
    print('🚗 Engine: $engine, Max Speed: ${maxSpeed}km/h, Fuel: $fuelType');
  }
}

// Derived class
class F1Car extends Vehicle {
  String team;
  int aerodynamics;
  bool drsActive = false;

  F1Car(
    String engine,
    int maxSpeed,
    String fuelType,
    this.team,
    this.aerodynamics,
  ) : super(engine, maxSpeed, fuelType);

  void deployDRS() {
    if (!drsActive) {
      drsActive = true;
      print('⚡ DRS deployed! Aerodynamic drag reduced');
    } else {
      print('⚠️  DRS already active');
    }
  }

  void adjustAero(int newLevel) {
    aerodynamics = newLevel;
    print('🔧 Aerodynamics adjusted to level $aerodynamics');
  }
}

// =============================================================================
// EXAMPLE 2: Method Overriding
// =============================================================================

void example2_MethodOverriding() {
  print('📖 EXAMPLE 2: Method Overriding');
  print('=' * 32);

  // Create different types of racers
  List<Racer> racers = [
    Racer('John Smith'),
    F1Driver('Lewis Hamilton', 'Mercedes', 103),
    RookieDriver('Oscar Piastri', 'McLaren', 2023),
  ];

  // Each racer introduces themselves differently
  for (var racer in racers) {
    racer.introduce();
    racer.celebrate();
    print('');
  }
}

class Racer {
  String name;

  Racer(this.name);

  void introduce() {
    print('👋 Hello, I\'m $name, a racing driver');
  }

  void celebrate() {
    print('🎉 Great race!');
  }
}

class F1Driver extends Racer {
  String team;
  int careerWins;

  F1Driver(String name, this.team, this.careerWins) : super(name);

  @override
  void introduce() {
    print('🏆 I\'m $name from $team with $careerWins career wins');
  }

  @override
  void celebrate() {
    print('🥇 Another victory for $team! Career win #${careerWins + 1}!');
  }

  void analyzeTelemetry() {
    print('📊 $name is analyzing car telemetry data');
  }
}

class RookieDriver extends F1Driver {
  int debutYear;

  RookieDriver(String name, String team, this.debutYear) : super(name, team, 0);

  @override
  void introduce() {
    print('🌟 I\'m $name, rookie driver for $team (debut: $debutYear)');
  }

  @override
  void celebrate() {
    print('😄 My first points in Formula 1! This is amazing!');
  }

  void learnFromVeteran(F1Driver veteran) {
    print('📚 $name is learning from veteran ${veteran.name}');
  }
}

// =============================================================================
// EXAMPLE 3: Using super keyword
// =============================================================================

void example3_SuperKeyword() {
  print('📖 EXAMPLE 3: Super Keyword Usage');
  print('=' * 33);

  ModernF1Car mercedes = ModernF1Car(
    'Mercedes-AMG',
    340,
    'Hybrid',
    'Mercedes-AMG F1',
    92,
    hasERS: true,
    hasDAS: false,
  );

  mercedes.start();
  mercedes.activateERS();
  mercedes.displayFullInfo();

  print('');
}

class RacingCar {
  String brand;
  int maxSpeed;
  String powerUnit;
  bool isStarted = false;

  RacingCar(this.brand, this.maxSpeed, this.powerUnit);

  void start() {
    isStarted = true;
    print('🚀 $brand racing car started');
  }

  void displayInfo() {
    print('🏎️  Brand: $brand, Max Speed: ${maxSpeed}km/h');
  }
}

class ModernF1Car extends RacingCar {
  String team;
  int downforce;
  bool hasERS;
  bool hasDAS;
  bool ersActive = false;

  ModernF1Car(
    String brand,
    int maxSpeed,
    String powerUnit,
    this.team,
    this.downforce, {
    required this.hasERS,
    required this.hasDAS,
  }) : super(brand, maxSpeed, powerUnit);

  @override
  void start() {
    super.start(); // Call parent method first
    print('🔋 F1 systems initializing...');
    print('✅ $team F1 car ready for qualifying');
  }

  void activateERS() {
    if (hasERS && !ersActive) {
      ersActive = true;
      print('⚡ ERS activated! Extra 160hp for 33 seconds');
    }
  }

  void displayFullInfo() {
    super.displayInfo(); // Call parent method
    print('🏁 Team: $team, Downforce: ${downforce}kg');
    print('🔧 ERS: ${hasERS ? "Available" : "Not available"}');
    print('🔧 DAS: ${hasDAS ? "Available" : "Not available"}');
  }
}

// =============================================================================
// EXAMPLE 4: Complex Inheritance Hierarchy
// =============================================================================

void example4_ComplexHierarchy() {
  print('📖 EXAMPLE 4: Complex Inheritance Hierarchy');
  print('=' * 42);

  // Create different motorsport vehicles
  KartRacer kart = KartRacer('Tony Kart', 80, 'Rookie Class');
  FormulaRookie f3Car = FormulaRookie('Dallara F3', 270, 'F3 Championship', 3);
  FormulaTwo f2Car = FormulaTwo('Dallara F2', 320, 'F2 Championship', 8, true);
  FormulaOne f1Car = FormulaOne(
    'Red Bull RB19',
    350,
    'F1 Championship',
    22,
    true,
    'Red Bull Racing',
  );

  List<MotorsportVehicle> vehicles = [kart, f3Car, f2Car, f1Car];

  print('🏁 Motorsport Progression Ladder:');
  for (var vehicle in vehicles) {
    vehicle.displayCategory();
    vehicle.race();
    print('');
  }
}

// Base class for all motorsport vehicles
abstract class MotorsportVehicle {
  String model;
  int maxSpeed;
  String series;

  MotorsportVehicle(this.model, this.maxSpeed, this.series);

  void race() {
    print('🏃 Racing in $series');
  }

  void displayCategory(); // Abstract method - must be implemented
}

// Karting - entry level
class KartRacer extends MotorsportVehicle {
  String category;

  KartRacer(String model, int maxSpeed, this.category)
    : super(model, maxSpeed, 'Karting');

  @override
  void displayCategory() {
    print('🛺 Kart: $model ($category) - Entry level motorsport');
  }

  @override
  void race() {
    super.race();
    print('   Learning basic racing fundamentals');
  }
}

// Formula categories - junior formulas
class FormulaRookie extends MotorsportVehicle {
  int weekendRounds;

  FormulaRookie(String model, int maxSpeed, String series, this.weekendRounds)
    : super(model, maxSpeed, series);

  @override
  void displayCategory() {
    print('🏎️  Formula Car: $model - Junior Formula');
  }

  @override
  void race() {
    super.race();
    print('   $weekendRounds rounds per weekend');
  }
}

class FormulaTwo extends FormulaRookie {
  bool hasDRS;

  FormulaTwo(
    String model,
    int maxSpeed,
    String series,
    int weekendRounds,
    this.hasDRS,
  ) : super(model, maxSpeed, series, weekendRounds);

  @override
  void displayCategory() {
    print('🏁 F2 Car: $model - Gateway to Formula 1');
  }

  @override
  void race() {
    super.race();
    print('   DRS system: ${hasDRS ? "Available" : "Not available"}');
  }
}

class FormulaOne extends FormulaTwo {
  String team;

  FormulaOne(
    String model,
    int maxSpeed,
    String series,
    int weekendRounds,
    bool hasDRS,
    this.team,
  ) : super(model, maxSpeed, series, weekendRounds, hasDRS);

  @override
  void displayCategory() {
    print('👑 F1 Car: $model ($team) - Pinnacle of Motorsport');
  }

  @override
  void race() {
    print('🏃 Racing in $series with $team');
    print('   Most advanced racing technology available');
    print('   Global championship with ${weekendRounds}+ races');
  }

  void strategize() {
    print('🧠 $team developing advanced race strategy');
  }
}
