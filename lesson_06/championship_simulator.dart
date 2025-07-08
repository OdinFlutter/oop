// LESSON 6: Final Project - Complete F1 Championship Simulator
// This demonstrates all OOP concepts learned throughout the course
// Run with: dart championship_simulator.dart

import 'dart:math';

void main() {
  print('🏁 Formula 1 Championship Simulator 2024 🏁\n');

  ChampionshipSimulator simulator = ChampionshipSimulator();
  simulator.runFullSeason();
}

// =============================================================================
// CORE CLASSES AND INHERITANCE
// =============================================================================

abstract class Participant {
  String name;
  int points;

  Participant(this.name) : points = 0;

  void addPoints(int newPoints);
  void displayStanding();
}

class Championship {
  String season;
  List<Team> teams = [];
  List<Circuit> circuits = [];
  List<RaceEvent> raceEvents = [];

  Championship(this.season);

  void addTeam(Team team) {
    teams.add(team);
    print('✅ ${team.name} joined the championship');
  }

  void addCircuit(Circuit circuit) {
    circuits.add(circuit);
  }

  List<Driver> getAllDrivers() {
    List<Driver> allDrivers = [];
    for (var team in teams) {
      allDrivers.addAll(team.drivers);
    }
    return allDrivers;
  }

  void showDriverStandings() {
    var drivers = getAllDrivers();
    drivers.sort((a, b) => b.points.compareTo(a.points));

    print('\n🏆 DRIVER CHAMPIONSHIP STANDINGS');
    print('=' * 40);
    for (int i = 0; i < drivers.length; i++) {
      String position = '${i + 1}';
      if (i == 0)
        position += ' 🥇';
      else if (i == 1)
        position += ' 🥈';
      else if (i == 2)
        position += ' 🥉';

      print(
        '$position ${drivers[i].name} (${drivers[i].team?.name}) - ${drivers[i].points} pts',
      );
    }
  }

  void showConstructorStandings() {
    teams.sort((a, b) => b.points.compareTo(a.points));

    print('\n🏆 CONSTRUCTOR CHAMPIONSHIP STANDINGS');
    print('=' * 42);
    for (int i = 0; i < teams.length; i++) {
      String position = '${i + 1}';
      if (i == 0)
        position += ' 🥇';
      else if (i == 1)
        position += ' 🥈';
      else if (i == 2)
        position += ' 🥉';

      print('$position ${teams[i].name} - ${teams[i].points} pts');
    }
  }
}

// =============================================================================
// ENCAPSULATION - TEAM MANAGEMENT
// =============================================================================

class Team extends Participant {
  String _teamPrincipal;
  double _budget;
  List<Driver> _drivers = [];
  String _carModel;

  Team(String name, this._teamPrincipal, this._budget, this._carModel)
    : super(name);

  // Encapsulated getters
  String get teamPrincipal => _teamPrincipal;
  double get budget => _budget;
  List<Driver> get drivers => List.unmodifiable(_drivers);
  String get carModel => _carModel;

  // Validated setters
  set budget(double value) {
    if (value >= 0) {
      _budget = value;
    }
  }

  void addDriver(Driver driver) {
    if (_drivers.length < 2) {
      _drivers.add(driver);
      driver.team = this;
      print('🏎️  ${driver.name} signed with $name');
    } else {
      print('❌ $name already has 2 drivers');
    }
  }

  @override
  void addPoints(int newPoints) {
    points += newPoints;
  }

  @override
  void displayStanding() {
    print('Team: $name - $points points');
  }

  void spendBudget(double amount) {
    if (_budget >= amount) {
      _budget -= amount;
      print('💰 $name spent \$${amount}M on development');
    }
  }
}

// =============================================================================
// POLYMORPHISM - DRIVING STYLES
// =============================================================================

abstract class DrivingStyle {
  String styleName;
  DrivingStyle(this.styleName);

  void executeOvertake(String driverName, String targetName);
  void defendPosition(String driverName);
  void raceStart(String driverName);
  double getPerformanceModifier();
}

