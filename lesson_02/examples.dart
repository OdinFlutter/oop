// LESSON 2: Encapsulation Examples - Formula 1
// Run with: dart examples.dart

void main() {
  print('🏁 Formula 1 OOP: Encapsulation Examples 🏁\n');

  example1_BasicEncapsulation();
  example2_GettersSetters();
  example3_DataValidation();
  example4_TeamBudget();
}

// =============================================================================
// EXAMPLE 1: Basic Private Fields
// =============================================================================

void example1_BasicEncapsulation() {
  print('📖 EXAMPLE 1: Basic Encapsulation');
  print('=' * 40);

  F1Driver lewis = F1Driver('Lewis Hamilton', 39, 'United Kingdom');

  // Public access
  print('Driver name: ${lewis.name}');
  print('Driver country: ${lewis.country}');

  // Access private data through getters
  print('Driver age: ${lewis.age}');
  print('Career wins: ${lewis.careerWins}');

  // Add win (controlled access)
  lewis.addWin('Brazilian GP');
  lewis.addWin('Monaco GP');

  print('Career wins after adding: ${lewis.careerWins}');
  print('');
}

class F1Driver {
  String name; // Public field
  String country; // Public field
  int _age; // Private field
  int _careerWins; // Private field
  List<String> _victories; // Private field

  F1Driver(this.name, this._age, this.country)
    : _careerWins = 0,
      _victories = [];

  // Getters for controlled access
  int get age => _age;
  int get careerWins => _careerWins;
  List<String> get victories => List.unmodifiable(_victories);

  // Public method that modifies private data
  void addWin(String raceName) {
    _victories.add(raceName);
    _careerWins++;
    print('${name} won ${raceName}! Total wins: ${_careerWins}');
  }

  // Private method
  void _updateAge() {
    _age++;
  }
}

// =============================================================================
// EXAMPLE 2: Getters and Setters with Validation
// =============================================================================

void example2_GettersSetters() {
  print('📖 EXAMPLE 2: Getters and Setters');
  print('=' * 35);

  F1Car redBull = F1Car('RB19', 'Red Bull Racing');

  print('Initial speed: ${redBull.speed} km/h');
  print('Speed status: ${redBull.speedStatus}');

  // Valid speed changes
  redBull.speed = 150;
  redBull.speed = 300;

  // Invalid speed changes
  redBull.speed = -50; // Too low
  redBull.speed = 400; // Too high

  print('Final speed: ${redBull.speed} km/h');
  print('Speed status: ${redBull.speedStatus}');
  print('');
}

class F1Car {
  String model;
  String team;
  double _speed = 0;
  double _maxSpeed = 350;
  double _minSpeed = 0;

  F1Car(this.model, this.team);

  // Getter
  double get speed => _speed;
  double get maxSpeed => _maxSpeed;

  // Setter with validation
  set speed(double newSpeed) {
    if (newSpeed < _minSpeed) {
      print('❌ Invalid speed: ${newSpeed} km/h (minimum: ${_minSpeed})');
      return;
    }

    if (newSpeed > _maxSpeed) {
      print('❌ Invalid speed: ${newSpeed} km/h (maximum: ${_maxSpeed})');
      return;
    }

    _speed = newSpeed;
    print('✅ Speed set to: ${_speed} km/h');
  }

  // Computed property
  String get speedStatus {
    if (_speed == 0) return '🛑 Stopped';
    if (_speed < 100) return '🐌 Slow';
    if (_speed < 200) return '🏃 Medium';
    if (_speed < 300) return '🏎️ Fast';
    return '🚀 Very Fast';
  }
}

// =============================================================================
// EXAMPLE 3: Data Protection and Validation
// =============================================================================

void example3_DataValidation() {
  print('📖 EXAMPLE 3: Data Validation');
  print('=' * 30);

  try {
    RaceSession session = RaceSession('Monaco GP', 78);

    session.currentLap = 10;
    session.currentLap = 50;
    session.currentLap = 100; // Should fail

    print('Session status: ${session.status}');
  } catch (e) {
    print('Error: $e');
  }

  print('');
}

class RaceSession {
  String _raceName;
  int _totalLaps;
  int _currentLap = 0;
  bool _isActive = false;

  RaceSession(this._raceName, this._totalLaps) {
    if (_totalLaps <= 0) {
      throw ArgumentError('Total laps must be positive');
    }
  }

  // Getters
  String get raceName => _raceName;
  int get totalLaps => _totalLaps;
  int get currentLap => _currentLap;
  bool get isActive => _isActive;

  // Setter with validation
  set currentLap(int lap) {
    if (lap < 0) {
      throw ArgumentError('Lap cannot be negative');
    }

    if (lap > _totalLaps) {
      throw ArgumentError('Lap cannot exceed total laps ($_totalLaps)');
    }

    _currentLap = lap;
    _isActive = lap > 0 && lap <= _totalLaps;
    print('📍 Current lap: $_currentLap/${_totalLaps}');
  }

  // Computed property
  String get status {
    if (_currentLap == 0) return 'Not started';
    if (_currentLap < _totalLaps) return 'In progress';
    return 'Finished';
  }

  // Public method that uses private data
  double get progressPercentage {
    return (_currentLap / _totalLaps * 100);
  }
}

// =============================================================================
// EXAMPLE 4: Complex Encapsulation - Team Budget
// =============================================================================

void example4_TeamBudget() {
  print('📖 EXAMPLE 4: Team Budget Management');
  print('=' * 35);

  F1Team ferrari = F1Team('Ferrari', 180000000); // $180M budget cap

  ferrari.spendMoney('Engine development', 50000000);
  ferrari.spendMoney('Aerodynamics', 30000000);
  ferrari.spendMoney('Driver salaries', 40000000);
  ferrari.spendMoney('New facilities', 70000000); // Should exceed budget

  print('Remaining budget: \$${ferrari.remainingBudget}');
  print('Budget utilization: ${ferrari.budgetUtilization.toStringAsFixed(1)}%');

  print('\nExpense breakdown:');
  ferrari.printExpenseReport();
}

class F1Team {
  String name;
  double _totalBudget;
  double _spentAmount = 0;
  Map<String, double> _expenses = {};

  F1Team(this.name, this._totalBudget) {
    if (_totalBudget <= 0) {
      throw ArgumentError('Budget must be positive');
    }
  }

  // Getters
  double get totalBudget => _totalBudget;
  double get spentAmount => _spentAmount;
  double get remainingBudget => _totalBudget - _spentAmount;
  double get budgetUtilization => (_spentAmount / _totalBudget) * 100;

  // Controlled spending method
  bool spendMoney(String category, double amount) {
    if (amount <= 0) {
      print('❌ Invalid amount: \$${amount}');
      return false;
    }

    if (_spentAmount + amount > _totalBudget) {
      double available = remainingBudget;
      print('❌ Cannot spend \$${amount} on ${category}');
      print('   Available budget: \$${available}');
      return false;
    }

    _spentAmount += amount;
    _expenses[category] = (_expenses[category] ?? 0) + amount;

    print('✅ Spent \$${amount} on ${category}');
    print('   Remaining budget: \$${remainingBudget}');

    return true;
  }

  // Public method to view expenses (read-only)
  void printExpenseReport() {
    _expenses.forEach((category, amount) {
      double percentage = (amount / _totalBudget) * 100;
      print('  ${category}: \$${amount} (${percentage.toStringAsFixed(1)}%)');
    });
  }

  // Private method for internal calculations
  bool _isOverBudget() {
    return _spentAmount > _totalBudget;
  }
}
