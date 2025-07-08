// Simple Formula 1 Championship Simulator Example
// This demonstrates all OOP concepts learned in lessons 1-3
// Run with: dart simple_example.dart

import 'dart:math';

void main() {
  print('🏁 Formula 1 Championship Simulator 🏁\n');

  // Create championship
  Championship f1Championship = Championship(
    '2024 Formula 1 World Championship',
  );

  // Create teams and drivers
  setupTeamsAndDrivers(f1Championship);

  // Create circuits
  List<Circuit> circuits = createCircuits();

  // Run a few races
  print('🏆 Starting championship...\n');

  for (int i = 0; i < 3 && i < circuits.length; i++) {
    Race race = Race(circuits[i], f1Championship.getAllDrivers());
    RaceResult result = race.simulate();
    f1Championship.addRaceResult(result);

    print('');
  }

  // Show final standings
  f1Championship.displayStandings();
}

void setupTeamsAndDrivers(Championship championship) {
  // Create Red Bull Racing
  F1Team redBull = F1Team('Red Bull Racing', 'Austria', 180000000);
  redBull.addDriver(
    F1Driver('Max Verstappen', 26, 'Netherlands', 95, DriverType.superstar),
  );
  redBull.addDriver(
    F1Driver('Sergio Perez', 34, 'Mexico', 85, DriverType.veteran),
  );
  championship.addTeam(redBull);

  // Create Mercedes
  F1Team mercedes = F1Team('Mercedes-AMG F1', 'Germany', 180000000);
  mercedes.addDriver(
    F1Driver('Lewis Hamilton', 39, 'United Kingdom', 98, DriverType.legend),
  );
  mercedes.addDriver(
    F1Driver(
      'George Russell',
      26,
      'United Kingdom',
      88,
      DriverType.experienced,
    ),
  );
  championship.addTeam(mercedes);

  // Create Ferrari
  F1Team ferrari = F1Team('Scuderia Ferrari', 'Italy', 180000000);
  ferrari.addDriver(
    F1Driver('Charles Leclerc', 26, 'Monaco', 92, DriverType.superstar),
  );
  ferrari.addDriver(
    F1Driver('Carlos Sainz Jr', 30, 'Spain', 87, DriverType.experienced),
  );
  championship.addTeam(ferrari);

  print('✅ Teams and drivers created');
}

List<Circuit> createCircuits() {
  return [
    Circuit.street('Monaco Grand Prix', 'Monaco', 3.337, 78),
    Circuit('Silverstone', 'United Kingdom', 5.891, 52),
    Circuit.oval('Indianapolis Motor Speedway', 'USA', 4.023, 4),
    Circuit('Spa-Francorchamps', 'Belgium', 7.004, 19),
    Circuit('Suzuka', 'Japan', 5.807, 17),
  ];
}

// =============================================================================
// CORE CLASSES - Demonstrating OOP Principles
// =============================================================================

// Base class for all drivers (Inheritance & Encapsulation)
abstract class Driver {
  String name;
  int age;
  String country;
  int _skill; // Private field (Encapsulation)
  int _points = 0; // Private field (Encapsulation)

  Driver(this.name, this.age, this.country, this._skill);

  // Getters (Encapsulation)
  int get skill => _skill;
  int get points => _points;

  void addPoints(int racePoints) {
    _points += racePoints;
  }

  // Abstract method (must be implemented by subclasses)
  void celebrate();

  // Method that can be overridden
  void introduce() {
    print('👋 I am $name from $country');
  }
}

enum DriverType { rookie, experienced, veteran, superstar, legend }

// F1Driver extends Driver (Inheritance)
class F1Driver extends Driver {
  DriverType type;

  F1Driver(String name, int age, String country, int skill, this.type)
    : super(name, age, country, skill);

  // Override abstract method (Polymorphism)
  @override
  void celebrate() {
    switch (type) {
      case DriverType.rookie:
        print('😄 $name: My first F1 points!');
        break;
      case DriverType.legend:
        print('🏆 $name: Another victory for the collection!');
        break;
      default:
        print('🎉 $name: Great result for the team!');
    }
  }

  // Override method with custom behavior (Polymorphism)
  @override
  void introduce() {
    print(
      '🏎️  I am $name, ${type.name} F1 driver from $country (skill: $skill)',
    );
  }

  // Calculate race performance based on skill and random factors
  double calculatePerformance() {
    Random random = Random();
    double basePerformance = skill / 100.0;
    double randomFactor = 0.8 + (random.nextDouble() * 0.4); // 0.8 to 1.2
    return basePerformance * randomFactor;
  }
}

// Team class with encapsulation
class F1Team {
  String name;
  String country;
  double _budget; // Private field (Encapsulation)
  List<F1Driver> _drivers = []; // Private field (Encapsulation)
  int _teamPoints = 0; // Private field (Encapsulation)

  F1Team(this.name, this.country, this._budget);

  // Getters (Encapsulation)
  double get budget => _budget;
  int get teamPoints => _teamPoints;
  List<F1Driver> get drivers => List.unmodifiable(_drivers);

  // Controlled access to modify private data
  void addDriver(F1Driver driver) {
    if (_drivers.length < 2) {
      _drivers.add(driver);
      print('✅ ${driver.name} joined $name');
    } else {
      print('❌ Team $name already has maximum drivers');
    }
  }

  void addTeamPoints(int points) {
    _teamPoints += points;
  }

