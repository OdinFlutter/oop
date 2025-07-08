// LESSON 1: Solutions - Classes and Objects
// Run with: dart solutions.dart

import 'dart:math';

void main() {
  print('Solutions for Lesson 1: Classes and Objects\n');

  solution1();
  print('\n${'=' * 50}\n');

  solution2();
  print('\n${'=' * 50}\n');

  solution3();
  print('\n${'=' * 50}\n');

  solution4();
  print('\n${'=' * 50}\n');

  solution5();

  print('\nAll solutions completed!');
}

// =============================================================================
// SOLUTION 1: Team class
// =============================================================================

class Team {
  String name;
  String country;
  int foundedYear;
  int championships;

  // Main constructor
  Team(this.name, this.country, this.foundedYear) : championships = 0;

  void displayTeamInfo() {
    print('Team: $name');
    print('Country: $country');
    print('Founded: $foundedYear');
    print('Championships: $championships');
  }

  void winChampionship() {
    championships++;
    print('🏆 $name wins championship! Total: $championships');
  }
}

void solution1() {
  print('SOLUTION 1: Team class');
  print('=' * 25);

  Team ferrari = Team('Ferrari', 'Italy', 1950);
  Team redBull = Team('Red Bull Racing', 'Austria', 2005);

  print('Initial team info:');
  ferrari.displayTeamInfo();
  print('');
  redBull.displayTeamInfo();

  print('\nWinning championships:');
  ferrari.winChampionship();
  ferrari.winChampionship();
  redBull.winChampionship();

  print('\nUpdated info:');
  ferrari.displayTeamInfo();
}

// =============================================================================
// SOLUTION 2: Circuit class with named constructors
// =============================================================================

class Circuit {
  String name;
  String country;
  double length;
  int corners;

  // Main constructor
  Circuit(this.name, this.country, this.length, this.corners);

  // Named constructor for street circuits
  Circuit.street(this.name, this.country, this.length) : corners = 90;

  // Named constructor for oval circuits
  Circuit.oval(this.name, this.country, this.length) : corners = 4;

  void displayCircuitInfo() {
    print('Circuit: $name');
    print('Country: $country');
    print('Length: ${length.toStringAsFixed(3)} km');
    print('Corners: $corners');
  }
}

void solution2() {
  print('SOLUTION 2: Circuit class with named constructors');
  print('=' * 50);

  Circuit monaco = Circuit('Monaco Grand Prix', 'Monaco', 3.337, 19);
  Circuit street = Circuit.street('Las Vegas GP', 'USA', 6.2);
  Circuit oval = Circuit.oval('Indianapolis', 'USA', 4.0);

  print('Regular circuit:');
  monaco.displayCircuitInfo();

  print('\nStreet circuit:');
  street.displayCircuitInfo();

  print('\nOval circuit:');
  oval.displayCircuitInfo();
}

// =============================================================================
// SOLUTION 3: RaceResult class with computed properties
// =============================================================================

class RaceResult {
  String driverName;
  int position;
  bool fastestLap;

  RaceResult(this.driverName, this.position, this.fastestLap);

  // Computed property (getter) for points
  int get points {
    Map<int, int> pointsTable = {
      1: 25,
      2: 18,
      3: 15,
      4: 12,
      5: 10,
      6: 8,
      7: 6,
      8: 4,
      9: 2,
      10: 1,
    };

    int racePoints = pointsTable[position] ?? 0;
    int fastestLapBonus = (position == 1 && fastestLap) ? 1 : 0;

    return racePoints + fastestLapBonus;
  }

  void displayResult() {
    String fastestLapInfo = fastestLap ? ' (+ Fastest Lap)' : '';
    print('P$position: $driverName - $points points$fastestLapInfo');
  }
}

void solution3() {
  print('SOLUTION 3: RaceResult class with computed properties');
  print('=' * 55);

  RaceResult winner = RaceResult('Max Verstappen', 1, true);
  RaceResult second = RaceResult('Lewis Hamilton', 2, false);
  RaceResult tenth = RaceResult('Yuki Tsunoda', 10, false);
  RaceResult dnf = RaceResult('Carlos Sainz', 15, false);

  print('Race Results:');
  winner.displayResult();
  second.displayResult();
  tenth.displayResult();
  dnf.displayResult();
}

// =============================================================================
// SOLUTION 4: Object interaction - PitStop and Driver
// =============================================================================

class PitStop {
  double duration;
  String tyreBrand;
  double fuelAdded;

  PitStop(this.duration, this.tyreBrand, this.fuelAdded);
}

class Driver {
  String name;
  String currentTyres;
  double fuel;

  Driver(this.name, this.currentTyres, this.fuel);

