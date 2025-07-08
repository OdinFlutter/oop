# 🎯 Урок 5: Абстракція в Dart

## 🎯 Що ви вивчите (Розширений курс)
- Що таке абстракція та її фундаментальна роль в ООП
- Абстрактні класи та методи (детальний розбір)
- Інтерфейси та їх використання для абстракції
- Міксини (Mixins) та їх застосування
- Композиція vs наслідування (стратегії вибору)
- Паттерни абстракції в реальних проектах
- Абстракція через узагальнені типи (Generics)
- Абстрактні фабрики та будівельники
- Стратегії тестування абстрактного коду
- Антипатерни абстракції та як їх уникнути

## 🎯 Що таке абстракція? (Глибоке розуміння)

**Абстракція** - це фундаментальний принцип ООП, що дозволяє приховувати складні деталі реалізації та показувати тільки необхідний функціонал.

### Основні принципи:

1. **Приховування складності** - користувач не знає про внутрішню реалізацію
2. **Простий інтерфейс** - зрозумілі методи для взаємодії
3. **Розділення відповідальності** - кожен рівень має свою роль
4. **Зниження зв'язаності** - зміни в реалізації не впливають на інтерфейс

### Метафора з Формули 1:

**Без абстракції (складний код):**
```dart
// Поганий підхід - все відкрито, складно
class ComplexF1Car {
  // Внутрішні деталі двигуна
  double _engineTemperature = 90.0;
  double _oilPressure = 2.5;
  int _rpm = 12000;
  double _fuelFlow = 100.0;
  bool _turboActive = false;
  double _batteryCharge = 80.0;
  
  // Складні внутрішні методи
  void _adjustFuelInjection(double amount) {
    _fuelFlow = amount;
    _engineTemperature += 0.1;
    if (_fuelFlow > 120) _turboActive = true;
  }
  
  void _manageBatterySystem() {
    if (_rpm > 10000) {
      _batteryCharge += 0.5;
      if (_batteryCharge > 100) _batteryCharge = 100;
    }
  }
  
  void _updateEngineParameters() {
    _engineTemperature += (_rpm / 1000) * 0.1;
    _oilPressure = 2.0 + (_rpm / 15000) * 1.0;
  }
  
  // Складний публічний метод
  void accelerate() {
    _rpm += 1000;
    _adjustFuelInjection(_fuelFlow + 10);
    _manageBatterySystem();
    _updateEngineParameters();
    
    if (_engineTemperature > 120) {
      print('⚠️ Engine overheating!');
    }
    if (_oilPressure < 1.5) {
      print('⚠️ Low oil pressure!');
    }
    if (_batteryCharge < 20) {
      print('⚠️ Low battery!');
    }
    
    print('Car accelerating...');
  }
}

// Використання - складно та небезпечно
var car = ComplexF1Car();
car.accelerate(); // Користувач не знає, що відбувається всередині
```

**З абстракцією (простий код):**
```dart
// Хороший підхід - простий інтерфейс
abstract class F1Car {
  String team;
  F1Car(this.team);
  
  // Простий публічний інтерфейс
  void accelerate();
  void brake();
  void turn(String direction);
  String getStatus();
}

class RedBullF1Car extends F1Car {
  RedBullF1Car() : super('Red Bull Racing');
  
  // Складні внутрішні деталі приховані
  final Engine _engine = Engine();
  final BatterySystem _battery = BatterySystem();
  final TelemetrySystem _telemetry = TelemetrySystem();
  
  @override
  void accelerate() {
    _engine.increaseRPM();
    _battery.charge();
    _telemetry.recordData();
    
    if (_engine.isOverheating() || _battery.isLow()) {
      print('⚠️ System warning - check status');
    } else {
      print('🏎️ $team car accelerating smoothly');
    }
  }
  
  @override
  void brake() {
    _engine.decreaseRPM();
    _battery.regenerate();
    print('🛑 $team car braking');
  }
  
  @override
  void turn(String direction) {
    print('🔄 $team car turning $direction');
  }
  
  @override
  String getStatus() {
    return '${_engine.getStatus()}, ${_battery.getStatus()}';
  }
}

// Використання - просто та зрозуміло
var car = RedBullF1Car();
car.accelerate(); // Простий виклик
car.brake();      // Простий виклик
print(car.getStatus()); // Отримання статусу
```