class AggressiveStyle extends DrivingStyle {
  AggressiveStyle() : super('Aggressive');

  @override
  void executeOvertake(String driverName, String targetName) {
    print('💥 $driverName sends it down the inside against $targetName!');
    print('   High-risk, high-reward move!');
  }

  @override
  void defendPosition(String driverName) {
    print('🚫 $driverName aggressively defends the racing line');
  }

  @override
  void raceStart(String driverName) {
    print('🚀 $driverName launches aggressively off the line!');
  }

  @override
  double getPerformanceModifier() => 1.1; // 10% faster but risky
}

class TechnicalStyle extends DrivingStyle {
  TechnicalStyle() : super('Technical');

  @override
  void executeOvertake(String driverName, String targetName) {
    print('🧠 $driverName calculates the perfect overtaking opportunity');
    print('   Using slipstream and DRS strategically');
  }

  @override
  void defendPosition(String driverName) {
    print('📐 $driverName uses racing lines defensively');
  }

  @override
  void raceStart(String driverName) {
    print('⚡ $driverName gets a perfect technical start');
  }

  @override
  double getPerformanceModifier() => 1.05; // Consistent performance
}

class SmothStyle extends DrivingStyle {
  SmothStyle() : super('Smooth');

  @override
  void executeOvertake(String driverName, String targetName) {
    print('😌 $driverName waits for the perfect moment');
    print('   Patience and tire conservation');
  }

  @override
  void defendPosition(String driverName) {
    print('🛡️  $driverName positions car strategically');
  }

  @override
  void raceStart(String driverName) {
    print('🎯 $driverName gets a smooth, calculated start');
  }

  @override
  double getPerformanceModifier() => 1.02; // Tire-friendly
}

// =============================================================================
// MIXINS - ADDITIONAL CAPABILITIES
// =============================================================================

mixin Communicable {
  List<String> radioMessages = [];

  void sendRadioMessage(String message) {
    radioMessages.add(message);
    print('📻 Radio: "$message"');
  }

  void receiveTeamOrders(String orders) {
    print('📻 Team: "$orders"');
  }
}

mixin TelemetryTracked {
  Map<String, List<double>> telemetryData = {};

  void updateTelemetry(String parameter, double value) {
    telemetryData.putIfAbsent(parameter, () => []);
    telemetryData[parameter]!.add(value);
  }

  void showTelemetryAverage(String parameter) {
    var data = telemetryData[parameter];
    if (data != null && data.isNotEmpty) {
      double avg = data.reduce((a, b) => a + b) / data.length;
      print('📊 Average $parameter: ${avg.toStringAsFixed(2)}');
    }
  }
}

mixin StrategicallyManaged {
  String currentStrategy = 'Default';
  List<String> strategyHistory = [];

  void changeStrategy(String strategy) {
    strategyHistory.add(currentStrategy);
    currentStrategy = strategy;
    print('🎯 Strategy changed to: $strategy');
  }

  void showStrategyHistory() {
    print(
      '📋 Strategies used: ${strategyHistory.join(' → ')} → $currentStrategy',
    );
  }
}

// =============================================================================
// DRIVER CLASS WITH ALL OOP CONCEPTS
// =============================================================================

