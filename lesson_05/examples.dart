// LESSON 5: Abstraction Examples - Interfaces and Mixins
// Run with: dart examples.dart

void main() {
  print('🏁 Welcome to Formula 1 Abstraction! 🏁\n');

  example1_abstractClasses();
  print('\n${'=' * 60}\n');

  example2_mixins();
  print('\n${'=' * 60}\n');

  example3_composition();
  print('\n${'=' * 60}\n');

  example4_completeSystem();

  print('\n🏆 End of abstraction examples! Try practice.dart next');
}

// =============================================================================
// EXAMPLE 1: Abstract classes - Vehicle hierarchy
// =============================================================================

abstract class Vehicle {
  String name;
  int maxSpeed;

  Vehicle(this.name, this.maxSpeed);

  // Abstract methods - must be implemented
  void startEngine();
  void accelerate();
  void brake();

  // Concrete method - shared implementation
  void displayInfo() {
    print('🏎️  Vehicle: $name (Max: ${maxSpeed}km/h)');
  }

  // Template method pattern
  void prepareForRace() {
    print('🔧 Preparing $name for race...');
    startEngine();
    warmUpEngine();
    print('✅ $name ready to race!\n');
  }

  void warmUpEngine() {
    print('🔥 Warming up engine...');
  }
}

class F1Car extends Vehicle {
  String team;

  F1Car(String name, this.team) : super(name, 350);

  @override
  void startEngine() {
    print('🚀 F1 hybrid engine starting...');
    print('   ERS system online - 1000HP ready!');
  }

  @override
  void accelerate() {
    print('⚡ $name accelerating with hybrid boost!');
    print('   0-200km/h in 4.4 seconds!');
  }

  @override
  void brake() {
    print('🔥 Carbon-ceramic brakes engaged!');
    print('   300-0km/h in 65 meters!');
  }
}

class KartCar extends Vehicle {
  KartCar(String name) : super(name, 120);

  @override
  void startEngine() {
    print('🏁 Kart engine starting...');
    print('   Simple 2-stroke engine ready!');
  }

  @override
  void accelerate() {
    print('💨 $name accelerating quickly!');
    print('   Lightweight = instant response!');
  }

  @override
  void brake() {
    print('🛑 Mechanical disc brakes!');
    print('   Direct, responsive braking!');
  }
}

void example1_abstractClasses() {
  print('📖 EXAMPLE 1: Abstract Classes');
  print('=' * 33);

  List<Vehicle> vehicles = [
    F1Car('RB19', 'Red Bull Racing'),
    KartCar('Tony Kart Racer'),
    F1Car('SF-23', 'Ferrari'),
  ];

  for (var vehicle in vehicles) {
    vehicle.displayInfo();
    vehicle.prepareForRace();
  }
}

// =============================================================================
// EXAMPLE 2: Mixins - Adding capabilities
// =============================================================================

mixin Communicable {
  List<String> messageHistory = [];

  void sendRadioMessage(String message) {
    messageHistory.add(message);
    print('📻 Radio: "$message"');
  }

  void receiveMessage(String message) {
    print('📻 Received: "$message"');
  }

  void showMessageHistory() {
    print('📜 Message history:');
    for (int i = 0; i < messageHistory.length; i++) {
      print('   ${i + 1}. ${messageHistory[i]}');
    }
  }
}

mixin DRSCapable {
  bool _drsEnabled = false;
  int drsUsage = 0;

  bool get isDRSActive => _drsEnabled;

  void activateDRS() {
    if (!_drsEnabled) {
      _drsEnabled = true;
      drsUsage++;
      print('💨 DRS activated! Wing open (+15km/h)');
    } else {
      print('⚠️  DRS already active!');
    }
  }

  void deactivateDRS() {
    if (_drsEnabled) {
      _drsEnabled = false;
      print('🛑 DRS deactivated - wing closed');
    }
  }

  void showDRSStats() {
    print('📊 DRS used $drsUsage times this session');
  }
}

mixin TelemetryAware {
  Map<String, double> telemetryData = {};

  void updateTelemetry(String parameter, double value) {
    telemetryData[parameter] = value;
  }

  void displayTelemetry() {
    print('📊 Telemetry Data:');
    telemetryData.forEach((key, value) {
      print('   $key: $value');
    });
  }

  double? getTelemetryValue(String parameter) {
    return telemetryData[parameter];
  }
}