## 🏎️ Абстрактні класи та методи (Детальний розбір)

### 1. Базові абстрактні класи:

```dart
// Абстрактний базовий клас для всіх транспортних засобів
abstract class Vehicle {
  String brand;
  int maxSpeed;
  
  Vehicle(this.brand, this.maxSpeed);
  
  // Абстрактні методи - повинні бути реалізовані
  abstract void start();
  abstract void stop();
  abstract void accelerate();
  abstract void brake();
  
  // Конкретні методи - загальна функціональність
  void displayInfo() {
    print('$brand - Max Speed: $maxSpeed km/h');
  }
  
  // Метод з реалізацією за замовчуванням
  void honk() {
    print('$brand vehicle honking');
  }
  
  // Фінальний метод - не може бути перевизначений
  final String getVehicleType() {
    return 'Generic Vehicle';
  }
}

// Конкретні реалізації
class F1Car extends Vehicle {
  String team;
  int aerodynamicLevel;
  
  F1Car(String brand, int maxSpeed, this.team, this.aerodynamicLevel) 
    : super(brand, maxSpeed);
  
  @override
  void start() {
    print('🏎️ $brand F1 car starting with hybrid system');
  }
  
  @override
  void stop() {
    print('🛑 $brand F1 car stopping with carbon brakes');
  }
  
  @override
  void accelerate() {
    print('⚡ $brand F1 car accelerating to $maxSpeed km/h');
  }
  
  @override
  void brake() {
    print('🛑 $brand F1 car braking from $maxSpeed to 0 km/h');
  }
  
  // Специфічні для F1 методи
  void deployDRS() {
    print('💨 DRS deployed for $brand F1 car');
  }
  
  void pitStop() {
    print('🔧 $brand F1 car entering pit lane');
  }
}

class RallyCar extends Vehicle {
  bool isFourWheelDrive;
  
  RallyCar(String brand, int maxSpeed, this.isFourWheelDrive) 
    : super(brand, maxSpeed);
  
  @override
  void start() {
    print('🌲 $brand rally car starting off-road');
  }
  
  @override
  void stop() {
    print('🛑 $brand rally car stopping on gravel');
  }
  
  @override
  void accelerate() {
    String drivetrain = isFourWheelDrive ? '4WD' : '2WD';
    print('⚡ $brand rally car accelerating with $drivetrain');
  }
  
  @override
  void brake() {
    print('🛑 $brand rally car braking on loose surface');
  }
  
  // Специфічні для ралі методи
  void offRoadMode() {
    print('🌲 $brand rally car switching to off-road mode');
  }
}
```

### 2. Складні абстрактні класи з ієрархією:

