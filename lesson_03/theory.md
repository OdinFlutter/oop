# 🏗️ Урок 3: Наслідування в Dart

## 🎯 Що ви вивчите (Розширений курс)
- Що таке наслідування та чому це фундаментальний принцип ООП
- Батьківські та дочірні класи (детальний розбір)
- Ключове слово `extends` та його використання
- Перевизначення методів (`@override`) та їх стратегії
- Конструктори в наслідуванні (різні підходи)
- Ключове слово `super` та його застосування
- Типи наслідування (просте, багаторівневе, множинне)
- Абстрактні класи та методи
- Інтерфейси та їх роль
- Поліморфізм та його прояви
- Паттерни наслідування в реальних проектах

## 🌟 Що таке наслідування? (Глибоке розуміння)

**Наслідування** - це фундаментальний принцип ООП, що дозволяє створювати нові класи на основі існуючих, успадковуючи їх властивості та методи.

### Основні принципи:

1. **Повторне використання коду** - не дублюємо логіку
2. **Ієрархічна організація** - логічна структура класів
3. **Розширюваність** - легко додавати нову функціональність
4. **Поліморфізм** - можливість використовувати об'єкти як базовий тип

### Метафора з Формули 1:

**Без наслідування (дублювання коду):**
```dart
// Поганий підхід - дублювання
class F1Car {
  String brand;
  int maxSpeed;
  String team;
  void start() { print('$brand starting...'); }
  void accelerate() { print('Accelerating...'); }
  void brake() { print('Braking...'); }
}

class RallyCar {
  String brand;
  int maxSpeed;
  String team;
  void start() { print('$brand starting...'); }  // Дублювання!
  void accelerate() { print('Accelerating...'); } // Дублювання!
  void brake() { print('Braking...'); }          // Дублювання!
  void offRoad() { print('Off-road mode...'); }  // Унікальна функція
}

class GT3Car {
  String brand;
  int maxSpeed;
  String team;
  void start() { print('$brand starting...'); }  // Дублювання!
  void accelerate() { print('Accelerating...'); } // Дублювання!
  void brake() { print('Braking...'); }          // Дублювання!
  void enduranceMode() { print('Endurance mode...'); } // Унікальна функція
}
```

**З наслідуванням (ефективний підхід):**
```dart
// Базовий клас - спільна функціональність
class Vehicle {
  String brand;
  int maxSpeed;
  String team;
  
  Vehicle(this.brand, this.maxSpeed, this.team);
  
  void start() {
    print('$brand starting...');
  }
  
  void accelerate() {
    print('Accelerating...');
  }
  
  void brake() {
    print('Braking...');
  }
  
  void displayInfo() {
    print('$brand - Max Speed: $maxSpeed km/h - Team: $team');
  }
}

// Спеціалізовані класи - унікальна функціональність
class F1Car extends Vehicle {
  int aerodynamicLevel;
  
  F1Car(String brand, int maxSpeed, String team, this.aerodynamicLevel) 
    : super(brand, maxSpeed, team);
  
  void deployDRS() {
    print('DRS activated for better speed!');
  }
  
  @override
  void accelerate() {
    super.accelerate();
    print('F1 advanced systems engaged!');
  }
}

class RallyCar extends Vehicle {
  bool isFourWheelDrive;
  
  RallyCar(String brand, int maxSpeed, String team, this.isFourWheelDrive) 
    : super(brand, maxSpeed, team);
  
  void offRoad() {
    print('Off-road mode activated!');
  }
  
  @override
  void displayInfo() {
    super.displayInfo();
    print('4WD: $isFourWheelDrive');
  }
}

class GT3Car extends Vehicle {
  int enduranceLevel;
  
  GT3Car(String brand, int maxSpeed, String team, this.enduranceLevel) 
    : super(brand, maxSpeed, team);
  
  void enduranceMode() {
    print('Endurance mode: $enduranceLevel hours capacity');
  }
}
```

## 🔧 Основні концепції (Детальний розбір)

### 1. Батьківський та дочірній класи

