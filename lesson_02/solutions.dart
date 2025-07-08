// LESSON 2: Encapsulation Solutions
// Complete solutions for all practice tasks
// Run with: dart solutions.dart

void main() {
  // Ініціалізуємо прогрес-трекер
  ProgressTracker.initialize();
  
  // Показуємо прогрес курсу
  ProgressTracker.displayProgress();
  
  print('\n🎯 ПРАКТИКА — УРОК 2: ІНКАПСУЛЯЦІЯ');
  print('=' * 50);

  // Розкоментуйте потрібне завдання для виконання
  // task1();
  // task2();
  // task3();
  // task4();
  // task5();

  print('\n💡 Порада: Розкоментуйте task1() для початку роботи!');
  print('📚 Перевірте solutions.dart для порівняння після виконання.');
}


// =============================================================================
// SOLUTION 1: Secure Driver Profile
// =============================================================================

class DriverProfile {
  // Private fields
  int _driverNumber;
  int _points;
  double _salary;
  int _contractYears;

  // Public fields
  String name;
  String team;

  // Constructor
  DriverProfile(this.name, this.team, this._driverNumber, this._contractYears)
    : _points = 0,
      _salary = 0.0;

  // Getters for private fields
  int get driverNumber => _driverNumber;
  int get points => _points;
  double get salary => _salary;
  int get contractYears => _contractYears;

  // Setter for salary with validation
  set salary(double value) {
    if (value > 0 && value < 100000000) {
      // 100M limit
      _salary = value;
    } else {
      throw ArgumentError('Salary must be between 0 and 100M');
    }
  }

  // Methods
  void addPoints(int points) {
    if (points > 0) {
      _points += points;
    }
  }

  void renewContract(int years) {
    if (years > 0) {
      _contractYears += years;
    }
  }
}

void solution1() {
  print('SOLUTION 1: Secure Driver Profile');
  print('=' * 40);

  try {
    DriverProfile max = DriverProfile('Max Verstappen', 'Red Bull', 1, 3);
    max.addPoints(25);
    max.salary = 50000000; // 50M
    print('Driver: ${max.name}, Points: ${max.points}, Salary: ${max.salary}');

    // This should fail
    try {
      max.salary = 150000000; // 150M - should fail
    } catch (e) {
      print('Salary validation working: $e');
    }

    max.renewContract(2);
    print('Contract years: ${max.contractYears}');
  } catch (e) {
    print('Error: $e');
  }

  print('');
}

// =============================================================================
// SOLUTION 2: Secure Car Telemetry System
// =============================================================================

class CarTelemetry {
  // Private fields
  double _speed;
  int _rpm;
  double _fuelLevel;
  double _tyreTemperature;

  // Public field
  int carNumber;

  // Constructor
  CarTelemetry(this.carNumber)
    : _speed = 0.0,
      _rpm = 0,
      _fuelLevel = 100.0,
      _tyreTemperature = 80.0;

  // Getters
  double get speed => _speed;
  int get rpm => _rpm;
  double get fuelLevel => _fuelLevel;
  double get tyreTemperature => _tyreTemperature;

  // Setters with validation
  set speed(double value) {
    if (value >= 0 && value <= 370) {
      _speed = value;
    } else {
      throw ArgumentError('Speed must be between 0 and 370 km/h');
    }
  }

  set rpm(int value) {
    if (value >= 0 && value <= 15000) {
      _rpm = value;
    } else {
      throw ArgumentError('RPM must be between 0 and 15000');
    }
  }

  set fuelLevel(double value) {
    if (value >= 0 && value <= 100) {
      _fuelLevel = value;
    } else {
      throw ArgumentError('Fuel level must be between 0 and 100%');
    }
  }

  set tyreTemperature(double value) {
    if (value >= 0 && value <= 150) {
      _tyreTemperature = value;
    } else {
      throw ArgumentError('Tyre temperature must be between 0 and 150°C');
    }
  }

  // Computed property
  String get status {
    if (_speed > 350 ||
        _rpm > 14000 ||
        _fuelLevel < 5 ||
        _tyreTemperature > 140) {
      return 'Critical';
    } else if (_speed > 300 ||
        _rpm > 12000 ||
        _fuelLevel < 15 ||
        _tyreTemperature > 120) {
      return 'Warning';
    } else {
      return 'Normal';
    }
  }

  // Methods
  void resetTelemetry() {
    _speed = 0.0;
    _rpm = 0;
    _fuelLevel = 100.0;
    _tyreTemperature = 80.0;
  }
}