```dart
// Абстрактний клас для всіх систем автомобіля
abstract class CarSystem {
  String name;
  bool isActive;
  
  CarSystem(this.name, this.isActive);
  
  abstract void initialize();
  abstract void shutdown();
  abstract String getStatus();
  
  void activate() {
    isActive = true;
    print('✅ $name system activated');
  }
  
  void deactivate() {
    isActive = false;
    print('❌ $name system deactivated');
  }
}

// Абстрактний клас для двигунів
abstract class Engine extends CarSystem {
  int maxRPM;
  double currentRPM;
  
  Engine(String name, this.maxRPM) : super(name, true);
  
  @override
  void initialize() {
    currentRPM = 0;
    print('🔧 $name engine initialized');
  }
  
  @override
  void shutdown() {
    currentRPM = 0;
    isActive = false;
    print('🔧 $name engine shut down');
  }
  
  abstract void increaseRPM(int amount);
  abstract void decreaseRPM(int amount);
  
  @override
  String getStatus() {
    return '$name: ${currentRPM.toStringAsFixed(0)} RPM / $maxRPM RPM';
  }
}

// Конкретні реалізації двигунів
class F1Engine extends Engine {
  bool turboActive;
  double fuelFlow;
  
  F1Engine() : super('F1 Hybrid Engine', 15000);
  
  @override
  void increaseRPM(int amount) {
    if (currentRPM + amount <= maxRPM) {
      currentRPM += amount;
      fuelFlow = currentRPM / 100;
      turboActive = currentRPM > 12000;
      print('🔧 F1 engine: ${currentRPM.toStringAsFixed(0)} RPM');
    }
  }
  
  @override
  void decreaseRPM(int amount) {
    if (currentRPM - amount >= 0) {
      currentRPM -= amount;
      fuelFlow = currentRPM / 100;
      turboActive = currentRPM > 12000;
      print('🔧 F1 engine: ${currentRPM.toStringAsFixed(0)} RPM');
    }
  }
  
  @override
  String getStatus() {
    String turbo = turboActive ? 'TURBO ON' : 'TURBO OFF';
    return '${super.getStatus()} | Fuel: ${fuelFlow.toStringAsFixed(1)} L/min | $turbo';
  }
}

class RallyEngine extends Engine {
  bool fourWheelDrive;
  
  RallyEngine() : super('Rally Engine', 8000);
  
  @override
  void increaseRPM(int amount) {
    if (currentRPM + amount <= maxRPM) {
      currentRPM += amount;
      print('🔧 Rally engine: ${currentRPM.toStringAsFixed(0)} RPM');
    }
  }
  
  @override
  void decreaseRPM(int amount) {
    if (currentRPM - amount >= 0) {
      currentRPM -= amount;
      print('🔧 Rally engine: ${currentRPM.toStringAsFixed(0)} RPM');
    }
  }
  
  @override
  String getStatus() {
    return '${super.getStatus()} | 4WD: ${fourWheelDrive ? "ON" : "OFF"}';
  }
}
```

## 🔧 Інтерфейси та їх використання

### 1. Базові інтерфейси:

```dart
// Інтерфейси для різних аспектів автомобіля
abstract class Movable {
  void move();
  void stop();
  double getCurrentSpeed();
}

abstract class Fuelable {
  void refuel(double amount);
  double getFuelLevel();
  bool needsRefueling();
}

abstract class Maintainable {
  void service();
  bool needsMaintenance();
  int getServiceInterval();
}

abstract class Trackable {
  void updatePosition(String position);
  List<String> getPositionHistory();
  String getCurrentPosition();
}

// Клас, що реалізує кілька інтерфейсів
class ModernF1Car implements Movable, Fuelable, Maintainable, Trackable {
  String team;
  double currentSpeed = 0.0;
  double fuelLevel = 100.0;
  int serviceInterval = 0;
  List<String> positionHistory = [];
  String currentPosition = 'P0';
  
  ModernF1Car(this.team);
  
  // Реалізація Movable
  @override
  void move() {
    currentSpeed = 200.0;
    print('🏎️ $team F1 car is moving at ${currentSpeed} km/h');
  }
  
  @override
  void stop() {
    currentSpeed = 0.0;
    print('🛑 $team F1 car stopped');
  }
  
  @override
  double getCurrentSpeed() => currentSpeed;
  
  // Реалізація Fuelable
  @override
  void refuel(double amount) {
    fuelLevel = (fuelLevel + amount).clamp(0.0, 100.0);
    print('⛽ $team F1 car refueled: ${fuelLevel.toStringAsFixed(1)}%');
  }
  
  @override
  double getFuelLevel() => fuelLevel;
  
  @override
  bool needsRefueling() => fuelLevel < 20.0;
  
  // Реалізація Maintainable
  @override
  void service() {
    serviceInterval = 0;
    print('🔧 $team F1 car serviced');
  }
  
  @override
  bool needsMaintenance() => serviceInterval > 1000;
  
  @override
  int getServiceInterval() => serviceInterval;
  
  // Реалізація Trackable
  @override
  void updatePosition(String position) {
    positionHistory.add(currentPosition);
    currentPosition = position;
    print('📊 $team F1 car position: $position');
  }
  
  @override
  List<String> getPositionHistory() => List.unmodifiable(positionHistory);
  
  @override
  String getCurrentPosition() => currentPosition;
  
  // Специфічні для F1 методи
  void deployDRS() {
    if (currentSpeed > 150) {
      print('💨 DRS deployed for $team F1 car');
    }
  }
  
  void pitStop() {
    print('🔧 $team F1 car entering pit lane');
    updatePosition('PIT');
  }
}
```

### 2. Складні інтерфейси з узагальненими типами:

```dart
// Узагальнений інтерфейс для зберігання даних
abstract class DataStorage<T> {
  void save(T data);
  T? retrieve(String key);
  void delete(String key);
  List<T> getAll();
  bool exists(String key);
}

// Узагальнений інтерфейс для аналізу даних
abstract class DataAnalyzer<T> {
  double calculateAverage(List<T> data);
  T findMin(List<T> data);
  T findMax(List<T> data);
  List<T> sort(List<T> data);
  Map<String, int> getFrequency(List<T> data);
}

// Конкретні реалізації
class LapTimeStorage implements DataStorage<double> {
  Map<String, double> _lapTimes = {};
  
  @override
  void save(double data) {
    String key = 'lap_${_lapTimes.length + 1}';
    _lapTimes[key] = data;
    print('💾 Lap time saved: ${data.toStringAsFixed(3)}s');
  }
  
  @override
  double? retrieve(String key) => _lapTimes[key];
  
  @override
  void delete(String key) {
    _lapTimes.remove(key);
    print('🗑️ Lap time deleted: $key');
  }
  
  @override
  List<double> getAll() => _lapTimes.values.toList();
  
  @override
  bool exists(String key) => _lapTimes.containsKey(key);
}

class LapTimeAnalyzer implements DataAnalyzer<double> {
  @override
  double calculateAverage(List<double> data) {
    if (data.isEmpty) return 0.0;
    return data.reduce((a, b) => a + b) / data.length;
  }
  
  @override
  double findMin(List<double> data) {
    if (data.isEmpty) return 0.0;
    return data.reduce((a, b) => a < b ? a : b);
  }
  
  @override
  double findMax(List<double> data) {
    if (data.isEmpty) return 0.0;
    return data.reduce((a, b) => a > b ? a : b);
  }
  
  @override
  List<double> sort(List<double> data) {
    var sorted = List<double>.from(data);
    sorted.sort();
    return sorted;
  }
  
  @override
  Map<String, int> getFrequency(List<double> data) {
    Map<String, int> frequency = {};
    for (double time in data) {
      String range = _getTimeRange(time);
      frequency[range] = (frequency[range] ?? 0) + 1;
    }
    return frequency;
  }
  
  String _getTimeRange(double time) {
    if (time < 80.0) return 'Under 80s';
    if (time < 85.0) return '80-85s';
    if (time < 90.0) return '85-90s';
    return 'Over 90s';
  }
}
```

## 🎯 Міксини (Mixins) - Розширене вивчення

### 1. Базові міксини:

```dart
// Міксин для комунікації
mixin Communicable {
  String _lastMessage = '';
  
  void sendMessage(String message) {
    _lastMessage = message;
    print('📻 Radio: $message');
  }
  
  void receiveMessage(String message) {
    print('📻 Received: $message');
  }
  
  String getLastMessage() => _lastMessage;
}

// Міксин для стратегій
mixin Strategical {
  String _currentStrategy = 'Default';
  List<String> _strategyHistory = [];
  
  void changeStrategy(String strategy) {
    _strategyHistory.add(_currentStrategy);
    _currentStrategy = strategy;
    print('🎯 Strategy changed: $_currentStrategy');
  }
  
  String getCurrentStrategy() => _currentStrategy;
  
  List<String> getStrategyHistory() => List.unmodifiable(_strategyHistory);
  
  void revertToPreviousStrategy() {
    if (_strategyHistory.isNotEmpty) {
      _currentStrategy = _strategyHistory.removeLast();
      print('🔄 Reverted to: $_currentStrategy');
    }
  }
}

// Міксин для телеметрії
mixin TelemetryCapable {
  Map<String, double> _telemetryData = {};
  
  void recordTelemetry(String parameter, double value) {
    _telemetryData[parameter] = value;
  }
  
  double? getTelemetryValue(String parameter) {
    return _telemetryData[parameter];
  }
  
  Map<String, double> getAllTelemetry() {
    return Map.unmodifiable(_telemetryData);
  }
  
  void clearTelemetry() {
    _telemetryData.clear();
    print('🗑️ Telemetry data cleared');
  }
}

// Міксин для DRS системи
mixin DRSCapable {
  bool _drsEnabled = false;
  int _drsActivations = 0;
  
  void activateDRS() {
    if (!_drsEnabled) {
      _drsEnabled = true;
      _drsActivations++;
      print('💨 DRS activated! (+15 km/h)');
    }
  }
  
  void deactivateDRS() {
    if (_drsEnabled) {
      _drsEnabled = false;
      print('🛑 DRS deactivated');
    }
  }
  
  bool isDRSEnabled() => _drsEnabled;
  
  int getDRSActivations() => _drsActivations;
  
  void resetDRSCounter() {
    _drsActivations = 0;
    print('🔄 DRS counter reset');
  }
}
```