class ModernF1Car extends Vehicle
    with Communicable, DRSCapable, TelemetryAware {
  String driver;

  ModernF1Car(String name, this.driver) : super(name, 350);

  @override
  void startEngine() {
    print('🔥 $name engine starting...');
    sendRadioMessage('Engine online - all systems go!');
    updateTelemetry('Engine Temp', 87.5);
    updateTelemetry('Battery', 100.0);
  }

  @override
  void accelerate() {
    String drsStatus = isDRSActive ? 'with DRS' : 'normal mode';
    print('🚀 $name accelerating $drsStatus');
    updateTelemetry('Speed', isDRSActive ? 315.0 : 300.0);
  }

  @override
  void brake() {
    print('🔥 $name braking hard');
    deactivateDRS(); // Auto-close DRS when braking
    updateTelemetry('Speed', 120.0);
  }

  void performOvertake() {
    print('\n🎯 $driver attempting overtake...');
    activateDRS();
    accelerate();
    sendRadioMessage('Going for the move!');
    print('');
  }
}

void example2_mixins() {
  print('📖 EXAMPLE 2: Mixins - Multiple Capabilities');
  print('=' * 44);

  ModernF1Car redbull = ModernF1Car('RB19', 'Max Verstappen');

  redbull.startEngine();
  print('');

  redbull.performOvertake();

  redbull.sendRadioMessage('Great car today, team!');
  redbull.updateTelemetry('Tire Temp', 95.3);

  print('Current status:');
  redbull.displayTelemetry();
  redbull.showDRSStats();
  redbull.showMessageHistory();
}

// =============================================================================
// EXAMPLE 3: Composition - Building complex objects
// =============================================================================

class Engine {
  String type;
  int horsepower;
  double temperature;

  Engine(this.type, this.horsepower) : temperature = 20.0;

  void start() {
    temperature = 85.0;
    print('🔥 $type engine started (${horsepower}HP)');
  }

  void tune() {
    horsepower += 50;
    print('🔧 Engine tuned to ${horsepower}HP');
  }
}

class Tyres {
  String compound;
  double pressure;
  int lapCount;

  Tyres(this.compound, this.pressure) : lapCount = 0;

  void adjustPressure(double newPressure) {
    pressure = newPressure;
    print('🔧 Tire pressure set to ${pressure}bar');
  }

  void completeLap() {
    lapCount++;
    if (lapCount > 20) {
      print('⚠️  Tires degrading after $lapCount laps');
    }
  }
}

class Aerodynamics {
  int frontWing;
  int rearWing;
  double downforce;

  Aerodynamics(this.frontWing, this.rearWing)
    : downforce = (frontWing + rearWing) * 0.1;

  void setDownforce(int front, int rear) {
    frontWing = front;
    rearWing = rear;
    downforce = (front + rear) * 0.1;
    print('🌪️  Aerodynamics: F$front/R$rear (${downforce}kg downforce)');
  }
}

class ComplexF1Car {
  String name;
  String team;
  Engine engine;
  Tyres tyres;
  Aerodynamics aero;

  ComplexF1Car(this.name, this.team, this.engine, this.tyres, this.aero);

  void setupForQualifying() {
    print('🏆 Setting up $name for qualifying...');
    engine.tune();
    tyres.adjustPressure(1.8);
    aero.setDownforce(10, 5); // Low downforce for speed
    print('✅ Qualifying setup complete!\n');
  }

  void setupForRace() {
    print('🏁 Setting up $name for race...');
    tyres.adjustPressure(2.0);
    aero.setDownforce(15, 10); // High downforce for stability
    print('✅ Race setup complete!\n');
  }

  void simulateLap() {
    engine.start();
    tyres.completeLap();
    print('⏱️  Lap completed in 1:20.123');
  }
}

void example3_composition() {
  print('📖 EXAMPLE 3: Composition - Complex Car Assembly');
  print('=' * 50);

  // Building a car from components
  Engine v6Turbo = Engine('V6 Turbo Hybrid', 1000);
  Tyres softTires = Tyres('Soft', 1.9);
  Aerodynamics aeroPackage = Aerodynamics(12, 8);

  ComplexF1Car ferrari = ComplexF1Car(
    'SF-23',
    'Ferrari',
    v6Turbo,
    softTires,
    aeroPackage,
  );

  ferrari.setupForQualifying();
  ferrari.simulateLap();

  ferrari.setupForRace();
  ferrari.simulateLap();
}

// =============================================================================
// EXAMPLE 4: Complete system combining all concepts
// =============================================================================