void solution2() {
  print('SOLUTION 2: Secure Car Telemetry System');
  print('=' * 40);

  try {
    CarTelemetry car1 = CarTelemetry(1);
    car1.speed = 200;
    car1.rpm = 12000;
    car1.fuelLevel = 15;
    car1.tyreTemperature = 120;

    print('Car ${car1.carNumber} status: ${car1.status}');
    print('Speed: ${car1.speed} km/h, RPM: ${car1.rpm}');
    print('Fuel: ${car1.fuelLevel}%, Tyres: ${car1.tyreTemperature}°C');

    // Test validation
    try {
      car1.speed = 400; // Should fail
    } catch (e) {
      print('Speed validation working: $e');
    }

    car1.resetTelemetry();
    print('After reset - Status: ${car1.status}');
  } catch (e) {
    print('Error: $e');
  }

  print('');
}

// =============================================================================
// SOLUTION 3: Championship Points Manager
// =============================================================================

class ChampionshipManager {
  // Private fields
  Map<String, int> _drivers;
  int _maxRounds;
  int _currentRound;

  // Constructor
  ChampionshipManager(this._maxRounds) : _drivers = {}, _currentRound = 1 {
    if (_maxRounds <= 0) {
      throw ArgumentError('Max rounds must be greater than 0');
    }
  }

  // Getters
  int get currentRound => _currentRound;
  int get maxRounds => _maxRounds;

  // Methods
  void addDriver(String name) {
    if (name.isNotEmpty) {
      _drivers[name] = 0;
    }
  }

  void addRaceResult(String driverName, int position) {
    if (!_drivers.containsKey(driverName)) {
      throw ArgumentError('Driver not found: $driverName');
    }

    int points = _getPointsForPosition(position);
    _drivers[driverName] = _drivers[driverName]! + points;
  }

  void nextRound() {
    if (_currentRound < _maxRounds) {
      _currentRound++;
    }
  }

  String get leader {
    if (_drivers.isEmpty) return 'No drivers';

    String leaderName = _drivers.keys.first;
    int maxPoints = _drivers[leaderName]!;

    _drivers.forEach((name, points) {
      if (points > maxPoints) {
        maxPoints = points;
        leaderName = name;
      }
    });

    return leaderName;
  }

  List<MapEntry<String, int>> get standings {
    List<MapEntry<String, int>> sorted = _drivers.entries.toList();
    sorted.sort((a, b) => b.value.compareTo(a.value)); // Descending order
    return sorted;
  }

  int getDriverPoints(String name) {
    return _drivers[name] ?? 0;
  }

  // Private helper method
  int _getPointsForPosition(int position) {
    switch (position) {
      case 1:
        return 25;
      case 2:
        return 18;
      case 3:
        return 15;
      case 4:
        return 12;
      case 5:
        return 10;
      case 6:
        return 8;
      case 7:
        return 6;
      case 8:
        return 4;
      case 9:
        return 2;
      case 10:
        return 1;
      default:
        return 0;
    }
  }
}

void solution3() {
  print('SOLUTION 3: Championship Points Manager');
  print('=' * 40);

  try {
    ChampionshipManager championship = ChampionshipManager(23);
    championship.addDriver('Max Verstappen');
    championship.addDriver('Lewis Hamilton');
    championship.addDriver('Charles Leclerc');
    championship.addDriver('Lando Norris');

    // Race 1 results
    championship.addRaceResult('Max Verstappen', 1);
    championship.addRaceResult('Lewis Hamilton', 2);
    championship.addRaceResult('Charles Leclerc', 3);
    championship.addRaceResult('Lando Norris', 4);

    print('Championship leader: ${championship.leader}');
    print(
      'Current round: ${championship.currentRound}/${championship.maxRounds}',
    );

    // Show standings
    print('\nStandings:');
    championship.standings.forEach((entry) {
      print('${entry.key}: ${entry.value} points');
    });

    championship.nextRound();
    print(
      '\nAfter next round: ${championship.currentRound}/${championship.maxRounds}',
    );
  } catch (e) {
    print('Error: $e');
  }

  print('');
}

// =============================================================================
// SOLUTION 4: Secure Team Radio System
// =============================================================================

class TeamRadio {
  // Private fields
  List<String> _messages;
  bool _isEncrypted;
  double _frequency;
  int _maxMessages;

  // Public field
  String teamName;

  // Constructor
  TeamRadio(this.teamName, this._frequency, this._maxMessages)
    : _messages = [],
      _isEncrypted = false {
    if (_frequency < 88.0 || _frequency > 108.0) {
      throw ArgumentError('Frequency must be between 88.0 and 108.0 MHz');
    }
    if (_maxMessages <= 0) {
      throw ArgumentError('Max messages must be greater than 0');
    }
  }

  // Getters
  double get frequency => _frequency;
  int get messageCount => _messages.length;
  bool get isEncrypted => _isEncrypted;

  // Setter for frequency
  set frequency(double value) {
    if (value >= 88.0 && value <= 108.0) {
      _frequency = value;
    } else {
      throw ArgumentError('Frequency must be between 88.0 and 108.0 MHz');
    }
  }