### 2. Складні міксини з умовами:

```dart
// Міксин з умовами використання
mixin WeatherAware on Vehicle {
  String _currentWeather = 'Dry';
  Map<String, String> _weatherResponses = {
    'Dry': 'Optimal conditions',
    'Wet': 'Reduced speed, increased caution',
    'Rain': 'Wet tires required',
    'Fog': 'Reduced visibility, safety car likely'
  };
  
  void updateWeather(String weather) {
    _currentWeather = weather;
    print('🌤️ Weather updated: $weather');
    _respondToWeather();
  }
  
  void _respondToWeather() {
    String response = _weatherResponses[_currentWeather] ?? 'Unknown conditions';
    print('📊 Weather response: $response');
  }
  
  String getCurrentWeather() => _currentWeather;
  
  bool isWeatherSafe() {
    return _currentWeather == 'Dry' || _currentWeather == 'Wet';
  }
}

// Міксин з обмеженнями
mixin PerformanceLimited {
  double _maxPerformance = 100.0;
  double _currentPerformance = 100.0;
  
  void setPerformanceLimit(double limit) {
    _maxPerformance = limit.clamp(0.0, 100.0);
    print('⚡ Performance limit set to: ${_maxPerformance}%');
  }
  
  void reducePerformance(double amount) {
    _currentPerformance = (_currentPerformance - amount).clamp(0.0, _maxPerformance);
    print('⚠️ Performance reduced to: ${_currentPerformance}%');
  }
  
  void restorePerformance() {
    _currentPerformance = _maxPerformance;
    print('✅ Performance restored to: ${_currentPerformance}%');
  }
  
  double getCurrentPerformance() => _currentPerformance;
  
  bool isPerformanceLimited() => _currentPerformance < _maxPerformance;
}

// Клас, що використовує кілька міксинів
class AdvancedF1Car extends Vehicle 
    with Communicable, Strategical, TelemetryCapable, DRSCapable, WeatherAware, PerformanceLimited {
  
  String team;
  
  AdvancedF1Car(String brand, int maxSpeed, this.team) : super(brand, maxSpeed);
  
  @override
  void accelerate() {
    if (isWeatherSafe() && !isPerformanceLimited()) {
      print('🏎️ $team F1 car accelerating at full performance');
      recordTelemetry('speed', 300.0);
      recordTelemetry('rpm', 15000.0);
    } else {
      print('⚠️ $team F1 car accelerating with restrictions');
      recordTelemetry('speed', 200.0);
      recordTelemetry('rpm', 10000.0);
    }
  }
  
  @override
  void brake() {
    print('🛑 $team F1 car braking');
    recordTelemetry('brake_temp', 800.0);
  }
  
  void raceLap() {
    sendMessage('Starting new lap');
    changeStrategy('Attack Mode');
    activateDRS();
    accelerate();
    deactivateDRS();
    brake();
    sendMessage('Lap completed');
  }
  
  void displayFullStatus() {
    print('''
📊 $team F1 Car Status:
   Brand: $brand
   Max Speed: $maxSpeed km/h
   Current Strategy: ${getCurrentStrategy()}
   DRS Status: ${isDRSEnabled() ? "ON" : "OFF"}
   Weather: ${getCurrentWeather()}
   Performance: ${getCurrentPerformance()}%
   Last Message: ${getLastMessage()}
    ''');
  }
}
```

## 🏆 Композиція vs Наслідування (Детальний розбір)

### 1. Композиція (Composition):