class Driver extends Participant
    with Communicable, TelemetryTracked, StrategicallyManaged {
  int skillLevel;
  int age;
  String nationality;
  Team? team;
  DrivingStyle drivingStyle;
  List<double> lapTimes = [];
  bool hasRetired = false;

  Driver(
    String name,
    this.skillLevel,
    this.age,
    this.nationality,
    this.drivingStyle,
  ) : super(name);

  @override
  void addPoints(int newPoints) {
    points += newPoints;
    if (newPoints > 0) {
      print('🏆 $name scores $newPoints points!');
      team?.addPoints(newPoints);
    }
  }

  @override
  void displayStanding() {
    String teamName = team?.name ?? 'No Team';
    print('$name ($teamName) - $points points');
  }

  void qualify(Circuit circuit) {
    if (hasRetired) return;

    double baseTime = circuit.lapRecord + Random().nextDouble() * 3;
    double styleModifier = drivingStyle.getPerformanceModifier();
    double skillModifier = skillLevel / 100.0;

    double qualifyingTime = baseTime / (styleModifier * skillModifier);
    lapTimes.add(qualifyingTime);

    updateTelemetry('Qualifying Time', qualifyingTime);
    print('⏱️  $name: ${qualifyingTime.toStringAsFixed(3)}s');
  }

  void racePerformance(int currentPosition, List<Driver> otherDrivers) {
    if (hasRetired) return;

    drivingStyle.raceStart(name);
    sendRadioMessage('Car feels good, let\'s push!');

    // Simulate some racing action
    if (Random().nextDouble() < 0.3 && currentPosition > 1) {
      var target = otherDrivers[currentPosition - 2];
      drivingStyle.executeOvertake(name, target.name);
    }

    if (Random().nextDouble() < 0.2) {
      drivingStyle.defendPosition(name);
    }

    // Random retirement
    if (Random().nextDouble() < 0.05) {
      hasRetired = true;
      print('💥 $name retires from the race! Technical failure');
      sendRadioMessage('We have a problem, returning to pits');
    }
  }

  void celebrate(int position) {
    switch (position) {
      case 1:
        print('🏆 $name wins! Victory celebration!');
        sendRadioMessage('YES! What a race! Thank you team!');
        break;
      case 2:
        print('🥈 $name finishes 2nd - great result!');
        sendRadioMessage('P2! Good points for the championship');
        break;
      case 3:
        print('🥉 $name completes the podium!');
        sendRadioMessage('Podium finish! Great job everyone');
        break;
      default:
        if (position <= 10) {
          print('✅ $name finishes P$position - points finish');
          sendRadioMessage('P$position - good points today');
        } else {
          print('😔 $name finishes P$position - outside points');
          sendRadioMessage('Tough race, but we\'ll come back stronger');
        }
    }
  }
}

// =============================================================================
// CIRCUIT ABSTRACTION
// =============================================================================

abstract class Circuit {
  String name;
  String country;
  double length;
  int laps;
  double lapRecord;
  String circuitType;

  Circuit(
    this.name,
    this.country,
    this.length,
    this.laps,
    this.lapRecord,
    this.circuitType,
  );

  void displayInfo() {
    print('🏁 $name, $country');
    print('   Length: ${length}km × $laps laps');
    print('   Lap record: ${lapRecord}s ($circuitType)');
  }

  String getWeatherConditions();
  double getDifficultyFactor();
}

class StreetCircuit extends Circuit {
  StreetCircuit(
    String name,
    String country,
    double length,
    int laps,
    double lapRecord,
  ) : super(name, country, length, laps, lapRecord, 'Street Circuit');

  @override
  String getWeatherConditions() {
    var conditions = ['Sunny', 'Cloudy', 'Light Rain'];
    return conditions[Random().nextInt(conditions.length)];
  }

  @override
  double getDifficultyFactor() => 1.2; // Higher difficulty
}

class PermanentCircuit extends Circuit {
  PermanentCircuit(
    String name,
    String country,
    double length,
    int laps,
    double lapRecord,
  ) : super(name, country, length, laps, lapRecord, 'Permanent Circuit');

  @override
  String getWeatherConditions() {
    var conditions = ['Sunny', 'Cloudy', 'Light Rain', 'Heavy Rain'];
    return conditions[Random().nextInt(conditions.length)];
  }

  @override
  double getDifficultyFactor() => 1.0; // Standard difficulty
}

// =============================================================================
// RACE EVENT SYSTEM
// =============================================================================

class RaceEvent {
  Circuit circuit;
  String eventName;
  List<Driver> grid = [];
  List<Driver> results = [];
  String weather;

  RaceEvent(this.circuit, this.eventName)
    : weather = circuit.getWeatherConditions();

