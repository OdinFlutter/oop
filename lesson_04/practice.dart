// УРОК 4: Практика — Поліморфізм
// Виконуйте завдання поступово, розкоментовуючи taskX() по черзі
// Запуск: dart practice.dart

void main() {
  print('Практика — Урок 4: Поліморфізм\n');

  // Розкоментуйте потрібне завдання для виконання
  // task1();
  // task2();
  // task3();
  // task4();
  // task5();

  print('Всі завдання виконано! Перевірте solutions.dart для порівняння.');
}

// =============================================================================
// ЗАВДАННЯ 1: Різні типи шин з поліморфною поведінкою
// =============================================================================

void task1() {
  print('ЗАВДАННЯ 1: Різні типи шин з поліморфною поведінкою');
  print('=' * 30);

  /*
  🔎 Що таке поліморфізм?
  Поліморфізм — це здатність об'єктів різних класів реагувати на однакові методи по-різному. Наприклад, різні типи шин мають різну поведінку, але всі мають однаковий інтерфейс.

  🏁 Навіщо це потрібно?
  Це дозволяє писати універсальний код, який працює з різними об'єктами через спільний інтерфейс.

  ✅ Що треба зробити:
  1. Створи абстрактний клас Tire з властивостями:
     - compound (String): тип суміші
     - durability (int): кількість кіл до зносу
     - grip (double): рівень зчеплення 0.0-1.0

  2. Додай абстрактні методи:
     - performanceDuringRace(): показує поведінку шини під час гонки
     - degradeOverTime(): показує, як шина зношується

  3. Створи дочірні класи:
     - SoftTire: Високе зчеплення (0.9), низька довговічність (15 кіл)
     - MediumTire: Баланс (0.7), середня довговічність (25 кіл)
     - HardTire: Менше зчеплення (0.5), висока довговічність (40 кіл)
     - WetTire: Для дощу (0.8), середня довговічність (20 кіл)

  4. Перевизнач кожен метод для кожного типу шини.

  🧩 Пояснення:
  - abstract class — це клас, який не можна створити напряму, тільки через наслідування
  - @override — перевизначаємо метод для конкретної шини

  💡 Підказка:
  Для списку шин використовуй List<Tire> і цикл for (var tire in tireSet) { ... }

  🔨 Покроковий приклад:

    abstract class Tire {
      String compound;
      int durability;
      double grip;

      Tire(this.compound, this.durability, this.grip);

      void performanceDuringRace();
      void degradeOverTime();
    }

    class SoftTire extends Tire {
      SoftTire() : super('Soft', 15, 0.9);

      @override
      void performanceDuringRace() {
        print('Soft: Дуже швидка, але швидко зношується.');
      }

      @override
      void degradeOverTime() {
        print('Soft: Зчеплення падає після 10 кіл.');
      }
    }

    class MediumTire extends Tire {
      MediumTire() : super('Medium', 25, 0.7);

      @override
      void performanceDuringRace() {
        print('Medium: Баланс швидкості та довговічності.');
      }

      @override
      void degradeOverTime() {
        print('Medium: Зчеплення стабільне до 20 кіл.');
      }
    }

    class HardTire extends Tire {
      HardTire() : super('Hard', 40, 0.5);

      @override
      void performanceDuringRace() {
        print('Hard: Повільніша, але дуже довговічна.');
      }

      @override
      void degradeOverTime() {
        print('Hard: Зчеплення падає після 30 кіл.');
      }
    }

    class WetTire extends Tire {
      WetTire() : super('Wet', 20, 0.8);

      @override
      void performanceDuringRace() {
        print('Wet: Відмінна для дощу, гарне зчеплення на мокрому.');
      }

      @override
      void degradeOverTime() {
        print('Wet: Зчеплення падає, якщо траса підсихає.');
      }
    }

    void main() {
      List<Tire> tireSet = [
        SoftTire(),
        MediumTire(),
        HardTire(),
        WetTire(),
      ];

      for (var tire in tireSet) {
        tire.performanceDuringRace();
        tire.degradeOverTime();
        print('');
      }
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свої класи та протестуй їх

  print('');
}

// =============================================================================
// TASK 2: Racing flags with different meanings
// =============================================================================

void task2() {
  print('TASK 2: Racing flags polymorphism');
  print('=' * 35);

  /*
  TASK:
  Create an abstract RacingFlag class with:
  - color (String): flag color
  - meaning (String): what the flag means
  
  Add abstract method:
  - displayToDrivers(): shows flag message to drivers
  
  Create these flag types:
  - GreenFlag: Race start/restart, "RACE IS ON!"
  - YellowFlag: Caution, "SLOW DOWN - DANGER AHEAD"
  - RedFlag: Stop race, "STOP IMMEDIATELY - SAFETY ISSUE"
  - ChequeredFlag: Race finish, "RACE FINISHED - CONGRATULATIONS!"
  - BlueFlag: Let faster car pass, "MOVE ASIDE - FASTER CAR APPROACHING"
  
  Each flag should have unique driver instructions.
  Create a race marshal system that can display any flag.
  */

  // TODO: Create RacingFlag abstract class and flag types

  // TODO: Create race marshal and test flags
  // List<RacingFlag> raceFlags = [
  //   GreenFlag(),
  //   YellowFlag(),
  //   BlueFlag(),
  //   ChequeredFlag(),
  // ];

  // print('Race Marshal communicating with drivers:\n');
  // for (var flag in raceFlags) {
  //   flag.displayToDrivers();
  //   print('');
  // }

  print('');
}