```dart
// Базовий клас (superclass, parent class)
class MotorsportDriver {
  String name;
  int age;
  String nationality;
  int experienceYears;
  
  MotorsportDriver(this.name, this.age, this.nationality, this.experienceYears);
  
  // Базові методи
  void introduce() {
    print('I am $name from $nationality');
  }
  
  void train() {
    print('$name is training...');
  }
  
  void compete() {
    print('$name is competing...');
  }
  
  // Метод для перевизначення
  String getDriverLevel() {
    if (experienceYears < 2) return 'Rookie';
    if (experienceYears < 5) return 'Experienced';
    if (experienceYears < 10) return 'Veteran';
    return 'Legend';
  }
  
  // Фінальний метод - не можна перевизначити
  final void displayStats() {
    print('''
📊 Driver Statistics:
   Name: $name
   Age: $age
   Nationality: $nationality
   Experience: $experienceYears years
   Level: ${getDriverLevel()}
    ''');
  }
}

// Похідний клас (subclass, child class)
class F1Driver extends MotorsportDriver {
  String team;
  int championships;
  int raceWins;
  double bestLapTime;
  
  F1Driver(String name, int age, String nationality, int experienceYears,
           this.team, this.championships, this.raceWins, this.bestLapTime)
    : super(name, age, nationality, experienceYears);
  
  // Перевизначення методу
  @override
  void introduce() {
    super.introduce();
    print('I drive for $team in Formula 1');
  }
  
  // Перевизначення з новою логікою
  @override
  String getDriverLevel() {
    if (championships > 0) return 'World Champion';
    if (raceWins > 10) return 'Race Winner';
    return super.getDriverLevel(); // Використовуємо батьківську логіку
  }
  
  // Специфічні для F1 методи
  void qualify() {
    print('$name is qualifying...');
  }
  
  void pitStop() {
    print('$name entering pit lane...');
  }
  
  void deployDRS() {
    print('$name deploying DRS...');
  }
  
  // Розширена статистика
  @override
  void displayStats() {
    super.displayStats(); // Викликаємо батьківський метод
    print('''
🏎️ F1 Statistics:
   Team: $team
   Championships: $championships
   Race Wins: $raceWins
   Best Lap: ${bestLapTime}s
    ''');
  }
}
```

### 2. Ключове слово `super` (Розширене використання)

`super` використовується для доступу до батьківського класу:

```dart
class RaceEngine {
  String manufacturer;
  int cylinders;
  double displacement;
  int maxRPM;
  
  RaceEngine(this.manufacturer, this.cylinders, this.displacement, this.maxRPM);
  
  void start() {
    print('$manufacturer engine starting...');
  }
  
  void rev() {
    print('Engine revving to $maxRPM RPM');
  }
  
  double calculatePower() {
    return displacement * cylinders * 0.1; // Спрощена формула
  }
}

class F1Engine extends RaceEngine {
  bool hasERS; // Energy Recovery System
  bool hasTurbo;
  String fuelType;
  
  F1Engine(String manufacturer, int cylinders, double displacement, int maxRPM,
           this.hasERS, this.hasTurbo, this.fuelType)
    : super(manufacturer, cylinders, displacement, maxRPM);
  
  @override
  void start() {
    super.start(); // Виклик батьківського методу
    if (hasERS) {
      print('ERS system activated');
    }
    if (hasTurbo) {
      print('Turbo system ready');
    }
  }
  
  @override
  double calculatePower() {
    double basePower = super.calculatePower(); // Базова потужність
    double multiplier = 1.0;
    
    if (hasERS) multiplier += 0.2;
    if (hasTurbo) multiplier += 0.3;
    
    return basePower * multiplier;
  }
  
  void deployERS() {
    if (hasERS) {
      print('ERS deployment: +160 HP for 33 seconds');
    }
  }
  
  void fuelMode(String mode) {
    print('Fuel mode: $mode (Type: $fuelType)');
  }
}
```

### 3. Конструктори в наслідуванні (Різні підходи)