  void runQualifying(List<Driver> drivers) {
    print('\n🎯 QUALIFYING - ${circuit.name}');
    print('Weather: $weather');
    print('=' * 50);

    grid = List.from(drivers);
    grid.removeWhere((driver) => driver.hasRetired);

    for (var driver in grid) {
      driver.qualify(circuit);
    }

    // Sort by qualifying time (best lap)
    grid.sort((a, b) {
      if (a.lapTimes.isEmpty) return 1;
      if (b.lapTimes.isEmpty) return -1;
      return a.lapTimes.last.compareTo(b.lapTimes.last);
    });

    print('\n🏆 QUALIFYING RESULTS:');
    for (int i = 0; i < grid.length && i < 10; i++) {
      String pole = i == 0 ? ' 🥇 POLE POSITION!' : '';
      print('P${i + 1}: ${grid[i].name}${pole}');
    }
  }

  void runRace() {
    print('\n🏁 RACE START - ${circuit.name}');
    print('Weather: $weather');
    print('=' * 40);

    results = List.from(grid);

    // Simulate race
    print('\n🚦 Formation lap complete...');
    print('🚦 All lights out... AND AWAY WE GO!\n');

    for (int i = 0; i < results.length; i++) {
      results[i].racePerformance(i + 1, results);
    }

    // Remove retired drivers
    results.removeWhere((driver) => driver.hasRetired);

    // Some position changes based on performance
    for (int i = 0; i < 3 && results.length > 1; i++) {
      if (Random().nextDouble() < 0.4) {
        int pos1 = Random().nextInt(results.length);
        int pos2 = Random().nextInt(results.length);
        var temp = results[pos1];
        results[pos1] = results[pos2];
        results[pos2] = temp;
      }
    }

    awardPoints();
    showRaceResults();
  }

  void awardPoints() {
    List<int> pointsSystem = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1];

    for (int i = 0; i < results.length && i < pointsSystem.length; i++) {
      results[i].addPoints(pointsSystem[i]);
    }

    // Fastest lap bonus point
    if (results.isNotEmpty) {
      var fastestDriver = results[Random().nextInt(min(5, results.length))];
      fastestDriver.addPoints(1);
      print('⚡ ${fastestDriver.name} gets fastest lap bonus point!');
    }
  }

  void showRaceResults() {
    print('\n🏆 RACE RESULTS - ${circuit.name}:');
    print('=' * 35);

    for (int i = 0; i < results.length; i++) {
      results[i].celebrate(i + 1);
    }
  }
}

// =============================================================================
// MAIN CHAMPIONSHIP SIMULATOR
// =============================================================================

class ChampionshipSimulator {
  Championship championship = Championship('2024');

  ChampionshipSimulator() {
    setupTeamsAndDrivers();
    setupCircuits();
  }

  void setupTeamsAndDrivers() {
    print('🏗️  Setting up teams and drivers...\n');

    // Create teams with realistic data
    var redBull = Team('Red Bull Racing', 'Christian Horner', 135.0, 'RB20');
    var mercedes = Team('Mercedes', 'Toto Wolff', 135.0, 'W15');
    var ferrari = Team('Ferrari', 'Frédéric Vasseur', 135.0, 'SF-24');
    var mclaren = Team('McLaren', 'Andrea Stella', 135.0, 'MCL38');

    championship.addTeam(redBull);
    championship.addTeam(mercedes);
    championship.addTeam(ferrari);
    championship.addTeam(mclaren);

    // Create drivers with different styles
    redBull.addDriver(
      Driver('Max Verstappen', 98, 27, 'Netherlands', AggressiveStyle()),
    );
    redBull.addDriver(Driver('Sergio Perez', 85, 34, 'Mexico', SmothStyle()));

    mercedes.addDriver(
      Driver('Lewis Hamilton', 96, 39, 'United Kingdom', TechnicalStyle()),
    );
    mercedes.addDriver(
      Driver('George Russell', 88, 26, 'United Kingdom', TechnicalStyle()),
    );

    ferrari.addDriver(
      Driver('Charles Leclerc', 92, 26, 'Monaco', AggressiveStyle()),
    );
    ferrari.addDriver(Driver('Carlos Sainz', 87, 30, 'Spain', SmothStyle()));

    mclaren.addDriver(
      Driver('Lando Norris', 89, 24, 'United Kingdom', AggressiveStyle()),
    );
    mclaren.addDriver(
      Driver('Oscar Piastri', 82, 23, 'Australia', TechnicalStyle()),
    );
  }

