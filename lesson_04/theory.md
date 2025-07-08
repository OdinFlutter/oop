# 🔄 Урок 4: Поліморфізм в Dart

## 🎯 Що ви вивчите (Розширений курс)
- Що таке поліморфізм та його фундаментальна роль в ООП
- Типи поліморфізму (ad-hoc, параметричний, підтипів)
- Перевизначення методів (Method Overriding) та їх стратегії
- Перевантаження методів (Method Overloading) в Dart
- Абстрактні методи та їх роль в поліморфізмі
- Інтерфейси та їх використання для поліморфізму
- Паттерни поліморфізму в реальних проектах
- Перевірка типів та безпечне приведення
- Поліморфізм через колекції та функції
- Стратегії тестування поліморфного коду

## 🔄 Що таке поліморфізм? (Глибоке розуміння)

**Поліморфізм** (poly = багато, morph = форма) - це фундаментальний принцип ООП, що дозволяє об'єктам різних класів виконувати одну і ту ж операцію по-різному.

### Основні принципи:

1. **Єдиний інтерфейс** - один метод для різних типів
2. **Різна реалізація** - кожен клас реалізує по-своєму
3. **Пізнє зв'язування** - вибір реалізації під час виконання
4. **Розширюваність** - нові типи працюють з існуючим кодом

### Метафора з Формули 1:

**Без поліморфізму (жорсткий код):**
```dart
// Поганий підхід - окремі функції для кожного типу
void handleAggressiveDriver(AggressiveDriver driver) {
  print('${driver.name} виконує агресивний обгін');
}

void handleTechnicalDriver(TechnicalDriver driver) {
  print('${driver.name} розраховує ідеальний момент');
}

void handleDefensiveDriver(DefensiveDriver driver) {
  print('${driver.name} блокує позицію');
}

// Використання - складно та негнучко
List<dynamic> drivers = [aggressive, technical, defensive];
for (var driver in drivers) {
  if (driver is AggressiveDriver) {
    handleAggressiveDriver(driver);
  } else if (driver is TechnicalDriver) {
    handleTechnicalDriver(driver);
  } else if (driver is DefensiveDriver) {
    handleDefensiveDriver(driver);
  }
}
```

**З поліморфізмом (елегантний код):**
```dart
// Хороший підхід - єдиний інтерфейс
abstract class Driver {
  String name;
  Driver(this.name);
  
  void performOvertake(); // Абстрактний метод
}

class AggressiveDriver extends Driver {
  AggressiveDriver(String name) : super(name);
  
  @override
  void performOvertake() {
    print('$name виконує агресивний обгін на високій швидкості!');
  }
}

class TechnicalDriver extends Driver {
  TechnicalDriver(String name) : super(name);
  
  @override
  void performOvertake() {
    print('$name розраховує ідеальний момент для обгону');
  }
}

class DefensiveDriver extends Driver {
  DefensiveDriver(String name) : super(name);
  
  @override
  void performOvertake() {
    print('$name блокує позицію та захищає місце');
  }
}

// Використання - просто та елегантно
List<Driver> drivers = [aggressive, technical, defensive];
for (Driver driver in drivers) {
  driver.performOvertake(); // Поліморфізм в дії!
}
```

## 🏎️ Типи поліморфізму (Детальний розбір)

### 1. Поліморфізм підтипів (Subtype Polymorphism)

Найпоширеніший тип - різні підкласи реалізують один інтерфейс:

```dart
// Базовий клас з абстрактним методом
abstract class RacingStrategy {
  String name;
  RacingStrategy(this.name);
  
  abstract void executeStrategy();
  abstract String getStrategyDescription();
}

// Різні стратегії гонки
class AggressiveStrategy extends RacingStrategy {
  AggressiveStrategy() : super('Aggressive');
  
  @override
  void executeStrategy() {
    print('🏎️ Агресивна стратегія: максимальна швидкість, ризиковані обгони');
  }
  
  @override
  String getStrategyDescription() {
    return 'Максимальна швидкість з високим ризиком';
  }
}

class ConservativeStrategy extends RacingStrategy {
  ConservativeStrategy() : super('Conservative');
  
  @override
  void executeStrategy() {
    print('🛡️ Консервативна стратегія: збереження шин, мінімум ризиків');
  }
  
  @override
  String getStrategyDescription() {
    return 'Збереження ресурсів з мінімальним ризиком';
  }
}

class AdaptiveStrategy extends RacingStrategy {
  AdaptiveStrategy() : super('Adaptive');
  
  @override
  void executeStrategy() {
    print('🔄 Адаптивна стратегія: зміна підходу залежно від ситуації');
  }
  
  @override
  String getStrategyDescription() {
    return 'Гнучкий підхід з адаптацією до умов';
  }
}

// Поліморфне використання
class RaceManager {
  void executeRaceStrategy(RacingStrategy strategy) {
    print('Стратегія: ${strategy.name}');
    strategy.executeStrategy();
    print('Опис: ${strategy.getStrategyDescription()}');
  }
  
  void compareStrategies(List<RacingStrategy> strategies) {
    print('📊 Порівняння стратегій:');
    for (var strategy in strategies) {
      print('- ${strategy.name}: ${strategy.getStrategyDescription()}');
    }
  }
}
```