abstract class RaceParticipant {
  String name;
  int points;

  RaceParticipant(this.name) : points = 0;

  void prepareForSession();
  void participateInSession();
  void finishSession(int position);
}

mixin Strategical {
  String _currentStrategy = 'Default';
  List<String> strategyHistory = [];

  String get currentStrategy => _currentStrategy;

  void changeStrategy(String strategy) {
    strategyHistory.add(_currentStrategy);
    _currentStrategy = strategy;
    print('🎯 Strategy: $_currentStrategy');
  }

  void showStrategyHistory() {
    print(
      '📋 Strategy changes: ${strategyHistory.join(' -> ')} -> $_currentStrategy',
    );
  }
}

mixin PerformanceTracker {
  List<double> lapTimes = [];
  double bestLapTime = 999.0;

  void recordLapTime(double time) {
    lapTimes.add(time);
    if (time < bestLapTime) {
      bestLapTime = time;
      print('🎯 New personal best: ${time.toStringAsFixed(3)}s');
    }
  }

  void showPerformance() {
    if (lapTimes.isNotEmpty) {
      double avgTime = lapTimes.reduce((a, b) => a + b) / lapTimes.length;
      print(
        '📊 Performance: Best ${bestLapTime.toStringAsFixed(3)}s, Average ${avgTime.toStringAsFixed(3)}s',
      );
    }
  }
}

class ProfessionalF1Driver extends RaceParticipant
    with Communicable, Strategical, PerformanceTracker {
  String team;

  ProfessionalF1Driver(String name, this.team) : super(name);

  @override
  void prepareForSession() {
    print('🏎️  $name ($team) preparing...');
    sendRadioMessage('Radio check - can you hear me?');
    changeStrategy('Conservative');
  }

  @override
  void participateInSession() {
    print('🏁 $name on track!');

    // Simulate some laps
    recordLapTime(81.234);
    changeStrategy('Attack Mode');
    recordLapTime(80.567);
    recordLapTime(80.891);

    sendRadioMessage('Car feels good, pushing hard!');
  }

  @override
  void finishSession(int position) {
    points += [25, 18, 15, 12, 10, 8, 6, 4, 2, 1][position - 1] ?? 0;
    print(
      '🏆 $name finished P$position (+${[25, 18, 15, 12, 10, 8, 6, 4, 2, 1][position - 1] ?? 0} points)',
    );
    sendRadioMessage('Great job team! P$position today');

    showPerformance();
    showStrategyHistory();
  }
}

void example4_completeSystem() {
  print('📖 EXAMPLE 4: Complete Racing System');
  print('=' * 38);

  ProfessionalF1Driver hamilton = ProfessionalF1Driver(
    'Lewis Hamilton',
    'Mercedes',
  );
  ProfessionalF1Driver verstappen = ProfessionalF1Driver(
    'Max Verstappen',
    'Red Bull',
  );

  List<ProfessionalF1Driver> drivers = [hamilton, verstappen];

  print('🏆 MONACO GRAND PRIX SIMULATION\n');

  // Qualifying session
  print('🎯 QUALIFYING SESSION');
  print('=' * 20);
  for (var driver in drivers) {
    driver.prepareForSession();
    driver.participateInSession();
    print('');
  }

  // Race finish
  print('🏁 RACE RESULTS');
  print('=' * 15);
  verstappen.finishSession(1);
  hamilton.finishSession(2);

  print('\n📊 CHAMPIONSHIP STANDINGS');
  print('=' * 25);
  drivers.sort((a, b) => b.points.compareTo(a.points));
  for (int i = 0; i < drivers.length; i++) {
    print('P${i + 1}: ${drivers[i].name} - ${drivers[i].points} points');
  }
}

/*
KEY ABSTRACTIONS DEMONSTRATED:

1. ABSTRACT CLASSES:
   - Vehicle: Common interface for all vehicles
   - RaceParticipant: Template for race participation

2. MIXINS:
   - Communicable: Radio communication capability
   - DRSCapable: DRS system functionality
   - TelemetryAware: Data collection and monitoring
   - Strategical: Strategy management
   - PerformanceTracker: Lap time tracking

3. COMPOSITION:
   - ComplexF1Car: Built from Engine, Tyres, Aerodynamics
   - Flexible assembly of components

4. BENEFITS:
   - Clean separation of concerns
   - Reusable functionality through mixins
   - Easy to test individual components
   - Flexible and maintainable code

NEXT: Create your own abstraction layers in practice.dart!
*/
