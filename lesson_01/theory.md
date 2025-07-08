# 📚 Урок 1: Основи класів та об'єктів

## 🎯 Що ви вивчите
- Що таке клас та об'єкт (детальне розуміння)
- Як створювати класи в Dart (різні способи)
- Конструктори та їх види (основні, названі, фабричні)
- Властивості (поля) та методи (статичні та екземплярні)
- Створення та використання об'єктів
- Ініціалізація об'єктів та списки ініціалізації
- Геттери та сеттери (базові)
- Статичні члени класу

## 🏎️ Вступ через Формулу 1

Формула 1 - це ідеальний приклад для вивчення ООП! Давайте подумаємо:

**Реальний світ F1:**
- У нас є гонщики: Max Verstappen, Lewis Hamilton, Charles Leclerc
- У нас є автомобілі: RB19, W14, SF-23
- У нас є команди: Red Bull, Mercedes, Ferrari
- У нас є траси: Monaco, Silverstone, Spa

**У програмуванні:**
- Класи: Driver, Car, Team, Circuit
- Об'єкти: конкретні гонщики, машини, команди, траси

## 🧩 Що таке клас? (Детальний розбір)

**Клас** - це шаблон, креслення або форма для створення об'єктів. Це абстракція реального світу у коді.

### Анатомія класу:

```dart
class Driver {
  // 1. ПОЛЯ (Fields) - характеристики об'єкта
  String name;           // Ім'я гонщика
  int age;              // Вік
  String nationality;   // Національність
  int points;          // Очки у чемпіонаті
  
  // 2. КОНСТРУКТОР - як створюється об'єкт
  Driver(this.name, this.age, this.nationality) {
    points = 0; // Початкові очки
  }
  
  // 3. МЕТОДИ - що може робити об'єкт
  void drive() {
    print('$name їде по трасі!');
  }
  
  void scorePints(int newPoints) {
    points += newPoints;
    print('$name заробив $newPoints очок! Всього: $points');
  }
}
```

### Чому це корисно?

**БЕЗ класів (поганий підхід):**
```dart
String driver1Name = 'Max Verstappen';
int driver1Age = 26;
String driver1Nationality = 'Netherlands';
int driver1Points = 0;

String driver2Name = 'Lewis Hamilton';
int driver2Age = 39;
String driver2Nationality = 'United Kingdom';
int driver2Points = 0;

// Важко керувати, легко помилитися!
```

**З класами (хороший підхід):**
```dart
Driver driver1 = Driver('Max Verstappen', 26, 'Netherlands');
Driver driver2 = Driver('Lewis Hamilton', 39, 'United Kingdom');

// Організовано, зрозуміло, легко розширювати!
```

## 🎭 Що таке об'єкт? (Поглиблений погляд)

**Об'єкт** - це конкретний екземпляр класу з реальними значеннями в пам'яті.

### Метафори для розуміння:

1. **Клас = Форма для печива, Об'єкт = Конкретне печиво**
2. **Клас = Паспортний бланк, Об'єкт = Ваш заповнений паспорт**
3. **Клас = Проект будинку, Об'єкт = Побудований будинок**

### Приклад з F1:

```dart
// Клас - це загальна концепція
class F1Car {
  String model;
  String team;
  int maxSpeed;
  
  F1Car(this.model, this.team, this.maxSpeed);
  
  void accelerate() {
    print('$model прискорюється до $maxSpeed км/год!');
  }
}

// Об'єкти - це конкретні машини
F1Car redBullCar = F1Car('RB19', 'Red Bull Racing', 350);
F1Car mercedesCar = F1Car('W14', 'Mercedes', 348);
F1Car ferrariCar = F1Car('SF-23', 'Ferrari', 352);

// Кожен об'єкт унікальний!
redBullCar.accelerate();  // RB19 прискорюється до 350 км/год!
mercedesCar.accelerate(); // W14 прискорюється до 348 км/год!
```

## 📝 Синтаксис класу в Dart (Розширений)

### Базова структура:
```dart
class ClassName {
  // 1. Поля (властивості)
  String field1;
  int field2;
  bool field3;
  
  // 2. Конструктори
  ClassName(this.field1, this.field2, this.field3);
  
  // 3. Методи
  void method1() {
    // Логіка методу
  }
  
  String method2() {
    return 'Повертаємо значення';
  }
}
```