### 2. Параметричний поліморфізм (Generics)

Використання узагальнених типів:

```dart
// Узагальнений клас для різних типів даних
class ChampionshipStandings<T> {
  Map<String, T> standings = {};
  
  void addParticipant(String name, T initialValue) {
    standings[name] = initialValue;
  }
  
  void updateStandings(String name, T newValue) {
    if (standings.containsKey(name)) {
      standings[name] = newValue;
    }
  }
  
  T? getStanding(String name) {
    return standings[name];
  }
  
  List<String> getTopParticipants(int count) {
    var sorted = standings.entries.toList();
    // Сортування залежить від типу T
    return sorted.take(count).map((e) => e.key).toList();
  }
}

// Використання з різними типами
class F1Standings extends ChampionshipStandings<int> {
  void awardPoints(String driver, int points) {
    int current = standings[driver] ?? 0;
    standings[driver] = current + points;
  }
}

class QualifyingStandings extends ChampionshipStandings<double> {
  void recordLapTime(String driver, double time) {
    standings[driver] = time;
  }
  
  String getPolePosition() {
    if (standings.isEmpty) return 'No data';
    var fastest = standings.entries.reduce((a, b) => a.value < b.value ? a : b);
    return fastest.key;
  }
}
```

### 3. Ad-hoc поліморфізм (Перевантаження)

В Dart реалізується через різні конструктори та опціональні параметри:

```dart
class RaceCar {
  String model;
  int maxSpeed;
  String? team;
  double? enginePower;
  
  // Основний конструктор
  RaceCar(this.model, this.maxSpeed);
  
  // Конструктор з командою
  RaceCar.withTeam(this.model, this.maxSpeed, this.team);
  
  // Конструктор з повними даними
  RaceCar.full(this.model, this.maxSpeed, this.team, this.enginePower);
  
  // Поліморфні методи з різними параметрами
  void accelerate() {
    print('$model прискорюється');
  }
  
  void accelerate(double intensity) {
    print('$model прискорюється з інтенсивністю $intensity');
  }
  
  void accelerate(double intensity, bool useDRS) {
    String drsStatus = useDRS ? 'з DRS' : 'без DRS';
    print('$model прискорюється з інтенсивністю $intensity $drsStatus');
  }
  
  // Поліморфний метод з різними типами повернення
  String getInfo() {
    return '$model - Max Speed: $maxSpeed km/h';
  }
  
  Map<String, dynamic> getInfo(bool detailed) {
    if (detailed) {
      return {
        'model': model,
        'maxSpeed': maxSpeed,
        'team': team,
        'enginePower': enginePower,
      };
    }
    return {'model': model, 'maxSpeed': maxSpeed};
  }
}
```

## 🔧 Перевизначення методів (Розширене вивчення)

### 1. Базове перевизначення:

```dart
class Vehicle {
  String brand;
  int maxSpeed;
  
  Vehicle(this.brand, this.maxSpeed);
  
  void start() {
    print('$brand vehicle starting...');
  }
  
  void accelerate() {
    print('$brand vehicle accelerating...');
  }
  
  void brake() {
    print('$brand vehicle braking...');
  }
  
  String getVehicleInfo() {
    return '$brand - Max Speed: $maxSpeed km/h';
  }
  
  // Метод для перевизначення
  String getVehicleType() {
    return 'Generic Vehicle';
  }
  
  // Фінальний метод - не можна перевизначити
  final void displayBasicInfo() {
    print('Brand: $brand, Max Speed: $maxSpeed km/h');
  }
}

class F1Car extends Vehicle {
  String team;
  int aerodynamicLevel;
  
  F1Car(String brand, int maxSpeed, this.team, this.aerodynamicLevel) 
    : super(brand, maxSpeed);
  
  @override
  void start() {
    super.start(); // Виклик батьківського методу
    print('F1 systems initialized');
    print('Aerodynamic level: $aerodynamicLevel');
  }
  
  @override
  void accelerate() {
    print('$brand F1 car accelerating with advanced systems!');
    print('Team: $team');
  }
  
  @override
  String getVehicleType() {
    return 'Formula 1 Car';
  }
  
  // Новий метод, специфічний для F1
  void deployDRS() {
    print('DRS deployed for $brand F1 car');
  }
  
  // Перевизначення з розширеною інформацією
  @override
  String getVehicleInfo() {
    String baseInfo = super.getVehicleInfo();
    return '$baseInfo - Team: $team, Aero Level: $aerodynamicLevel';
  }
}
```

### 2. Перевизначення з різними стратегіями:

```dart
abstract class TireStrategy {
  String name;
  TireStrategy(this.name);
  
  abstract void changeTires();
  abstract int getOptimalLaps();
  abstract double getPerformanceMultiplier();
}

class SoftTireStrategy extends TireStrategy {
  SoftTireStrategy() : super('Soft');
  
  @override
  void changeTires() {
    print('🔄 Зміна на Soft шини - максимальна швидкість');
  }
  
  @override
  int getOptimalLaps() => 15;
  
  @override
  double getPerformanceMultiplier() => 1.2;
}

class MediumTireStrategy extends TireStrategy {
  MediumTireStrategy() : super('Medium');
  
  @override
  void changeTires() {
    print('🔄 Зміна на Medium шини - баланс швидкості та довговічності');
  }
  
  @override
  int getOptimalLaps() => 25;
  
  @override
  double getPerformanceMultiplier() => 1.0;
}

class HardTireStrategy extends TireStrategy {
  HardTireStrategy() : super('Hard');
  
  @override
  void changeTires() {
    print('🔄 Зміна на Hard шини - максимальна довговічність');
  }
  
  @override
  int getOptimalLaps() => 40;
  
  @override
  double getPerformanceMultiplier() => 0.8;
}

class PitStopManager {
  void executeTireStrategy(TireStrategy strategy) {
    print('🏁 Виконуємо стратегію: ${strategy.name}');
    strategy.changeTires();
    print('Оптимальна кількість кіл: ${strategy.getOptimalLaps()}');
    print('Множник продуктивності: ${strategy.getPerformanceMultiplier()}');
  }
  
  void compareStrategies(List<TireStrategy> strategies) {
    print('📊 Порівняння стратегій шин:');
    for (var strategy in strategies) {
      print('''
${strategy.name}:
  - Оптимальні кола: ${strategy.getOptimalLaps()}
  - Продуктивність: ${strategy.getPerformanceMultiplier()}
      ''');
    }
  }
}
```

## 🎯 Абстрактні методи та інтерфейси

### 1. Абстрактні класи:

```dart
abstract class WeatherCondition {
  String name;
  double temperature;
  double humidity;
  
  WeatherCondition(this.name, this.temperature, this.humidity);
  
  // Абстрактний метод - повинен бути реалізований
  abstract void affectDriving();
  
  // Абстрактний геттер
  abstract String getRecommendedTires();
  
  // Конкретний метод - може бути перевизначений
  void displayWeatherInfo() {
    print('''
🌤️ Weather: $name
   Temperature: ${temperature}°C
   Humidity: ${humidity}%
    ''');
  }
  
  // Фінальний метод - не може бути перевизначений
  final bool isExtremeCondition() {
    return temperature < 5 || temperature > 35 || humidity > 80;
  }
}

class SunnyWeather extends WeatherCondition {
  SunnyWeather(double temperature, double humidity) 
    : super('Sunny', temperature, humidity);
  
  @override
  void affectDriving() {
    print('☀️ Сонячна погода: відмінна видимість, оптимальні умови');
    if (temperature > 30) {
      print('⚠️ Висока температура може вплинути на двигун');
    }
  }
  
  @override
  String getRecommendedTires() {
    if (temperature > 25) return 'Hard';
    return 'Medium';
  }
}

class RainyWeather extends WeatherCondition {
  RainyWeather(double temperature, double humidity) 
    : super('Rainy', temperature, humidity);
  
  @override
  void affectDriving() {
    print('🌧️ Дощова погода: знижена видимість, мокре покриття');
    print('⚠️ Необхідно зменшити швидкість та збільшити дистанцію');
  }
  
  @override
  String getRecommendedTires() {
    if (humidity > 90) return 'Full Wet';
    return 'Intermediate';
  }
}

class FoggyWeather extends WeatherCondition {
  FoggyWeather(double temperature, double humidity) 
    : super('Foggy', temperature, humidity);
  
  @override
  void affectDriving() {
    print('🌫️ Туманна погода: критично знижена видимість');
    print('🚨 Необхідно включити фари та зменшити швидкість');
  }
  
  @override
  String getRecommendedTires() {
    return 'Intermediate'; // Для мокрого покриття
  }
}
```