  void performPitStop(PitStop pitStop) {
    print('🏁 $name entering pit lane...');
    print('⏱️  Pit stop duration: ${pitStop.duration}s');
    print('🔧 Changing tyres from $currentTyres to ${pitStop.tyreBrand}');
    print('⛽ Adding ${pitStop.fuelAdded}L fuel');

    // Update driver state
    currentTyres = pitStop.tyreBrand;
    fuel += pitStop.fuelAdded;

    print('✅ Pit stop complete! Current tyres: $currentTyres, Fuel: ${fuel}L');

    if (pitStop.duration < 3.0) {
      print('🚀 Lightning fast pit stop!');
    } else if (pitStop.duration > 5.0) {
      print('⚠️  Slow pit stop - lost time!');
    }
  }
}

void solution4() {
  print('SOLUTION 4: Object interaction');
  print('=' * 30);

  Driver lando = Driver('Lando Norris', 'Medium', 50.0);
  PitStop quickStop = PitStop(2.3, 'Soft', 30.0);

  print('Before pit stop:');
  print('Driver: ${lando.name}');
  print('Current tyres: ${lando.currentTyres}');
  print('Fuel: ${lando.fuel}L\n');

  lando.performPitStop(quickStop);

  print('\nAfter pit stop:');
  print('Current tyres: ${lando.currentTyres}');
  print('Fuel: ${lando.fuel}L');
}

// =============================================================================
// SOLUTION 5: Complex task - Qualifying simulator
// =============================================================================

class QualifyingDriver {
  String name;
  int number;
  String country;
  double lapTime = 0.0;

  QualifyingDriver(this.name, this.number, this.country);
}

class QualifyingSession {
  String circuit;
  String weather;
  List<QualifyingDriver> drivers = [];

  QualifyingSession(this.circuit, this.weather);

  void addDriver(QualifyingDriver driver) {
    drivers.add(driver);
    print('✅ ${driver.name} (#${driver.number}) added to qualifying');
  }

  void simulateSession() {
    print('\n🏁 Qualifying session starting at $circuit');
    print('Weather: $weather\n');

    Random random = Random();

    for (var driver in drivers) {
      // Generate random lap time between 1:20.000 and 1:25.000
      double baseTime = 80.0; // 1:20.000 in seconds
      double randomVariation = random.nextDouble() * 5.0; // 0-5 seconds
      driver.lapTime = baseTime + randomVariation;

      int minutes = (driver.lapTime ~/ 60);
      double seconds = driver.lapTime % 60;

      print('⏱️  ${driver.name}: $minutes:${seconds.toStringAsFixed(3)}');
    }

    // Sort drivers by lap time
    drivers.sort((a, b) => a.lapTime.compareTo(b.lapTime));
  }

  void displayResults() {
    print('\n🏆 QUALIFYING RESULTS');
    print('=' * 40);

    for (int i = 0; i < drivers.length; i++) {
      var driver = drivers[i];
      int position = i + 1;
      int minutes = (driver.lapTime ~/ 60);
      double seconds = driver.lapTime % 60;

      String positionIcon = '';
      if (position == 1)
        positionIcon = '🥇';
      else if (position == 2)
        positionIcon = '🥈';
      else if (position == 3)
        positionIcon = '🥉';

      print(
        'P$position $positionIcon ${driver.name} (#${driver.number}) - $minutes:${seconds.toStringAsFixed(3)}',
      );
    }

    print('\n🏁 ${drivers[0].name} takes pole position!');
  }
}

void solution5() {
  print('SOLUTION 5: Qualifying simulator');
  print('=' * 35);

  QualifyingSession qualifying = QualifyingSession('Silverstone', 'Sunny');

  // Add drivers
  qualifying.addDriver(
    QualifyingDriver('Lewis Hamilton', 44, 'United Kingdom'),
  );
  qualifying.addDriver(QualifyingDriver('Max Verstappen', 1, 'Netherlands'));
  qualifying.addDriver(QualifyingDriver('Charles Leclerc', 16, 'Monaco'));
  qualifying.addDriver(
    QualifyingDriver('George Russell', 63, 'United Kingdom'),
  );
  qualifying.addDriver(QualifyingDriver('Lando Norris', 4, 'United Kingdom'));

  qualifying.simulateSession();
  qualifying.displayResults();
}

// =============================================================================
// HELPFUL NOTES
// =============================================================================

/*
KEY LEARNINGS FROM SOLUTIONS:

1. CONSTRUCTOR PATTERNS:
   - Main constructor: Team(this.name, this.country, this.foundedYear)
   - Initializer list: : championships = 0
   - Named constructors: Circuit.street(), Circuit.oval()

2. COMPUTED PROPERTIES:
   - Use 'get' keyword: int get points { ... }
   - Dynamic calculations based on current state
   - No parentheses when calling: result.points (not result.points())

3. OBJECT INTERACTION:
   - Pass objects as parameters: performPitStop(PitStop pitStop)
   - Modify object state through methods
   - Objects can contain other objects

4. COMPLEX DATA STRUCTURES:
   - Lists to store collections: List<QualifyingDriver> drivers
   - Sorting: drivers.sort((a, b) => a.lapTime.compareTo(b.lapTime))
   - Random values: Random().nextDouble()

5. BEST PRACTICES:
   - Clear method names that describe actions
   - Meaningful variable names
   - Proper encapsulation with private fields when needed
   - Consistent formatting and documentation
*/