### Реальний приклад F1:
```dart
class F1Driver {
  // Основні характеристики
  String name;
  int age;
  String nationality;
  String team;
  
  // Статистика
  int raceWins;
  int podiums;
  int championshipPoints;
  
  // Базовий конструктор
  F1Driver(this.name, this.age, this.nationality, this.team) {
    raceWins = 0;
    podiums = 0;
    championshipPoints = 0;
  }
  
  // Методи для дій
  void winRace() {
    raceWins++;
    podiums++;
    championshipPoints += 25;
    print('$name виграв гонку! Всього перемог: $raceWins');
  }
  
  void finishOnPodium(int position) {
    podiums++;
    List<int> points = [25, 18, 15]; // 1-3 місця
    championshipPoints += points[position - 1];
    print('$name фінішував на ${position}-му місці!');
  }
  
  // Метод для отримання інформації
  String getDriverInfo() {
    return '$name ($nationality, $age років) - $team\n'
           'Перемоги: $raceWins, П\'єдестали: $podiums, Очки: $championshipPoints';
  }
}
```

## 🔧 Конструктори (Детальний розбір)

Конструктор - це спеціальний метод, що викликається при створенні об'єкта.

### 1. Основний конструктор

```dart
class CircuitInfo {
  String name;
  String country;
  double length;
  int corners;
  
  // Простий конструктор
  CircuitInfo(this.name, this.country, this.length, this.corners);
}

// Використання
CircuitInfo monaco = CircuitInfo('Monaco', 'Monaco', 3.337, 19);
```

### 2. Конструктор з ініціалізацією

```dart
class RaceResult {
  String driverName;
  int position;
  double lapTime;
  int points;
  
  // Конструктор з обчисленням очок
  RaceResult(this.driverName, this.position, this.lapTime) {
    // Очки за позиції F1
    Map<int, int> pointsTable = {
      1: 25, 2: 18, 3: 15, 4: 12, 5: 10,
      6: 8, 7: 6, 8: 4, 9: 2, 10: 1
    };
    points = pointsTable[position] ?? 0;
  }
  
  void displayResult() {
    print('$driverName - P$position (${lapTime}s) - $points очок');
  }
}
```

### 3. Названі конструктори

```dart
class F1Circuit {
  String name;
  String country;
  double length;
  int corners;
  String type;
  
  // Основний конструктор
  F1Circuit(this.name, this.country, this.length, this.corners, this.type);
  
  // Конструктор для вуличних трас
  F1Circuit.street(this.name, this.country, this.length) :
    corners = 20,  // Зазвичай багато поворотів
    type = 'Street Circuit';
  
  // Конструктор для звичайних трас
  F1Circuit.permanent(this.name, this.country, this.length, this.corners) :
    type = 'Permanent Circuit';
  
  // Конструктор з мінімальною інформацією
  F1Circuit.basic(this.name) :
    country = 'Unknown',
    length = 0.0,
    corners = 0,
    type = 'Unknown';
}

// Використання різних конструкторів
F1Circuit silverstone = F1Circuit('Silverstone', 'UK', 5.891, 18, 'Permanent');
F1Circuit monaco = F1Circuit.street('Monaco', 'Monaco', 3.337);
F1Circuit spa = F1Circuit.permanent('Spa-Francorchamps', 'Belgium', 7.004, 19);
F1Circuit newTrack = F1Circuit.basic('New Track');
```

### 4. Список ініціалізації

```dart
class TeamBudget {
  String teamName;
  double totalBudget;
  double spentAmount;
  double remainingBudget;
  
  // Використання списку ініціалізації
  TeamBudget(this.teamName, this.totalBudget) : 
    spentAmount = 0.0,
    remainingBudget = totalBudget;
  
  void spendMoney(double amount) {
    if (amount <= remainingBudget) {
      spentAmount += amount;
      remainingBudget -= amount;
      print('$teamName витратила \$$amount млн. Залишилось: \$$remainingBudget млн.');
    } else {
      print('Недостатньо коштів! Доступно: \$$remainingBudget млн.');
    }
  }
}
```

## 🚀 Створення та використання об'єктів

### Основні способи створення:

```dart
// 1. Пряме створення
Driver verstappen = Driver('Max Verstappen', 26, 'Netherlands');

// 2. Створення через змінну
String driverName = 'Lewis Hamilton';
Driver hamilton = Driver(driverName, 39, 'United Kingdom');

// 3. Створення в списку
List<Driver> drivers = [
  Driver('Charles Leclerc', 26, 'Monaco'),
  Driver('Lando Norris', 24, 'United Kingdom'),
  Driver('George Russell', 26, 'United Kingdom'),
];

// 4. Умовне створення
Driver createDriver(String name, bool isVeteran) {
  if (isVeteran) {
    return Driver.veteran(name);
  } else {
    return Driver.rookie(name);
  }
}
```

### Робота з об'єктами:

```dart
class PitStop {
  String driverName;
  double duration;
  String tireType;
  bool successful;
  
  PitStop(this.driverName, this.duration, this.tireType) : successful = true;
  
  void performPitStop() {
    print('$driverName заїжджає на піт-стоп...');
    
    if (duration < 3.0) {
      print('Блискавичний піт-стоп за ${duration}с! Зміна на $tireType шини');
      successful = true;
    } else if (duration < 5.0) {
      print('Стандартний піт-стоп за ${duration}с. Зміна на $tireType шини');
      successful = true;
    } else {
      print('Повільний піт-стоп за ${duration}с. Втрачено час!');
      successful = false;
    }
  }
  
  String getResult() {
    return successful ? 'Успішний піт-стоп' : 'Проблемний піт-стоп';
  }
}

// Використання
PitStop quickStop = PitStop('Max Verstappen', 2.3, 'Soft');
quickStop.performPitStop();
print(quickStop.getResult());
```

## ⚡ Властивості та методи (Розширений розбір)

### Типи властивостей:

```dart
class F1Team {
  // 1. Обов'язкові властивості
  String name;
  String principal;
  
  // 2. Властивості зі значенням за замовчуванням
  int championships = 0;
  bool isActive = true;
  
  // 3. Обчислювані властивості (геттери)
  String get status => isActive ? 'Активна' : 'Неактивна';
  String get fullInfo => '$name (Керівник: $principal)';
  
  // 4. Властивості що можуть бути null
  String? currentDriver1;
  String? currentDriver2;
  
  F1Team(this.name, this.principal);
  
  // 5. Сеттер з валідацією
  set teamName(String newName) {
    if (newName.isNotEmpty) {
      name = newName;
    }
  }
}
```

### Типи методів:

```dart
class RaceWeekend {
  String trackName;
  List<String> sessions = [];
  
  RaceWeekend(this.trackName);
  
  // 1. Методи без повернення значення (void)
  void addSession(String sessionName) {
    sessions.add(sessionName);
    print('Додано сесію: $sessionName');
  }
  
  // 2. Методи з поверненням значення
  int getTotalSessions() {
    return sessions.length;
  }
  
  // 3. Методи з параметрами за замовчуванням
  void startSession([String sessionType = 'Free Practice']) {
    print('Розпочинаємо сесію: $sessionType на $trackName');
  }
  
  // 4. Методи з іменованими параметрами
  void scheduleSession({
    required String name,
    required int duration,
    bool isQualifying = false
  }) {
    String type = isQualifying ? 'Кваліфікація' : 'Практика';
    print('Заплановано $type: $name ($duration хв)');
  }
  
  // 5. Методи з множинними параметрами
  String createSessionSummary(List<String> results) {
    StringBuffer summary = StringBuffer();
    summary.writeln('Підсумки сесії на $trackName:');
    for (int i = 0; i < results.length; i++) {
      summary.writeln('${i + 1}. ${results[i]}');
    }
    return summary.toString();
  }
}
```

## 🎮 Статичні члени класу

Статичні члени належать класу, а не конкретному об'єкту.

```dart
class F1Regulations {
  // Статичні константи
  static const int maxDriversPerTeam = 2;
  static const int pointsForWin = 25;
  static const double maxCarWeight = 795.0; // кг
  
  // Статична змінна
  static int currentSeason = 2024;
  
  // Статичний метод
  static List<int> getPointsTable() {
    return [25, 18, 15, 12, 10, 8, 6, 4, 2, 1];
  }
  
  // Статичний метод для перевірки
  static bool isValidDriverCount(int count) {
    return count <= maxDriversPerTeam;
  }
  
  // Статичний фабричний метод
  static F1Team createNewTeam(String name, String principal) {
    if (name.isNotEmpty && principal.isNotEmpty) {
      return F1Team(name, principal);
    } else {
      throw ArgumentError('Ім\'я команди та керівника не можуть бути порожніми');
    }
  }
}

// Використання статичних членів
print('Очки за перемогу: ${F1Regulations.pointsForWin}');
print('Поточний сезон: ${F1Regulations.currentSeason}');
List<int> points = F1Regulations.getPointsTable();
bool isValid = F1Regulations.isValidDriverCount(2);
```

## 🔍 Геттери та сеттери (Базові)