  void setupCircuits() {
    championship.addCircuit(
      StreetCircuit('Monaco Grand Prix', 'Monaco', 3.337, 78, 70.246),
    );
    championship.addCircuit(
      PermanentCircuit('Silverstone', 'United Kingdom', 5.891, 52, 85.630),
    );
    championship.addCircuit(
      PermanentCircuit('Spa-Francorchamps', 'Belgium', 7.004, 44, 103.003),
    );
    championship.addCircuit(
      StreetCircuit('Singapore Grand Prix', 'Singapore', 5.063, 61, 91.905),
    );
  }

  void runFullSeason() {
    print('🏆 Starting F1 Championship Season ${championship.season}!\n');

    var drivers = championship.getAllDrivers();

    for (var circuit in championship.circuits) {
      print('\n${'=' * 60}');
      circuit.displayInfo();

      var raceEvent = RaceEvent(circuit, '${circuit.name}');
      raceEvent.runQualifying(drivers);
      raceEvent.runRace();

      championship.raceEvents.add(raceEvent);

      // Reset retirement status for next race
      for (var driver in drivers) {
        driver.hasRetired = false;
      }
    }

    showFinalStandings();
  }

  void showFinalStandings() {
    print('\n${'=' * 60}');
    print('🏁 END OF SEASON ${championship.season}');
    print('=' * 60);

    championship.showDriverStandings();
    championship.showConstructorStandings();

    var winner = championship.getAllDrivers().reduce(
      (a, b) => a.points > b.points ? a : b,
    );
    print('\n🏆 WORLD CHAMPION: ${winner.name} (${winner.team?.name})');
    print('   Final points: ${winner.points}');
    print('   Driving style: ${winner.drivingStyle.styleName}');

    winner.showStrategyHistory();
    winner.showTelemetryAverage('Qualifying Time');

    print('\n🎉 Congratulations on completing the F1 Championship simulation!');
    print('You\'ve successfully used all OOP concepts:');
    print('✅ Classes and Objects');
    print('✅ Encapsulation');
    print('✅ Inheritance');
    print('✅ Polymorphism');
    print('✅ Abstraction');
    print('✅ Mixins');
    print('\nGreat job learning Object-Oriented Programming! 🏎️💨');
  }
}

/*
FINAL PROJECT SUMMARY:

This championship simulator demonstrates all key OOP concepts:

1. CLASSES & OBJECTS:
   - Championship, Team, Driver, Circuit, RaceEvent
   - Real-world modeling of F1 entities

2. ENCAPSULATION:
   - Team class with private fields and controlled access
   - Getters/setters with validation
   - Protected data integrity

3. INHERITANCE:
   - Participant abstract class extended by Team and Driver
   - Circuit abstract class with Street/Permanent implementations
   - Shared behavior with specialized implementations

4. POLYMORPHISM:
   - DrivingStyle abstract class with multiple implementations
   - Same interface, different behaviors
   - Runtime method resolution

5. ABSTRACTION:
   - Abstract classes define contracts
   - Hide implementation complexity
   - Clean public interfaces

6. MIXINS:
   - Communicable: Radio communication
   - TelemetryTracked: Data collection
   - StrategicallyManaged: Strategy handling
   - Multiple inheritance alternative

BENEFITS ACHIEVED:
- Modular, extensible design
- Easy to add new teams, drivers, circuits
- Realistic simulation with random elements
- Clean separation of concerns
- Reusable components

This project can be extended with:
- Database integration
- Web/mobile UI
- More detailed physics simulation
- Historical data analysis
- Multiplayer features
*/