### 2. Інтерфейси:

```dart
// Інтерфейси для різних аспектів гонки
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

// Клас, що реалізує кілька інтерфейсів
class F1Car implements Movable, Fuelable, Maintainable {
  String team;
  double currentSpeed = 0.0;
  double fuelLevel = 100.0;
  int serviceInterval = 0;
  
  F1Car(this.team);
  
  // Реалізація Movable
  @override
  void move() {
    print('$team F1 car is moving');
    currentSpeed = 200.0;
  }
  
  @override
  void stop() {
    print('$team F1 car is stopping');
    currentSpeed = 0.0;
  }
  
  @override
  double getCurrentSpeed() => currentSpeed;
  
  // Реалізація Fuelable
  @override
  void refuel(double amount) {
    fuelLevel = (fuelLevel + amount).clamp(0.0, 100.0);
    print('$team F1 car refueled: ${fuelLevel.toStringAsFixed(1)}%');
  }
  
  @override
  double getFuelLevel() => fuelLevel;
  
  @override
  bool needsRefueling() => fuelLevel < 20.0;
  
  // Реалізація Maintainable
  @override
  void service() {
    serviceInterval = 0;
    print('$team F1 car serviced');
  }
  
  @override
  bool needsMaintenance() => serviceInterval > 1000;
  
  @override
  int getServiceInterval() => serviceInterval;
  
  // Специфічні для F1 методи
  void deployDRS() {
    if (currentSpeed > 150) {
      print('DRS deployed for $team F1 car');
    }
  }
}
```

## 🏆 Практичний приклад: Система симуляції гонок

```dart
// Базовий клас для всіх учасників гонки
abstract class RaceParticipant {
  String name;
  int number;
  
  RaceParticipant(this.name, this.number);
  
  abstract void participate();
  abstract String getParticipantType();
  
  void displayInfo() {
    print('$getParticipantType(): $name (#$number)');
  }
}

// Різні типи учасників
class F1Driver extends RaceParticipant {
  String team;
  int championships;
  
  F1Driver(String name, int number, this.team, this.championships) 
    : super(name, number);
  
  @override
  void participate() {
    print('🏎️ $name ($team) бере участь у F1 гонці');
    if (championships > 0) {
      print('🏆 $name - ${championships}-кратний чемпіон світу');
    }
  }
  
  @override
  String getParticipantType() => 'F1 Driver';
  
  void qualify() {
    print('$name проходить кваліфікацію');
  }
  
  void pitStop() {
    print('$name заїжджає на піт-стоп');
  }
}

class TeamPrincipal extends RaceParticipant {
  String team;
  int experienceYears;
  
  TeamPrincipal(String name, int number, this.team, this.experienceYears) 
    : super(name, number);
  
  @override
  void participate() {
    print('👔 $name керує командою $team');
    print('Досвід: $experienceYears років');
  }
  
  @override
  String getParticipantType() => 'Team Principal';
  
  void makeStrategyDecision() {
    print('$name приймає стратегічне рішення');
  }
}

class Engineer extends RaceParticipant {
  String specialization;
  String team;
  
  Engineer(String name, int number, this.specialization, this.team) 
    : super(name, number);
  
  @override
  void participate() {
    print('🔧 $name працює як $specialization інженер команди $team');
  }
  
  @override
  String getParticipantType() => 'Engineer';
  
  void analyzeData() {
    print('$name аналізує телеметричні дані');
  }
  
  void adjustSetup() {
    print('$name налаштовує автомобіль');
  }
}

// Система управління гонкою
class RaceSimulator {
  List<RaceParticipant> participants = [];
  
  void addParticipant(RaceParticipant participant) {
    participants.add(participant);
    print('✅ ${participant.getParticipantType()} ${participant.name} доданий до гонки');
  }
  
  void startRace() {
    print('\n🏁 ПОЧАТОК ГОНКИ!');
    print('Учасники: ${participants.length}');
    print('=' * 50);
    
    for (var participant in participants) {
      participant.participate();
      
      // Поліморфне використання специфічних методів
      if (participant is F1Driver) {
        participant.qualify();
        participant.pitStop();
      } else if (participant is TeamPrincipal) {
        participant.makeStrategyDecision();
      } else if (participant is Engineer) {
        participant.analyzeData();
        participant.adjustSetup();
      }
      
      print('---');
    }
  }
  
  void displayAllParticipants() {
    print('\n📋 Всі учасники гонки:');
    for (var participant in participants) {
      participant.displayInfo();
    }
  }
  
  // Поліморфна функція для фільтрації
  List<T> getParticipantsOfType<T>() {
    return participants.whereType<T>().toList();
  }
}

// Використання системи
void main() {
  var simulator = RaceSimulator();
  
  // Додаємо різних учасників
  simulator.addParticipant(F1Driver('Max Verstappen', 1, 'Red Bull', 3));
  simulator.addParticipant(F1Driver('Lewis Hamilton', 44, 'Mercedes', 7));
  simulator.addParticipant(TeamPrincipal('Christian Horner', 100, 'Red Bull', 15));
  simulator.addParticipant(Engineer('Adrian Newey', 101, 'Aerodynamics', 'Red Bull'));
  
  // Запускаємо гонку
  simulator.startRace();
  
  // Використовуємо поліморфні функції
  var drivers = simulator.getParticipantsOfType<F1Driver>();
  print('\n🏎️ Гонщики: ${drivers.length}');
  
  var principals = simulator.getParticipantsOfType<TeamPrincipal>();
  print('👔 Керівники команд: ${principals.length}');
  
  var engineers = simulator.getParticipantsOfType<Engineer>();
  print('🔧 Інженери: ${engineers.length}');
}
```