```dart
class Circuit {
  String name;
  String country;
  double length;
  int corners;
  
  // Основний конструктор
  Circuit(this.name, this.country, this.length, this.corners);
  
  // Названий конструктор
  Circuit.famous(this.name, this.country) : length = 5.0, corners = 15;
  
  // Фабричний конструктор
  factory Circuit.fromMap(Map<String, dynamic> data) {
    return Circuit(
      data['name'] ?? 'Unknown',
      data['country'] ?? 'Unknown',
      data['length']?.toDouble() ?? 0.0,
      data['corners'] ?? 0,
    );
  }
  
  void displayInfo() {
    print('$name in $country - ${length}km, $corners corners');
  }
}

class F1Circuit extends Circuit {
  String type; // Street, Permanent, Hybrid
  int pitLanes;
  bool hasDRS;
  
  // Конструктор з super
  F1Circuit(String name, String country, double length, int corners,
            this.type, this.pitLanes, this.hasDRS)
    : super(name, country, length, corners);
  
  // Конструктор з названим батьківським конструктором
  F1Circuit.famous(String name, String country, this.type, this.pitLanes, this.hasDRS)
    : super.famous(name, country);
  
  // Фабричний конструктор з перевизначенням
  factory F1Circuit.fromMap(Map<String, dynamic> data) {
    return F1Circuit(
      data['name'] ?? 'Unknown',
      data['country'] ?? 'Unknown',
      data['length']?.toDouble() ?? 0.0,
      data['corners'] ?? 0,
      data['type'] ?? 'Permanent',
      data['pit_lanes'] ?? 1,
      data['has_drs'] ?? true,
    );
  }
  
  @override
  void displayInfo() {
    super.displayInfo();
    print('Type: $type, Pit Lanes: $pitLanes, DRS: ${hasDRS ? "Yes" : "No"}');
  }
  
  void simulateRace() {
    print('🏁 Simulating F1 race on $name...');
    if (hasDRS) {
      print('DRS zones available');
    }
  }
}
```

## 🏁 Типи наслідування (Розширений розбір)

### 1. Просте наслідування

```dart
class Vehicle {
  String brand;
  int maxSpeed;
  
  Vehicle(this.brand, this.maxSpeed);
  
  void move() {
    print('$brand vehicle is moving');
  }
  
  void stop() {
    print('$brand vehicle is stopping');
  }
}

class Car extends Vehicle {
  int doors;
  
  Car(String brand, int maxSpeed, this.doors) : super(brand, maxSpeed);
  
  void honk() {
    print('$brand car is honking');
  }
}
```

### 2. Багаторівневе наслідування

```dart
class Vehicle {
  String brand;
  int maxSpeed;
  
  Vehicle(this.brand, this.maxSpeed);
  
  void start() => print('$brand vehicle started');
  void stop() => print('$brand vehicle stopped');
}

class Car extends Vehicle {
  int doors;
  
  Car(String brand, int maxSpeed, this.doors) : super(brand, maxSpeed);
  
  void drive() => print('$brand car is driving');
}

class SportsCar extends Car {
  bool hasTurbo;
  
  SportsCar(String brand, int maxSpeed, int doors, this.hasTurbo) 
    : super(brand, maxSpeed, doors);
  
  void accelerate() {
    print('$brand sports car accelerating');
    if (hasTurbo) {
      print('Turbo boost activated!');
    }
  }
}

class F1Car extends SportsCar {
  String team;
  int aerodynamicLevel;
  
  F1Car(String brand, int maxSpeed, int doors, bool hasTurbo, 
        this.team, this.aerodynamicLevel)
    : super(brand, maxSpeed, doors, hasTurbo);
  
  void race() {
    print('$brand F1 car from $team is racing!');
    print('Aerodynamic level: $aerodynamicLevel');
  }
  
  @override
  void accelerate() {
    super.accelerate();
    print('F1 advanced systems engaged!');
  }
}
```

### 3. Множинне наслідування через інтерфейси

```dart
// Інтерфейси (абстрактні класи)
abstract class Movable {
  void move();
  void stop();
}

abstract class Fuelable {
  void refuel();
  double getFuelLevel();
}

abstract class Maintainable {
  void service();
  bool needsMaintenance();
}

// Клас, що реалізує кілька інтерфейсів
class F1Car implements Movable, Fuelable, Maintainable {
  String team;
  double fuelLevel = 100.0;
  int serviceInterval = 0;
  
  F1Car(this.team);
  
  @override
  void move() {
    print('$team F1 car is moving');
  }
  
  @override
  void stop() {
    print('$team F1 car is stopping');
  }
  
  @override
  void refuel() {
    fuelLevel = 100.0;
    print('$team F1 car refueled');
  }
  
  @override
  double getFuelLevel() {
    return fuelLevel;
  }
  
  @override
  void service() {
    serviceInterval = 0;
    print('$team F1 car serviced');
  }
  
  @override
  bool needsMaintenance() {
    return serviceInterval > 1000; // км
  }
}
```

## 🎯 Абстрактні класи та методи