```dart
class DriverProfile {
  String _name;      // Приватне поле
  int _age;         // Приватне поле
  int _experience;  // Приватне поле
  
  DriverProfile(this._name, this._age, this._experience);
  
  // Геттер для імені
  String get name => _name;
  
  // Геттер для віку
  int get age => _age;
  
  // Обчислюваний геттер
  String get experienceLevel {
    if (_experience < 2) return 'Новачок';
    if (_experience < 5) return 'Досвідчений';
    if (_experience < 10) return 'Ветеран';
    return 'Легенда';
  }
  
  // Сеттер з валідацією
  set age(int newAge) {
    if (newAge >= 18 && newAge <= 50) {
      _age = newAge;
    } else {
      print('Вік повинен бути від 18 до 50 років');
    }
  }
  
  // Сеттер для досвіду
  set experience(int years) {
    if (years >= 0) {
      _experience = years;
    }
  }
  
  void displayProfile() {
    print('$_name, $_age років');
    print('Досвід: $_experience років ($experienceLevel)');
  }
}

// Використання
DriverProfile driver = DriverProfile('Max Verstappen', 26, 8);
print(driver.name);              // Геттер
print(driver.experienceLevel);   // Обчислюваний геттер
driver.age = 27;                 // Сеттер
driver.displayProfile();
```

## 🏆 Практичний приклад: Система гонки

```dart
class RaceSimulator {
  String raceName;
  List<F1Driver> participants = [];
  List<RaceResult> results = [];
  
  RaceSimulator(this.raceName);
  
  void addDriver(F1Driver driver) {
    if (participants.length < 20) {
      participants.add(driver);
      print('${driver.name} доданий до гонки $raceName');
    } else {
      print('Гонка вже заповнена (максимум 20 гонщиків)');
    }
  }
  
  void simulateRace() {
    print('\n🏁 Початок гонки: $raceName');
    print('Учасники: ${participants.length} гонщиків\n');
    
    // Симуляція результатів
    participants.shuffle(); // Випадковий порядок
    
    for (int i = 0; i < participants.length; i++) {
      F1Driver driver = participants[i];
      int position = i + 1;
      double lapTime = 80.0 + (i * 0.5); // Час кола
      
      RaceResult result = RaceResult(driver.name, position, lapTime);
      results.add(result);
      
      // Нараховуємо очки
      if (position <= 10) {
        driver.finishOnPodium(position <= 3 ? position : 4);
      }
    }
    
    displayResults();
  }
  
  void displayResults() {
    print('📊 Результати гонки $raceName:');
    print('=' * 40);
    
    for (RaceResult result in results) {
      result.displayResult();
    }
    
    print('\n🏆 Переможець: ${results[0].driverName}!');
  }
}

// Повний приклад використання
void main() {
  // Створюємо гонщиків
  F1Driver max = F1Driver('Max Verstappen', 26, 'Netherlands', 'Red Bull');
  F1Driver lewis = F1Driver('Lewis Hamilton', 39, 'United Kingdom', 'Mercedes');
  F1Driver charles = F1Driver('Charles Leclerc', 26, 'Monaco', 'Ferrari');
  
  // Створюємо симулятор гонки
  RaceSimulator monaco = RaceSimulator('Monaco Grand Prix');
  
  // Додаємо гонщиків
  monaco.addDriver(max);
  monaco.addDriver(lewis);
  monaco.addDriver(charles);
  
  // Запускаємо гонку
  monaco.simulateRace();
  
  // Перевіряємо статистику гонщиків
  print('\n👤 Профілі гонщиків після гонки:');
  print(max.getDriverInfo());
  print(lewis.getDriverInfo());
  print(charles.getDriverInfo());
}
```

## 🎯 Ключові поняття (Розширені)

1. **Клас** - шаблон для створення об'єктів з визначеними властивостями та методами
2. **Об'єкт** - екземпляр класу з конкретними значеннями властивостей
3. **Конструктор** - спеціальний метод для ініціалізації об'єктів
4. **Властивості (поля)** - змінні, що зберігають стан об'єкта
5. **Методи** - функції, що визначають поведінку об'єкта
6. **Геттери/Сеттери** - спеціальні методи для доступу до властивостей
7. **Статичні члени** - властивості та методи, що належать класу, а не об'єкту
8. **Приватні члени** - елементи класу, доступні тільки всередині класу (починаються з _)

## 🎮 Готові до практики?

Тепер ви знаєте:
- ✅ Як створювати класи з різними типами конструкторів
- ✅ Як використовувати властивості та методи
- ✅ Як створювати та керувати об'єктами
- ✅ Базові принципи інкапсуляції
- ✅ Статичні члени класу

Перегляньте `examples.dart` для робочих прикладів, а потім виконайте завдання в `practice.dart`!

---
**💡 Пам'ятайте**: Клас - це креслення, об'єкт - це будинок, побудований за цим кресленням! У Формулі 1 клас `Driver` - це загальне поняття гонщика, а Max Verstappen - це конкретний об'єкт цього класу! 🏎️