  void spendBudget(double amount, String purpose) {
    if (amount <= _budget) {
      _budget -= amount;
      print('💰 $name spent \$${amount} on $purpose');
    } else {
      print('❌ Insufficient budget for $purpose');
    }
  }
}

// Circuit class with named constructors
class Circuit {
  String name;
  String country;
  double length;
  int corners;
  CircuitType type;

  Circuit(this.name, this.country, this.length, this.corners)
    : type = CircuitType.standard;

  // Named constructor for street circuits
  Circuit.street(this.name, this.country, this.length, int laps)
    : corners = 20,
      type = CircuitType.street;

  // Named constructor for oval circuits
  Circuit.oval(this.name, this.country, this.length, this.corners)
    : type = CircuitType.oval;

  void displayInfo() {
    print(
      '🏁 ${name} (${country}) - ${length}km, ${corners} corners [${type.name}]',
    );
  }

  // Calculate difficulty modifier for lap times
  double getDifficultyModifier() {
    switch (type) {
      case CircuitType.street:
        return 1.2; // Street circuits are harder
      case CircuitType.oval:
        return 0.8; // Ovals are easier
      default:
        return 1.0; // Standard difficulty
    }
  }
}

enum CircuitType { standard, street, oval }

// Race class that simulates a race
class Race {
  Circuit circuit;
  List<F1Driver> drivers;

  Race(this.circuit, this.drivers);

  RaceResult simulate() {
    print('🏁 Starting race at ${circuit.name}');
    circuit.displayInfo();

    // Calculate lap times for each driver
    Map<F1Driver, double> lapTimes = {};
    Random random = Random();

    for (F1Driver driver in drivers) {
      double baseLapTime = 80.0; // Base lap time in seconds
      double performance = driver.calculatePerformance();
      double circuitModifier = circuit.getDifficultyModifier();
      double randomVariation =
          random.nextDouble() * 2.0; // Up to 2 seconds variation

      double lapTime =
          baseLapTime +
          (baseLapTime * (1 - performance)) * circuitModifier +
          randomVariation;
      lapTimes[driver] = lapTime;
    }

    // Sort drivers by lap time
    List<MapEntry<F1Driver, double>> sortedResults = lapTimes.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    // Award points and display results
    List<int> pointsSystem = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1];
    List<RacePosition> positions = [];

    print('\n🏆 Race Results:');
    for (int i = 0; i < sortedResults.length; i++) {
      F1Driver driver = sortedResults[i].key;
      double lapTime = sortedResults[i].value;
      int position = i + 1;
      int points = i < pointsSystem.length ? pointsSystem[i] : 0;

      driver.addPoints(points);
      positions.add(RacePosition(driver, position, lapTime, points));

      String timeStr =
          '${(lapTime ~/ 60)}:${(lapTime % 60).toStringAsFixed(3).padLeft(6, '0')}';
      print(
        '$position. ${driver.name.padRight(20)} ${timeStr} (+${points} pts)',
      );

      if (i < 3) driver.celebrate(); // Top 3 celebrate
    }

    return RaceResult(circuit, positions);
  }
}

// Supporting classes
class RacePosition {
  F1Driver driver;
  int position;
  double lapTime;
  int points;

  RacePosition(this.driver, this.position, this.lapTime, this.points);
}

class RaceResult {
  Circuit circuit;
  List<RacePosition> positions;

  RaceResult(this.circuit, this.positions);

  F1Driver get winner => positions.first.driver;
}

// Championship management class
class Championship {
  String name;
  List<F1Team> _teams = [];
  List<RaceResult> _raceResults = [];

  Championship(this.name);

  void addTeam(F1Team team) {
    _teams.add(team);
  }

  void addRaceResult(RaceResult result) {
    _raceResults.add(result);

    // Update team points
    for (RacePosition position in result.positions) {
      for (F1Team team in _teams) {
        if (team.drivers.contains(position.driver)) {
          team.addTeamPoints(position.points);
          break;
        }
      }
    }
  }

  List<F1Driver> getAllDrivers() {
    List<F1Driver> allDrivers = [];
    for (F1Team team in _teams) {
      allDrivers.addAll(team.drivers);
    }
    return allDrivers;
  }

  void displayStandings() {
    print('\n🏆 CHAMPIONSHIP STANDINGS AFTER ${_raceResults.length} RACES\n');

    // Driver standings
    List<F1Driver> drivers = getAllDrivers();
    drivers.sort((a, b) => b.points.compareTo(a.points));

    print('👨‍🏁 DRIVERS CHAMPIONSHIP:');
    for (int i = 0; i < drivers.length; i++) {
      F1Driver driver = drivers[i];
      print(
        '${(i + 1).toString().padLeft(2)}. ${driver.name.padRight(20)} ${driver.points.toString().padLeft(3)} pts',
      );
    }

    // Team standings
    print('\n🏎️  CONSTRUCTORS CHAMPIONSHIP:');
    _teams.sort((a, b) => b.teamPoints.compareTo(a.teamPoints));

    for (int i = 0; i < _teams.length; i++) {
      F1Team team = _teams[i];
      print(
        '${(i + 1).toString().padLeft(2)}. ${team.name.padRight(20)} ${team.teamPoints.toString().padLeft(3)} pts',
      );
    }

    if (_raceResults.isNotEmpty) {
      print(
        '\n🏁 Latest race winner: ${_raceResults.last.winner.name} at ${_raceResults.last.circuit.name}',
      );
    }
  }
}