```dart
// Компоненти автомобіля
class Engine {
  String type;
  int horsepower;
  
  Engine(this.type, this.horsepower);
  
  void start() => print('🔧 $type engine starting');
  void stop() => print('🔧 $type engine stopping');
  String getStatus() => '$type engine: $horsepower HP';
}

class Transmission {
  String type;
  int gears;
  
  Transmission(this.type, this.gears);
  
  void shiftUp() => print('⚙️ Shifting up');
  void shiftDown() => print('⚙️ Shifting down');
  String getStatus() => '$type transmission: $gears gears';
}

class Aerodynamics {
  double downforce;
  double drag;
  
  Aerodynamics(this.downforce, this.drag);
  
  void adjustWing(double angle) {
    downforce = angle * 10;
    print('🪽 Wing adjusted: ${downforce.toStringAsFixed(1)} kg downforce');
  }
  
  String getStatus() => 'Downforce: ${downforce.toStringAsFixed(1)} kg, Drag: ${drag.toStringAsFixed(2)}';
}

// Автомобіль через композицію
class ComposedF1Car {
  String team;
  final Engine engine;
  final Transmission transmission;
  final Aerodynamics aerodynamics;
  
  ComposedF1Car(this.team, this.engine, this.transmission, this.aerodynamics);
  
  void start() {
    print('🏎️ $team F1 car starting...');
    engine.start();
    print('✅ $team F1 car ready');
  }
  
  void accelerate() {
    print('⚡ $team F1 car accelerating...');
    transmission.shiftUp();
    print('🏎️ $team F1 car at high speed');
  }
  
  void brake() {
    print('🛑 $team F1 car braking...');
    transmission.shiftDown();
    print('🛑 $team F1 car stopped');
  }
  
  void displaySpecs() {
    print('''
📊 $team F1 Car Specifications:
   ${engine.getStatus()}
   ${transmission.getStatus()}
   ${aerodynamics.getStatus()}
    ''');
  }
}

// Використання композиції
void main() {
  var engine = Engine('V6 Hybrid', 1000);
  var transmission = Transmission('8-Speed', 8);
  var aerodynamics = Aerodynamics(500.0, 0.15);
  
  var car = ComposedF1Car('Red Bull', engine, transmission, aerodynamics);
  car.start();
  car.accelerate();
  car.brake();
  car.displaySpecs();
}
```

### 2. Наслідування vs Композиція:

```dart
// Наслідування - "is-a" відношення
abstract class Vehicle {
  String brand;
  Vehicle(this.brand);
  
  abstract void move();
  abstract void stop();
}

class F1Car extends Vehicle {
  F1Car(String brand) : super(brand);
  
  @override
  void move() => print('🏎️ $brand F1 car moving');
  
  @override
  void stop() => print('🛑 $brand F1 car stopping');
}

// Композиція - "has-a" відношення
class F1CarComposed {
  String brand;
  final Engine engine;
  final Transmission transmission;
  
  F1CarComposed(this.brand, this.engine, this.transmission);
  
  void move() {
    engine.start();
    transmission.shiftUp();
    print('🏎️ $brand F1 car moving');
  }
  
  void stop() {
    transmission.shiftDown();
    engine.stop();
    print('🛑 $brand F1 car stopping');
  }
}
```

## 🏆 Практичний приклад: Система управління гонкою