## ✅ Переваги поліморфізму (Розширені)

### 1. **Гнучкість та розширюваність:**
```dart
// Легко додати новий тип без зміни існуючого коду
class SafetyCar extends RaceParticipant {
  String driver;
  
  SafetyCar(String name, int number, this.driver) : super(name, number);
  
  @override
  void participate() {
    print('🚨 $name (водій: $driver) виїжджає на трасу');
  }
  
  @override
  String getParticipantType() => 'Safety Car';
  
  void leadField() {
    print('$name веде поле з обмеженою швидкістю');
  }
}

// Існуючий код працює без змін!
simulator.addParticipant(SafetyCar('Mercedes AMG GT', 0, 'Bernd Mayländer'));
```

### 2. **Спрощення коду:**
```dart
// Замість множинних if-else
void processParticipant(RaceParticipant participant) {
  participant.participate(); // Поліморфізм!
  participant.displayInfo(); // Поліморфізм!
}

// Замість:
// if (participant is F1Driver) { ... }
// else if (participant is TeamPrincipal) { ... }
// else if (participant is Engineer) { ... }
```

### 3. **Тестування та підтримка:**
```dart
// Легко тестувати з моками
class MockParticipant extends RaceParticipant {
  MockParticipant() : super('Test Driver', 999);
  
  @override
  void participate() {
    print('Mock participation');
  }
  
  @override
  String getParticipantType() => 'Mock';
}
```

## 🎮 Готові до практики?

Тепер ви розумієте:
- ✅ **Чому поліморфізм критично важливий** для гнучкого та розширюваного коду
- ✅ **Різні типи поліморфізму** та їх практичне застосування
- ✅ **Стратегії перевизначення методів** та їх наслідки
- ✅ **Абстрактні класи та інтерфейси** для створення контрактів
- ✅ **Поліморфізм через колекції** та узагальнені типи
- ✅ **Паттерни поліморфізму** в реальних проектах

Перегляньте `examples.dart` для робочих прикладів, а потім спробуйте `practice.dart`!

---
**💡 Пам'ятайте**: Поліморфізм - це не просто технічна можливість, це спосіб мислення! Один інтерфейс, багато реалізацій - як у Формулі 1, де всі гонщики виконують одні й ті ж дії, але кожен по-своєму! 🏎️🔄 
💡 **Пам'ятайте**: Поліморфізм дозволяє писати код, який працює з батьківським типом, але виконує специфічну поведінку дочірніх класів! 