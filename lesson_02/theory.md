# 🔒 Урок 2: Інкапсуляція в Dart

## 🎯 Що ви вивчите (Розширений курс)
- Що таке інкапсуляція та чому це критично важливо
- Private та public поля та методи (детальний розбір)
- Getters та Setters (усі можливості)
- Захист даних в класах (стратегії безпеки)
- Валідація даних (різні підходи)
- Інварианти класу та забезпечення цілісності
- Контрольований доступ до внутрішніх структур
- Паттерни інкапсуляції в реальних проектах

## 🔒 Що таке інкапсуляція? (Глибоке розуміння)

**Інкапсуляція** - це один з фундаментальних принципів ООП, що означає:

1. **Приховування деталей реалізації** - внутрішня логіка прихована від зовнішнього світу
2. **Контрольований доступ** - доступ до даних тільки через визначені методи
3. **Захист цілісності** - запобігання некоректному стану об'єкта
4. **Зниження зв'язаності** - зовнішній код не залежить від внутрішньої реалізації

### Метафора з Формули 1:

**Без інкапсуляції (небезпечно):**
```dart
// ПОГАНИЙ ПРИКЛАД - все відкрито
class BadF1Car {
  double speed = 0;           // Кожен може змінити!
  double engineTemp = 90;     // Без перевірок!
  bool brakesWorking = true;  // Можна випадково зламати!
  
  void race() {
    // Що якщо хтось поставив speed = -100 або engineTemp = 1000?
    print('Їдемо зі швидкістю $speed при температурі $engineTemp');
  }
}

// Небезпечне використання
BadF1Car car = BadF1Car();
car.speed = -999;              // Від'ємна швидкість?!
car.engineTemp = 2000;         // Двигун вибухне!
car.brakesWorking = false;     // Аварія гарантована!
car.race();                    // Катастрофа!
```

**З інкапсуляцією (безпечно):**
```dart
// ХОРОШИЙ ПРИКЛАД - контрольований доступ
class SafeF1Car {
  double _speed = 0;           // Приватне - захищено
  double _engineTemp = 90;     // Приватне - контрольовано
  bool _brakesWorking = true;  // Приватне - безпечно
  
  // Контрольований доступ до швидкості
  double get speed => _speed;
  set speed(double newSpeed) {
    if (newSpeed >= 0 && newSpeed <= 350) {
      _speed = newSpeed;
      print('Швидкість встановлена: $_speed км/год');
    } else {
      print('❌ Небезпечна швидкість! Допустимо: 0-350 км/год');
    }
  }
  
  // Контрольований доступ до температури
  double get engineTemp => _engineTemp;
  set engineTemp(double temp) {
    if (temp >= 80 && temp <= 120) {
      _engineTemp = temp;
    } else {
      print('❌ Критична температура! Автоматичне охолодження...');
      _engineTemp = temp > 120 ? 120 : 80;
    }
  }
  
  // Тільки читання статусу гальм (безпека!)
  bool get brakesWorking => _brakesWorking;
  
  void race() {
    if (_brakesWorking && _engineTemp <= 120) {
      print('🏎️ Безпечна гонка: швидкість $_speed км/год, температура $_engineTemp°C');
    } else {
      print('🚨 Аварійна зупинка! Проблеми з безпекою!');
    }
  }
}
```

## 🔧 Private та Public в Dart (Детальний розбір)

### Принципи доступу в Dart:

```dart
class F1TeamDetailed {
  // 1. PUBLIC члени - доступні всюди
  String teamName;               // Відкрите поле
  String teamPrincipal;         // Відкрите поле
  
  // 2. PRIVATE члени - доступні тільки в цьому класі (та файлі)
  double _budget;               // Приватне поле
  List<String> _drivers;        // Приватна колекція
  Map<String, int> _carParts;   // Приватна структура
  
  // 3. КОНСТАНТИ - зазвичай public
  static const int maxDrivers = 2;
  static const double budgetCap = 145000000; // $145M
  
  // 4. Конструктор (зазвичай public)
  F1TeamDetailed(this.teamName, this.teamPrincipal, double initialBudget) {
    _budget = initialBudget;
    _drivers = [];
    _carParts = {
      'engine': 0,
      'chassis': 0,
      'aero': 0,
      'electronics': 0
    };
    _validateInitialState();
  }
  
  // 5. Public getters - контрольоване читання
  double get budget => _budget;
  List<String> get drivers => List.unmodifiable(_drivers); // Незмінна копія!
  int get driverCount => _drivers.length;
  
  // 6. Public setters з валідацією
  set budget(double newBudget) {
    if (_isValidBudget(newBudget)) {
      _budget = newBudget;
      print('💰 Бюджет оновлено: \$${_budget / 1000000}M');
    } else {
      throw ArgumentError('Бюджет повинен бути 0-${budgetCap / 1000000}M');
    }
  }
  
  // 7. Public методи - зовнішній інтерфейс
  bool addDriver(String driverName) {
    if (_canAddDriver(driverName)) {
      _drivers.add(driverName);
      print('✅ Гонщик $driverName доданий до $teamName');
      return true;
    }
    return false;
  }
  
  void developCarPart(String partType, int cost) {
    if (_spendBudget(cost)) {
      _carParts[partType] = (_carParts[partType] ?? 0) + 1;
      print('🔧 Розвинено $partType (рівень ${_carParts[partType]})');
    }
  }
  
  // 8. Private методи - внутрішня логіка
  bool _isValidBudget(double budget) {
    return budget >= 0 && budget <= budgetCap;
  }
  
  bool _canAddDriver(String driverName) {
    return _drivers.length < maxDrivers && 
           !_drivers.contains(driverName) &&
           driverName.isNotEmpty;
  }
  
  bool _spendBudget(int amount) {
    if (_budget >= amount) {
      _budget -= amount;
      return true;
    } else {
      print('❌ Недостатньо коштів! Потрібно: \$${amount}K, Доступно: \$${_budget / 1000}K');
      return false;
    }
  }
  
  void _validateInitialState() {
    assert(_budget >= 0, 'Бюджет не може бути від\'ємним');
    assert(_drivers.isEmpty, 'Список гонщиків повинен бути порожнім на початку');
  }
}
```

## 📝 Getters та Setters (Всі можливості)

### 1. Прості getters/setters:

```dart
class DriverPerformance {
  String _name;
  int _skillLevel;
  double _reactionTime;
  
  DriverPerformance(this._name, this._skillLevel, this._reactionTime);
  
  // Простий getter
  String get name => _name;
  int get skillLevel => _skillLevel;
  
  // Простий setter з валідацією
  set skillLevel(int level) {
    if (level >= 1 && level <= 100) {
      _skillLevel = level;
    } else {
      throw RangeError('Рівень навичок: 1-100');
    }
  }
}
```

### 2. Обчислювані властивості:

```dart
class LapTimeAnalysis {
  List<double> _lapTimes = [];
  
  void addLapTime(double time) {
    if (time > 0 && time < 200) { // Реалістичний час кола
      _lapTimes.add(time);
    }
  }
  
  // Обчислювані getters
  double get averageLapTime {
    if (_lapTimes.isEmpty) return 0.0;
    return _lapTimes.reduce((a, b) => a + b) / _lapTimes.length;
  }
  
  double get bestLapTime {
    if (_lapTimes.isEmpty) return 0.0;
    return _lapTimes.reduce((a, b) => a < b ? a : b);
  }
  
  double get worstLapTime {
    if (_lapTimes.isEmpty) return 0.0;
    return _lapTimes.reduce((a, b) => a > b ? a : b);
  }
  
  int get totalLaps => _lapTimes.length;
  
  String get performanceRating {
    if (_lapTimes.isEmpty) return 'Немає даних';
    
    double avg = averageLapTime;
    double best = bestLapTime;
    double consistency = (avg - best) / best * 100;
    
    if (consistency < 1) return 'Ідеальна консистентність';
    if (consistency < 3) return 'Відмінна консистентність';
    if (consistency < 5) return 'Хороша консистентність';
    return 'Потребує покращення';
  }
  
  // Тільки для читання - захищаємо оригінальний список
  List<double> get lapTimes => List.unmodifiable(_lapTimes);
}
```

### 3. Умовні getters/setters:

```dart
class RaceWeatherManager {
  double _temperature;
  double _humidity;
  double _windSpeed;
  bool _isRaining;
  
  RaceWeatherManager(this._temperature, this._humidity, this._windSpeed, this._isRaining);
  
  // Умовний getter
  String get trackConditions {
    if (_isRaining) return 'Wet';
    if (_temperature > 35) return 'Hot and Dry';
    if (_temperature < 10) return 'Cold and Dry';
    if (_windSpeed > 20) return 'Windy';
    return 'Optimal';
  }
  
  String get recommendedTires {
    switch (trackConditions) {
      case 'Wet': return 'Full Wet';
      case 'Hot and Dry': return 'Hard';
      case 'Cold and Dry': return 'Soft';
      case 'Windy': return 'Medium';
      default: return 'Medium';
    }
  }
  
  // Складний setter
  set weatherData(Map<String, dynamic> data) {
    _temperature = data['temp']?.toDouble() ?? _temperature;
    _humidity = data['humidity']?.toDouble() ?? _humidity;
    _windSpeed = data['wind']?.toDouble() ?? _windSpeed;
    _isRaining = data['rain'] ?? _isRaining;
    
    _validateWeatherData();
  }
  
  void _validateWeatherData() {
    if (_temperature < -20 || _temperature > 60) {
      throw ArgumentError('Нереалістична температура: $_temperature°C');
    }
    if (_humidity < 0 || _humidity > 100) {
      throw ArgumentError('Вологість повинна бути 0-100%');
    }
  }
}
```

## 🛡️ Стратегії захисту даних

### 1. Immutable objects (Незмінні об'єкти):

```dart
class ImmutableCircuit {
  final String _name;
  final String _country;
  final double _length;
  final int _laps;
  final List<String> _sectors;
  
  const ImmutableCircuit(this._name, this._country, this._length, this._laps, this._sectors);
  
  // Тільки getters - змінити неможливо!
  String get name => _name;
  String get country => _country;
  double get length => _length;
  int get laps => _laps;
  List<String> get sectors => List.unmodifiable(_sectors);
  
  // Обчислювані властивості
  double get totalDistance => _length * _laps;
  String get circuitInfo => '$_name, $_country (${_length}km × $_laps laps)';
  
  // Створення нового об'єкта замість зміни
  ImmutableCircuit withLaps(int newLaps) {
    return ImmutableCircuit(_name, _country, _length, newLaps, _sectors);
  }
}
```

### 2. Контрольовані колекції:

```dart
class TeamDriverManager {
  final List<String> _drivers = [];
  final List<String> _reserveDrivers = [];
  static const int _maxMainDrivers = 2;
  static const int _maxReserveDrivers = 3;
  
  // Контрольоване додавання
  bool addMainDriver(String driver) {
    if (_drivers.length >= _maxMainDrivers) {
      print('❌ Максимум $_maxMainDrivers основних гонщиків');
      return false;
    }
    
    if (_isDriverValid(driver)) {
      _drivers.add(driver);
      print('✅ $driver доданий як основний гонщик');
      return true;
    }
    return false;
  }
  
  bool addReserveDriver(String driver) {
    if (_reserveDrivers.length >= _maxReserveDrivers) {
      print('❌ Максимум $_maxReserveDrivers резервних гонщиків');
      return false;
    }
    
    if (_isDriverValid(driver) && !_drivers.contains(driver)) {
      _reserveDrivers.add(driver);
      print('✅ $driver доданий як резервний гонщик');
      return true;
    }
    return false;
  }
  
  // Безпечне видалення
  bool removeDriver(String driver) {
    if (_drivers.remove(driver)) {
      print('🔄 $driver видалений з основного складу');
      return true;
    }
    if (_reserveDrivers.remove(driver)) {
      print('🔄 $driver видалений з резерву');
      return true;
    }
    return false;
  }
  
  // Безпечний доступ - тільки копії!
  List<String> get mainDrivers => List.unmodifiable(_drivers);
  List<String> get reserveDrivers => List.unmodifiable(_reserveDrivers);
  List<String> get allDrivers => List.unmodifiable([..._drivers, ..._reserveDrivers]);
  
  bool _isDriverValid(String driver) {
    return driver.isNotEmpty && 
           !_drivers.contains(driver) && 
           !_reserveDrivers.contains(driver);
  }
}
```

### 3. Стан з валідацією:

```dart
class CarSetupManager {
  double _frontWing = 5.0;
  double _rearWing = 7.0;
  double _suspensionFront = 3.0;
  double _suspensionRear = 3.5;
  Map<String, double> _tyrePressure = {'FL': 1.8, 'FR': 1.8, 'RL': 1.9, 'RR': 1.9};
  
  // Getters з форматуванням
  String get setupSummary {
    return '''
🏎️ Car Setup:
   Wings: F$_frontWing / R$_rearWing
   Suspension: F$_suspensionFront / R$_suspensionRear
   Tyre Pressure: ${_tyrePressure.entries.map((e) => '${e.key}:${e.value}').join(', ')}
   Downforce: ${(_frontWing + _rearWing) * 10}kg
   ''';
  }
  
  // Складні setters з перевірками
  set frontWing(double angle) {
    if (angle >= 1.0 && angle <= 10.0) {
      _frontWing = angle;
      _rebalanceSetup();
    } else {
      throw ArgumentError('Кут переднього крила: 1.0-10.0°');
    }
  }
  
  set rearWing(double angle) {
    if (angle >= 1.0 && angle <= 15.0) {
      _rearWing = angle;
      _rebalanceSetup();
    } else {
      throw ArgumentError('Кут заднього крила: 1.0-15.0°');
    }
  }
  
  void adjustTyrePressure(String position, double pressure) {
    if (!_tyrePressure.containsKey(position)) {
      throw ArgumentError('Невірна позиція шини: $position');
    }
    if (pressure < 1.0 || pressure > 3.0) {
      throw ArgumentError('Тиск шини: 1.0-3.0 bar');
    }
    
    _tyrePressure[position] = pressure;
    print('🔧 Тиск шини $position встановлено: ${pressure} bar');
  }
  
  // Автоматичне балансування
  void _rebalanceSetup() {
    double balance = _frontWing / _rearWing;
    if (balance < 0.3) {
      print('⚠️ Недостатній обв'язок (understeer)');
    } else if (balance > 0.8) {
      print('⚠️ Надмірний обв'язок (oversteer)');
    } else {
      print('✅ Збалансоване налаштування');
    }
  }
  
  // Готові налаштування
  void applyPreset(String presetName) {
    switch (presetName.toLowerCase()) {
      case 'monaco':
        _frontWing = 8.0;
        _rearWing = 10.0;
        print('🏁 Застосовано налаштування для Monaco (високий downforce)');
        break;
      case 'monza':
        _frontWing = 2.0;
        _rearWing = 3.0;
        print('🏁 Застосовано налаштування для Monza (низький downforce)');
        break;
      case 'silverstone':
        _frontWing = 5.0;
        _rearWing = 7.0;
        print('🏁 Застосовано налаштування для Silverstone (середній downforce)');
        break;
      default:
        throw ArgumentError('Невідомий пресет: $presetName');
    }
    _rebalanceSetup();
  }
}
```

## 🏆 Практичний приклад: Система телеметрії