```dart
// Абстрактний клас для всіх учасників гонки
abstract class RaceParticipant {
  String name;
  int number;
  
  RaceParticipant(this.name, this.number);
  
  abstract void participate();
  abstract String getRole();
  
  void displayInfo() {
    print('$getRole(): $name (#$number)');
  }
}

// Міксини для різних можливостей
mixin Communicable {
  void sendMessage(String message) {
    print('📻 $message');
  }
}

mixin Strategical {
  String _strategy = 'Default';
  
  void setStrategy(String strategy) {
    _strategy = strategy;
    print('🎯 Strategy set to: $strategy');
  }
  
  String getStrategy() => _strategy;
}

mixin DataAnalytical {
  List<double> _data = [];
  
  void addDataPoint(double value) {
    _data.add(value);
  }
  
  double getAverage() {
    if (_data.isEmpty) return 0.0;
    return _data.reduce((a, b) => a + b) / _data.length;
  }
  
  double getBest() {
    if (_data.isEmpty) return 0.0;
    return _data.reduce((a, b) => a < b ? a : b);
  }
}

// Конкретні класи учасників
class F1Driver extends RaceParticipant with Communicable, Strategical {
  String team;
  int championships;
  
  F1Driver(String name, int number, this.team, this.championships) 
    : super(name, number);
  
  @override
  void participate() {
    print('🏎️ $name ($team) participating in F1 race');
    sendMessage('Ready for formation lap');
    setStrategy('Attack Mode');
  }
  
  @override
  String getRole() => 'F1 Driver';
  
  void qualify() {
    print('$name qualifying...');
  }
  
  void pitStop() {
    print('$name entering pit lane...');
  }
}

class TeamPrincipal extends RaceParticipant with Communicable, Strategical {
  String team;
  int experienceYears;
  
  TeamPrincipal(String name, int number, this.team, this.experienceYears) 
    : super(name, number);
  
  @override
  void participate() {
    print('👔 $name managing $team');
    sendMessage('Team strategy meeting');
    setStrategy('Conservative');
  }
  
  @override
  String getRole() => 'Team Principal';
  
  void makeDecision() {
    print('$name making strategic decision');
  }
}

class Engineer extends RaceParticipant with Communicable, DataAnalytical {
  String specialization;
  String team;
  
  Engineer(String name, int number, this.specialization, this.team) 
    : super(name, number);
  
  @override
  void participate() {
    print('🔧 $name working as $specialization engineer');
    sendMessage('Telemetry analysis complete');
  }
  
  @override
  String getRole() => 'Engineer';
  
  void analyzeData() {
    print('$name analyzing telemetry data');
    addDataPoint(85.234); // Приклад даних
    addDataPoint(84.987);
    print('Average lap time: ${getAverage().toStringAsFixed(3)}s');
    print('Best lap time: ${getBest().toStringAsFixed(3)}s');
  }
  
  void adjustSetup() {
    print('$name adjusting car setup');
  }
}

// Система управління гонкою
class RaceManagementSystem {
  List<RaceParticipant> participants = [];
  
  void addParticipant(RaceParticipant participant) {
    participants.add(participant);
    print('✅ ${participant.getRole()} ${participant.name} added');
  }
  
  void startRace() {
    print('\n🏁 RACE START!');
    print('Participants: ${participants.length}');
    print('=' * 50);
    
    for (var participant in participants) {
      participant.participate();
      
      // Поліморфне використання міксинів
      if (participant is Communicable) {
        participant.sendMessage('Race started!');
      }
      
      if (participant is Strategical) {
        print('Current strategy: ${participant.getStrategy()}');
      }
      
      if (participant is DataAnalytical) {
        participant.analyzeData();
      }
      
      print('---');
    }
  }
  
  void displayAllParticipants() {
    print('\n📋 All Race Participants:');
    for (var participant in participants) {
      participant.displayInfo();
    }
  }
  
  // Фільтрація за типами
  List<T> getParticipantsOfType<T>() {
    return participants.whereType<T>().toList();
  }
  
  // Аналіз стратегій
  void analyzeStrategies() {
    var strategicParticipants = participants.whereType<Strategical>().toList();
    print('\n🎯 Strategy Analysis:');
    for (var participant in strategicParticipants) {
      print('- ${participant.getStrategy()}');
    }
  }
}

// Використання системи
void main() {
  var system = RaceManagementSystem();
  
  // Додаємо різних учасників
  system.addParticipant(F1Driver('Max Verstappen', 1, 'Red Bull', 3));
  system.addParticipant(F1Driver('Lewis Hamilton', 44, 'Mercedes', 7));
  system.addParticipant(TeamPrincipal('Christian Horner', 100, 'Red Bull', 15));
  system.addParticipant(Engineer('Adrian Newey', 101, 'Aerodynamics', 'Red Bull'));
  
  // Запускаємо гонку
  system.startRace();
  
  // Аналізуємо дані
  system.displayAllParticipants();
  system.analyzeStrategies();
  
  // Фільтруємо учасників
  var drivers = system.getParticipantsOfType<F1Driver>();
  print('\n🏎️ Drivers: ${drivers.length}');
  
  var principals = system.getParticipantsOfType<TeamPrincipal>();
  print('👔 Principals: ${principals.length}');
  
  var engineers = system.getParticipantsOfType<Engineer>();
  print('🔧 Engineers: ${engineers.length}');
}
```