  // Methods
  void sendMessage(String message) {
    if (message.isNotEmpty) {
      String processedMessage = _isEncrypted
          ? _encryptMessage(message)
          : message;

      if (_messages.length >= _maxMessages) {
        _messages.removeAt(0); // Remove oldest message
      }

      _messages.add(processedMessage);
    }
  }

  void enableEncryption() {
    _isEncrypted = true;
  }

  void disableEncryption() {
    _isEncrypted = false;
  }

  String getLastMessage() {
    if (_messages.isEmpty) {
      return 'No messages';
    }
    return _messages.last;
  }

  void clearMessages() {
    _messages.clear();
  }

  // Private method
  String _encryptMessage(String msg) {
    return 'ENCRYPTED: $msg';
  }
}

void solution4() {
  print('SOLUTION 4: Secure Team Radio System');
  print('=' * 40);

  try {
    TeamRadio radio = TeamRadio('Ferrari', 95.5, 5);

    radio.sendMessage('Pit window opening');
    radio.sendMessage('Driver doing well');
    radio.sendMessage('Weather conditions stable');

    print('Team: ${radio.teamName}');
    print('Frequency: ${radio.frequency} MHz');
    print('Message count: ${radio.messageCount}');
    print('Last message: ${radio.getLastMessage()}');

    radio.enableEncryption();
    radio.sendMessage('Strategy change');
    radio.sendMessage('Box box box');

    print('\nAfter encryption:');
    print('Last message: ${radio.getLastMessage()}');
    print('Message count: ${radio.messageCount}');

    // Test frequency validation
    try {
      radio.frequency = 120.0; // Should fail
    } catch (e) {
      print('Frequency validation working: $e');
    }

    radio.clearMessages();
    print('After clear: ${radio.getLastMessage()}');
  } catch (e) {
    print('Error: $e');
  }

  print('');
}

// =============================================================================
// SOLUTION 5: Advanced Pit Stop Timer with Validation
// =============================================================================

class PitStopTimer {
  // Private fields
  DateTime? _startTime;
  DateTime? _endTime;
  int _minCrewMembers;
  int _currentCrewMembers;
  Map<String, bool> _tasks;

  // Constructor
  PitStopTimer([this._minCrewMembers = 12])
    : _currentCrewMembers = 0,
      _tasks = {
        'Front tyres': false,
        'Rear tyres': false,
        'Fuel': false,
        'Adjustments': false,
      };

  // Getters
  bool get isInProgress => _startTime != null && _endTime == null;

  Duration? get duration {
    if (_startTime != null && _endTime != null) {
      return _endTime!.difference(_startTime!);
    }
    return null;
  }

  bool get isValidStop {
    return _currentCrewMembers >= _minCrewMembers &&
        _tasks.values.every((task) => task);
  }

  String get status {
    if (_startTime == null) {
      return 'Not started';
    } else if (_endTime == null) {
      int completedTasks = _tasks.values.where((done) => done).length;
      return 'In progress - Crew: $_currentCrewMembers/$_minCrewMembers, Tasks: $completedTasks/${_tasks.length}';
    } else {
      String validity = isValidStop ? 'Valid' : 'Invalid';
      return 'Completed - $validity stop, Duration: ${duration?.inMilliseconds}ms';
    }
  }

  // Methods
  void startPitStop(int crewMembers) {
    if (crewMembers > 0) {
      _startTime = DateTime.now();
      _currentCrewMembers = crewMembers;
      // Reset tasks
      _tasks.forEach((key, value) => _tasks[key] = false);
    }
  }

  void completeTask(String taskName) {
    if (_tasks.containsKey(taskName)) {
      _tasks[taskName] = true;
    }
  }

  Duration? endPitStop() {
    if (_startTime != null && _endTime == null) {
      _endTime = DateTime.now();
      return duration;
    }
    return null;
  }

  void reset() {
    _startTime = null;
    _endTime = null;
    _currentCrewMembers = 0;
    _tasks.forEach((key, value) => _tasks[key] = false);
  }
}

void solution5() {
  print('SOLUTION 5: Advanced Pit Stop Timer');
  print('=' * 35);

  try {
    PitStopTimer timer = PitStopTimer(14);

    print('Initial status: ${timer.status}');

    timer.startPitStop(16);
    print('After start: ${timer.status}');

    timer.completeTask('Front tyres');
    timer.completeTask('Rear tyres');
    timer.completeTask('Fuel');
    timer.completeTask('Adjustments');

    print('After tasks: ${timer.status}');

    Duration? pitTime = timer.endPitStop();
    print('Final status: ${timer.status}');
    print('Pit stop time: ${pitTime?.inMilliseconds}ms');
    print('Valid stop: ${timer.isValidStop}');

    timer.reset();
    print('After reset: ${timer.status}');
  } catch (e) {
    print('Error: $e');
  }

  print('');
}