// =============================================================================
// TASK 3: Engine types with different characteristics
// =============================================================================

void task3() {
  print('TASK 3: Engine polymorphism');
  print('=' * 28);

  /*
  TASK:
  Create an abstract Engine class with:
  - horsepower (int): engine power
  - fuelType (String): type of fuel
  - engineType (String): engine type name
  
  Add abstract methods:
  - startEngine(): engine startup behavior
  - accelerate(): acceleration characteristics
  - engineSound(): what sound the engine makes
  
  Create these engine types:
  - V6TurboEngine: F1 style, 1000hp, hybrid fuel
  - V8Engine: NASCAR style, 750hp, gasoline
  - ElectricEngine: Formula E, 400hp, battery
  - V12Engine: Classic F1, 900hp, gasoline
  
  Each engine should have unique startup, acceleration, and sound.
  Test by starting different engines and showing their characteristics.
  */

  // TODO: Create Engine abstract class and engine types

  // TODO: Test different engines
  // List<Engine> engines = [
  //   V6TurboEngine(),
  //   V8Engine(),
  //   ElectricEngine(),
  //   V12Engine(),
  // ];

  // print('Testing different engines:\n');
  // for (var engine in engines) {
  //   engine.startEngine();
  //   engine.accelerate();
  //   engine.engineSound();
  //   print('HP: ${engine.horsepower}, Fuel: ${engine.fuelType}');
  //   print('~' * 25);
  // }

  print('');
}

// =============================================================================
// TASK 4: Race track surfaces with different grip levels
// =============================================================================