## ✅ Переваги абстракції (Розширені)

### 1. **Простота використання:**
```dart
// Складний внутрішній код прихований
class SimpleF1Car {
  void accelerate() => print('🏎️ Accelerating...');
  void brake() => print('🛑 Braking...');
  void turn(String direction) => print('🔄 Turning $direction');
}

// Користувач бачить тільки простий інтерфейс
var car = SimpleF1Car();
car.accelerate(); // Простий виклик
```

### 2. **Безпека та контроль:**
```dart
abstract class SecureF1Car {
  double _speed = 0;
  
  // Контрольований доступ
  double get speed => _speed;
  
  set speed(double newSpeed) {
    if (newSpeed >= 0 && newSpeed <= 350) {
      _speed = newSpeed;
    } else {
      print('⚠️ Invalid speed: $newSpeed');
    }
  }
}
```

### 3. **Гнучкість та розширюваність:**
```dart
// Легко додати нові можливості через міксини
class AdvancedF1Car extends F1Car 
    with Communicable, Strategical, TelemetryCapable {
  // Нова функціональність автоматично доступна
}
```

## 🎮 Готові до практики?

Тепер ви розумієте:
- ✅ **Чому абстракція критично важлива** для створення чистих інтерфейсів
- ✅ **Різні типи абстракції** (абстрактні класи, інтерфейси, міксини)
- ✅ **Стратегії вибору між композицією та наслідуванням**
- ✅ **Паттерни абстракції** в реальних проектах
- ✅ **Міксини та їх практичне застосування**
- ✅ **Абстракція через узагальнені типи**

Перегляньте `examples.dart` для робочих прикладів, а потім спробуйте `practice.dart`!

---
**💡 Пам'ятайте**: Абстракція - це мистецтво приховування складності! Як у Формулі 1, де водій бачить тільки кермо та педалі, а не складну механіку двигуна! 🏎️🎯

## 🎮 Переваги абстракції

### ✅ Простота використання
- Приховує складність реалізації
- Надає чистий і простий інтерфейс
- Легше для розуміння та використання

### ✅ Безпека коду
- Обмежує доступ до внутрішніх деталей
- Запобігає неправильному використанню
- Контролює, що може робити користувач

### ✅ Гнучкість
- Легко змінювати реалізацію без впливу на користувачів
- Різні реалізації одного інтерфейсу
- Простіше тестування та налагодження

### ✅ Повторне використання
- Загальні інтерфейси для різних реалізацій
- Міксини для додавання функціональності
- Композиція для гнучкої архітектури

## 🏁 Приклад: Система гонки

```dart
abstract class RaceParticipant {
  String name;
  RaceParticipant(this.name);
  
  void prepareForRace();
  void startRace();
  void finishRace(int position);
}

mixin Communicable {
  void sendMessage(String message) {
    print('📻 $message');
  }
}

mixin Strategical {
  String currentStrategy = 'Default';
  
  void changeStrategy(String strategy) {
    currentStrategy = strategy;
    print('🎯 Strategy changed to: $strategy');
  }
}

class F1Driver extends RaceParticipant with Communicable, Strategical {
  F1Driver(String name) : super(name);
  
  @override
  void prepareForRace() {
    print('🏎️  $name getting ready...');
    sendMessage('Ready for formation lap');
  }
  
  @override
  void startRace() {
    print('🏁 $name starting the race!');
    changeStrategy('Attack Mode');
  }
  
  @override
  void finishRace(int position) {
    print('🏆 $name finished P$position');
    sendMessage('Great race, team!');
  }
}
```

## 📝 Завдання для розуміння

1. Створіть абстрактний клас `RaceTrack` з методами для різних типів трас
2. Створіть міксин `WeatherAware` для реагування на погодні умови
3. Створіть клас `MonacoGP` що використовує обидва
4. Додайте композицію для різних елементів траси

## 🚀 Що далі?

В наступному уроці ми створимо **Фінальний проект** - повноцінний симулятор чемпіонату з використанням всіх вивчених концепцій ООП!

---

💡 **Пам'ятайте**: Абстракція дозволяє створювати чисті, безпечні та гнучкі інтерфейси, приховуючи складність реалізації! 