```dart
class F1TelemetrySystem {
  final String _driverName;
  final Map<String, List<double>> _telemetryData = {};
  final Map<String, double> _limits = {
    'speed': 350.0,
    'rpm': 15000.0,
    'engine_temp': 120.0,
    'brake_temp': 800.0,
    'tire_temp': 100.0,
  };
  
  DateTime _lastUpdate = DateTime.now();
  bool _isRecording = false;
  
  F1TelemetrySystem(this._driverName);
  
  // Публічний інтерфейс
  String get driverName => _driverName;
  bool get isRecording => _isRecording;
  DateTime get lastUpdate => _lastUpdate;
  
  void startRecording() {
    _isRecording = true;
    print('📊 Телеметрія запущена для $_driverName');
  }
  
  void stopRecording() {
    _isRecording = false;
    print('📊 Телеметрія зупинена для $_driverName');
  }
  
  // Контрольований доступ до даних
  void recordDataPoint(String parameter, double value) {
    if (!_isRecording) {
      print('❌ Телеметрія не активна');
      return;
    }
    
    if (_validateDataPoint(parameter, value)) {
      _telemetryData.putIfAbsent(parameter, () => []);
      _telemetryData[parameter]!.add(value);
      _lastUpdate = DateTime.now();
      
      if (_isWarningValue(parameter, value)) {
        _triggerWarning(parameter, value);
      }
    }
  }
  
  // Безпечний доступ до аналітики
  Map<String, double> getParameterStats(String parameter) {
    if (!_telemetryData.containsKey(parameter)) {
      return {'count': 0, 'avg': 0, 'min': 0, 'max': 0};
    }
    
    List<double> data = _telemetryData[parameter]!;
    return {
      'count': data.length.toDouble(),
      'avg': data.reduce((a, b) => a + b) / data.length,
      'min': data.reduce((a, b) => a < b ? a : b),
      'max': data.reduce((a, b) => a > b ? a : b),
    };
  }
  
  String generateReport() {
    StringBuffer report = StringBuffer();
    report.writeln('📊 Телеметричний звіт: $_driverName');
    report.writeln('Останнє оновлення: $_lastUpdate');
    report.writeln('Статус: ${_isRecording ? "Активна" : "Неактивна"}');
    report.writeln('');
    
    for (String parameter in _telemetryData.keys) {
      Map<String, double> stats = getParameterStats(parameter);
      report.writeln('$parameter:');
      report.writeln('  Точок даних: ${stats['count']!.toInt()}');
      report.writeln('  Середнє: ${stats['avg']!.toStringAsFixed(2)}');
      report.writeln('  Мін: ${stats['min']!.toStringAsFixed(2)}');
      report.writeln('  Макс: ${stats['max']!.toStringAsFixed(2)}');
      report.writeln('');
    }
    
    return report.toString();
  }
  
  // Приватні методи - захист цілісності
  bool _validateDataPoint(String parameter, double value) {
    if (parameter.isEmpty) {
      print('❌ Порожня назва параметра');
      return false;
    }
    
    if (value.isNaN || value.isInfinite) {
      print('❌ Некоректне значення: $value');
      return false;
    }
    
    if (_limits.containsKey(parameter) && value > _limits[parameter]!) {
      print('❌ Значення $parameter ($value) перевищує ліміт (${_limits[parameter]})');
      return false;
    }
    
    return true;
  }
  
  bool _isWarningValue(String parameter, double value) {
    if (!_limits.containsKey(parameter)) return false;
    return value > _limits[parameter]! * 0.9; // 90% від ліміту
  }
  
  void _triggerWarning(String parameter, double value) {
    print('⚠️ ПОПЕРЕДЖЕННЯ: $parameter = $value (ліміт: ${_limits[parameter]})');
  }
}
```

## ✅ Переваги інкапсуляції (Розширені)

### 1. **Безпека даних:**
```dart
// Без інкапсуляції - небезпечно
class UnsafeBank {
  double balance = 1000.0; // Кожен може змінити!
}

// З інкапсуляцією - безпечно
class SafeBank {
  double _balance = 1000.0;
  
  double get balance => _balance;
  
  bool withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      return true;
    }
    return false;
  }
}
```

### 2. **Інваріанти класу:**
```dart
class Rectangle {
  double _width;
  double _height;
  
  Rectangle(this._width, this._height) {
    _validateDimensions();
  }
  
  set width(double w) {
    if (w > 0) {
      _width = w;
      _validateDimensions();
    }
  }
  
  void _validateDimensions() {
    assert(_width > 0 && _height > 0, 'Розміри повинні бути позитивними');
  }
}
```

### 3. **Легкість рефакторингу:**
```dart
class EmailService {
  String _serverUrl;
  
  EmailService(this._serverUrl);
  
  // Можемо змінити реалізацію без впливу на клієнтський код
  Future<bool> sendEmail(String to, String subject, String body) async {
    // Версія 1: Прямий HTTP запит
    // Версія 2: Через Queue
    // Версія 3: Через третю сторону
    return _internalSendEmail(to, subject, body);
  }
  
  Future<bool> _internalSendEmail(String to, String subject, String body) async {
    // Внутрішня реалізація може змінюватися
    return true;
  }
}
```

## 🎮 Готові до практики?

Тепер ви розумієте:
- ✅ **Чому інкапсуляція критично важлива** для безпеки та надійності
- ✅ **Як використовувати private/public** для контролю доступу
- ✅ **Всі можливості getters/setters** включно з обчислюваними властивостями
- ✅ **Стратегії валідації даних** та захисту цілісності
- ✅ **Паттерни безпечної роботи з колекціями** та складними структурами
- ✅ **Як будувати надійні API** для ваших класів

Перегляньте `examples.dart` для робочих прикладів, а потім спробуйте `practice.dart`!

---
**💡 Пам'ятайте**: Інкапсуляція - це не просто приховування даних, це створення безпечного та надійного інтерфейсу для роботи з об'єктами! У Формулі 1 гонщик не може безпосередньо змінити налаштування двигуна - він робить це через контрольовані системи! 🏎️🔒 