```dart
// Абстрактний базовий клас
abstract class RacingVehicle {
  String brand;
  int maxSpeed;
  
  RacingVehicle(this.brand, this.maxSpeed);
  
  // Абстрактний метод - повинен бути реалізований в дочірніх класах
  abstract void race();
  
  // Конкретний метод - може бути перевизначений
  void start() {
    print('$brand racing vehicle starting...');
  }
  
  // Фінальний метод - не може бути перевизначений
  final void displayInfo() {
    print('$brand - Max Speed: $maxSpeed km/h');
  }
}

// Конкретні класи, що наслідують абстрактний
class F1Car extends RacingVehicle {
  String team;
  
  F1Car(String brand, int maxSpeed, this.team) : super(brand, maxSpeed);
  
  @override
  void race() {
    print('$brand F1 car from $team is racing in Formula 1!');
  }
  
  @override
  void start() {
    super.start();
    print('F1 systems initialized');
  }
}

class RallyCar extends RacingVehicle {
  bool isFourWheelDrive;
  
  RallyCar(String brand, int maxSpeed, this.isFourWheelDrive) 
    : super(brand, maxSpeed);
  
  @override
  void race() {
    print('$brand rally car is racing off-road!');
    if (isFourWheelDrive) {
      print('4WD system active');
    }
  }
}

class GT3Car extends RacingVehicle {
  int enduranceLevel;
  
  GT3Car(String brand, int maxSpeed, this.enduranceLevel) 
    : super(brand, maxSpeed);
  
  @override
  void race() {
    print('$brand GT3 car is racing in endurance event!');
    print('Endurance level: $enduranceLevel hours');
  }
}
```

## 🏆 Практичний приклад: Система чемпіонатів

```dart
// Базовий клас для всіх чемпіонатів
abstract class Championship {
  String name;
  int season;
  List<String> participants = [];
  Map<String, int> standings = {};
  
  Championship(this.name, this.season);
  
  // Абстрактні методи
  abstract void addParticipant(String participant);
  abstract void updateStandings(String participant, int points);
  abstract String getChampion();
  
  // Конкретні методи
  void displayStandings() {
    print('🏆 $name $season - Standings:');
    var sortedStandings = standings.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    for (int i = 0; i < sortedStandings.length; i++) {
      print('${i + 1}. ${sortedStandings[i].key}: ${sortedStandings[i].value} pts');
    }
  }
  
  int getParticipantCount() => participants.length;
}

// F1 Чемпіонат
class F1Championship extends Championship {
  List<String> circuits = [];
  Map<String, int> fastestLaps = {};
  
  F1Championship(int season) : super('Formula 1 World Championship', season);
  
  @override
  void addParticipant(String driver) {
    if (!participants.contains(driver)) {
      participants.add(driver);
      standings[driver] = 0;
      print('✅ $driver added to F1 championship');
    }
  }
  
  @override
  void updateStandings(String driver, int points) {
    if (participants.contains(driver)) {
      standings[driver] = (standings[driver] ?? 0) + points;
      print('📊 $driver: +$points points (Total: ${standings[driver]} pts)');
    }
  }
  
  @override
  String getChampion() {
    if (standings.isEmpty) return 'No champion yet';
    
    var champion = standings.entries.reduce((a, b) => a.value > b.value ? a : b);
    return '${champion.key} (${champion.value} points)';
  }
  
  void addCircuit(String circuit) {
    circuits.add(circuit);
    print('🏁 $circuit added to calendar');
  }
  
  void recordFastestLap(String driver, String circuit) {
    fastestLaps[circuit] = (fastestLaps[circuit] ?? 0) + 1;
    print('⚡ $driver recorded fastest lap at $circuit');
  }
  
  @override
  void displayStandings() {
    super.displayStandings();
    print('\n🏁 Circuits: ${circuits.join(', ')}');
    print('⚡ Fastest laps: ${fastestLaps.length}');
  }
}

// WRC Чемпіонат
class WRCChampionship extends Championship {
  List<String> rallies = [];
  Map<String, int> stageWins = {};
  
  WRCChampionship(int season) : super('World Rally Championship', season);
  
  @override
  void addParticipant(String driver) {
    if (!participants.contains(driver)) {
      participants.add(driver);
      standings[driver] = 0;
      print('✅ $driver added to WRC championship');
    }
  }
  
  @override
  void updateStandings(String driver, int points) {
    if (participants.contains(driver)) {
      standings[driver] = (standings[driver] ?? 0) + points;
      print('📊 $driver: +$points points (Total: ${standings[driver]} pts)');
    }
  }
  
  @override
  String getChampion() {
    if (standings.isEmpty) return 'No champion yet';
    
    var champion = standings.entries.reduce((a, b) => a.value > b.value ? a : b);
    return '${champion.key} (${champion.value} points)';
  }
  
  void addRally(String rally) {
    rallies.add(rally);
    print('🌲 $rally added to calendar');
  }
  
  void recordStageWin(String driver, String rally) {
    stageWins[rally] = (stageWins[rally] ?? 0) + 1;
    print('🏆 $driver won stage at $rally');
  }
  
  @override
  void displayStandings() {
    super.displayStandings();
    print('\n🌲 Rallies: ${rallies.join(', ')}');
    print('🏆 Stage wins: ${stageWins.length}');
  }
}

// Система управління чемпіонатами
class ChampionshipManager {
  List<Championship> championships = [];
  
  void addChampionship(Championship championship) {
    championships.add(championship);
    print('🏆 Added ${championship.name} ${championship.season}');
  }
  
  void displayAllChampionships() {
    print('\n📋 All Championships:');
    for (var championship in championships) {
      print('- ${championship.name} ${championship.season} (${championship.getParticipantCount()} participants)');
    }
  }
  
  void simulateSeason() {
    print('\n🎮 Simulating all championships...');
    for (var championship in championships) {
      print('\n🏁 ${championship.name} ${championship.season}:');
      championship.displayStandings();
      print('🏆 Champion: ${championship.getChampion()}');
    }
  }
}
```