void task4() {
  print('TASK 4: Track surface polymorphism');
  print('=' * 35);

  /*
  TASK:
  Create an abstract TrackSurface class with:
  - surfaceType (String): type of surface
  - gripLevel (double): grip coefficient 0.0-1.0
  - temperature (int): surface temperature in Celsius
  
  Add abstract methods:
  - affectCar(String carName): how surface affects the car
  - recommendedSpeed(): suggested speed for this surface
  - tireDegradation(): how fast tires wear on this surface
  
  Create these surfaces:
  - AsphaltSurface: High grip (0.9), normal tire wear
  - ConcreteSurface: Medium grip (0.7), high tire wear  
  - WetAsphalt: Low grip (0.4), low tire wear, requires caution
  - IceSurface: Very low grip (0.1), very low tire wear, extreme caution
  
  Test with a car driving on different surfaces.
  */

  // TODO: Create TrackSurface abstract class and surface types

  // TODO: Test car on different surfaces
  // String carName = 'Ferrari SF-75';
  // List<TrackSurface> surfaces = [
  //   AsphaltSurface(),
  //   ConcreteSurface(),
  //   WetAsphalt(),
  //   IceSurface(),
  // ];

  // for (var surface in surfaces) {
  //   print('Surface: ${surface.surfaceType}');
  //   surface.affectCar(carName);
  //   surface.recommendedSpeed();
  //   surface.tireDegradation();
  //   print('');
  // }

  print('');
}

// =============================================================================
// TASK 5: Complex task - Race commentator system
// =============================================================================

void task5() {
  print('TASK 5: Race commentator polymorphism');
  print('=' * 38);

  /*
  TASK:
  Create an abstract RaceCommentator class with:
  - name (String): commentator name
  - experience (int): years of experience
  - specialty (String): what they're known for
  
  Add abstract methods:
  - commentOnOvertake(String driver1, String driver2): overtake commentary
  - commentOnCrash(String driver): crash commentary  
  - commentOnVictory(String winner): victory commentary
  - getExcitement(): excitement level for different events
  
  Create these commentator types:
  - ExcitedCommentator: High energy, lots of enthusiasm
  - TechnicalCommentator: Detailed analysis, calm delivery
  - EmotionalCommentator: Emotional reactions, dramatic flair
  - ComedyCommentator: Funny remarks, light-hearted tone
  
  Create a race broadcast system that uses different commentators
  for different race events. Test with various race scenarios.
  */

  // TODO: Create RaceCommentator abstract class and commentator types

  // TODO: Create race broadcast system and test scenarios
  // List<RaceCommentator> commentators = [
  //   ExcitedCommentator('David Croft', 15, 'High Energy'),
  //   TechnicalCommentator('Martin Brundle', 25, 'Technical Analysis'),
  //   EmotionalCommentator('Murray Walker', 35, 'Emotional Drama'),
  //   ComedyCommentator('James Hunt', 20, 'Witty Remarks'),
  // ];

  // // Test different race events
  // print('RACE BROADCAST SYSTEM\n');
  //
  // for (var commentator in commentators) {
  //   print('${commentator.name} commenting:');
  //   commentator.commentOnOvertake('Hamilton', 'Verstappen');
  //   commentator.commentOnVictory('Leclerc');
  //   print('Excitement level: ${commentator.getExcitement()}');
  //   print('~' * 30);
  // }

  print('');
}

// =============================================================================
// HELPFUL NOTES
// =============================================================================

/*
POLYMORPHISM TIPS:

1. ABSTRACT CLASSES:
   - Use 'abstract' keyword
   - Can have concrete and abstract methods
   - Cannot be instantiated directly
   - Child classes MUST implement abstract methods

2. METHOD OVERRIDING:
   - Use @override annotation
   - Child method replaces parent method
   - Same method name, different implementation

3. POLYMORPHIC BEHAVIOR:
   - Same method call, different behaviors
   - Dart determines which method to call at runtime
   - Works with lists of parent type containing child objects

4. DESIGN PATTERNS:
   - Define common interface in parent
   - Implement specific behavior in children  
   - Code works with parent type, gets child behavior

5. BENEFITS:
   - Flexible and extensible code
   - Easy to add new types
   - Clean interfaces
   - Real-world modeling

EXAMPLE PATTERN:
```dart
abstract class Parent {
  void commonMethod(); // Abstract - must implement
  
  void sharedMethod() {  // Concrete - can override
    print('Default behavior');
  }
}

class Child extends Parent {
  @override
  void commonMethod() {
    print('Child-specific behavior');
  }
}
```
*/