## ✅ Переваги наслідування (Розширені)

### 1. **Повторне використання коду:**
```dart
// Без наслідування - дублювання
class F1Car {
  void start() { /* 50 рядків коду */ }
  void accelerate() { /* 30 рядків коду */ }
  void brake() { /* 25 рядків коду */ }
}

class RallyCar {
  void start() { /* 50 рядків коду - ДУБЛЮВАННЯ! */ }
  void accelerate() { /* 30 рядків коду - ДУБЛЮВАННЯ! */ }
  void brake() { /* 25 рядків коду - ДУБЛЮВАННЯ! */ }
}

// З наслідуванням - ефективність
class Vehicle {
  void start() { /* 50 рядків коду - ОДИН РАЗ! */ }
  void accelerate() { /* 30 рядків коду - ОДИН РАЗ! */ }
  void brake() { /* 25 рядків коду - ОДИН РАЗ! */ }
}

class F1Car extends Vehicle {
  // Тільки унікальна функціональність
}

class RallyCar extends Vehicle {
  // Тільки унікальна функціональність
}
```

### 2. **Поліморфізм:**
```dart
class RaceSimulator {
  void simulateRace(List<Vehicle> vehicles) {
    for (var vehicle in vehicles) {
      vehicle.start();      // Поліморфізм - кожен викликає свою версію
      vehicle.accelerate(); // Поліморфізм - кожен викликає свою версію
      vehicle.brake();      // Поліморфізм - кожен викликає свою версію
    }
  }
}

// Використання
var simulator = RaceSimulator();
var vehicles = [
  F1Car('Red Bull', 350, 'Red Bull Racing'),
  RallyCar('Toyota', 200, true),
  GT3Car('Porsche', 300, 24),
];

simulator.simulateRace(vehicles); // Поліморфізм в дії!
```

### 3. **Легкість розширення:**
```dart
// Легко додати новий тип транспорту
class ElectricCar extends Vehicle {
  int batteryCapacity;
  
  ElectricCar(String brand, int maxSpeed, this.batteryCapacity) 
    : super(brand, maxSpeed);
  
  @override
  void start() {
    print('$brand electric car starting silently...');
  }
  
  void charge() {
    print('Charging battery: $batteryCapacity kWh');
  }
}
```

## 🎮 Готові до практики?

Тепер ви розумієте:
- ✅ **Чому наслідування критично важливе** для ефективного програмування
- ✅ **Як створювати ієрархії класів** з логічною структурою
- ✅ **Всі можливості ключового слова `super`** та його застосування
- ✅ **Стратегії перевизначення методів** та їх наслідки
- ✅ **Різні типи наслідування** та їх використання
- ✅ **Абстрактні класи та інтерфейси** для створення контрактів
- ✅ **Поліморфізм** та його практичне застосування

Перегляньте `examples.dart` для робочих прикладів, а потім спробуйте `practice.dart`!

---
**💡 Пам'ятайте**: Наслідування - це не просто копіювання коду, це створення логічних зв'язків між класами! У Формулі 1 всі автомобілі - це транспортні засоби, але кожен має свої унікальні особливості! 🏎️🏗️ 