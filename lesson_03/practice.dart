// УРОК 3: Практика — Наслідування
// Виконуйте завдання поступово, розкоментовуючи taskX() по черзі
// Запуск: dart practice.dart

void main() {
  print('Практика — Урок 3: Наслідування\n');

  // Розкоментуйте потрібне завдання для виконання
  // task1();
  // task2();
  // task3();
  // task4();
  // task5();

  print('Всі завдання виконано! Перевірте solutions.dart для порівняння.');
}

// =============================================================================
// ЗАВДАННЯ 1: Базова ієрархія транспортних засобів (Vehicle)
// =============================================================================

void task1() {
  print('ЗАВДАННЯ 1: Базова ієрархія транспортних засобів (Vehicle)');
  print('=' * 50);

  /*
  🔎 Що таке наслідування?
  Наслідування — це принцип ООП, який дозволяє створювати нові класи на основі існуючих. Дочірній клас успадковує властивості та методи батьківського класу.

  🏁 Навіщо це потрібно?
  Це дозволяє уникнути дублювання коду, створювати логічні групи об'єктів та розширювати функціональність існуючих класів.

  ✅ Що треба зробити:
  1. Створи базовий клас Vehicle з властивостями:
     - brand (String): марка
     - model (String): модель
     - year (int): рік
     - maxSpeed (int): максимальна швидкість

  2. Методи базового класу:
     - start(): запуск двигуна
     - stop(): зупинка
     - getInfo(): інформація про транспортний засіб

  3. Створи дочірні класи:
     - F1Car extends Vehicle
       - Додаткові: team, aerodynamicLevel
       - Методи: deployDRS(), activateERS()
     
     - RallyCar extends Vehicle
       - Додаткові: isFourWheelDrive, terrainType
       - Методи: switchToOffRoad(), activateDifferential()
     
     - GT3Car extends Vehicle
       - Додаткові: enduranceLevel, fuelCapacity
       - Методи: activateEnduranceMode(), refuel()

  🧩 Пояснення:
  - extends означає "розширює" або "наслідує від"
  - super() викликає конструктор батьківського класу
  - @override позначає перевизначення методу

  💡 Підказка:
  Використовуй super(brand, model, year, maxSpeed) у конструкторах дочірніх класів.

  🔨 Покроковий приклад:

    class Vehicle {
      String brand;
      String model;
      int year;
      int maxSpeed;

      Vehicle(this.brand, this.model, this.year, this.maxSpeed);

      void start() {
        print('$brand $model запускається...');
      }

      void stop() {
        print('$brand $model зупиняється...');
      }

      void getInfo() {
        print('$brand $model ($year), максимальна швидкість: $maxSpeed км/год');
      }
    }

    class F1Car extends Vehicle {
      String team;
      int aerodynamicLevel;

      F1Car(String brand, String model, int year, int maxSpeed, this.team, this.aerodynamicLevel)
          : super(brand, model, year, maxSpeed);

      void deployDRS() {
        print('DRS активовано для $team');
      }

      void activateERS() {
        print('ERS активовано для $team');
      }

      @override
      void getInfo() {
        super.getInfo();
        print('Команда: $team, Аеродинамічний рівень: $aerodynamicLevel');
      }
    }

    class RallyCar extends Vehicle {
      bool isFourWheelDrive;
      String terrainType;

      RallyCar(String brand, String model, int year, int maxSpeed, this.isFourWheelDrive, this.terrainType)
          : super(brand, model, year, maxSpeed);

      void switchToOffRoad() {
        print('Переключення на позашляховий режим');
      }

      void activateDifferential() {
        print('Диференціал активовано');
      }

      @override
      void getInfo() {
        super.getInfo();
        print('Повний привід: ${isFourWheelDrive ? "Так" : "Ні"}, Тип місцевості: $terrainType');
      }
    }

    class GT3Car extends Vehicle {
      int enduranceLevel;
      double fuelCapacity;

      GT3Car(String brand, String model, int year, int maxSpeed, this.enduranceLevel, this.fuelCapacity)
          : super(brand, model, year, maxSpeed);

      void activateEnduranceMode() {
        print('Режим витривалості активовано');
      }

      void refuel() {
        print('Заправка $fuelCapacity літрів пального');
      }

      @override
      void getInfo() {
        super.getInfo();
        print('Рівень витривалості: $enduranceLevel, Ємність баку: $fuelCapacity л');
      }
    }

    void main() {
      Vehicle f1 = F1Car('Red Bull', 'RB19', 2023, 350, 'Red Bull Racing', 3);
      Vehicle rally = RallyCar('Toyota', 'GR Yaris', 2023, 200, true, 'Gravel');
      Vehicle gt3 = GT3Car('Porsche', '911 GT3 R', 2023, 280, 8, 120);

      f1.start();
      f1.getInfo();
      rally.start();
      rally.getInfo();
      gt3.start();
      gt3.getInfo();
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свої класи та протестуй їх

  print('');
}

// =============================================================================
// ЗАВДАННЯ 2: Ієрархія пілотів з рівнями досвіду (Driver)
// =============================================================================

void task2() {
  print('ЗАВДАННЯ 2: Ієрархія пілотів з рівнями досвіду (Driver)');
  print('=' * 50);

  /*
  🔎 Що таке ієрархія пілотів?
  Це система класів, яка представляє різні типи пілотів з їх специфічними властивостями та методами.

  🏁 Навіщо це потрібно?
  Це дозволяє моделювати різні типи пілотів (F1, ралі, витривалість) з їх унікальними характеристиками.

  ✅ Що треба зробити:
  1. Створи базовий клас Driver з властивостями:
     - name (String): ім'я
     - age (int): вік
     - nationality (String): національність
     - experienceYears (int): роки досвіду

  2. Методи базового класу:
     - introduce(): представлення пілота
     - train(): тренування
     - getExperienceLevel(): рівень досвіду

  3. Створи дочірні класи:
     - F1Driver extends Driver
       - Додаткові: team, championships, raceWins, bestLapTime
       - Методи: qualify(), race(), getChampionshipStatus()
     
     - RallyDriver extends Driver
       - Додаткові: coDriver, rallyWins, terrainSpecialty
       - Методи: navigate(), switchTerrain(), getRallyStats()
     
     - EnduranceDriver extends Driver
       - Додаткові: enduranceWins, staminaLevel, teamRole
       - Методи: longDistanceRace(), switchDriver(), getEnduranceStats()

  🧩 Пояснення:
  - Кожен тип пілота має свої унікальні властивості та методи
  - getExperienceLevel() може повертати різні значення залежно від типу пілота

  💡 Підказка:
  Для getExperienceLevel() використовуй різну логіку для різних типів пілотів.

  🔨 Покроковий приклад:

    class Driver {
      String name;
      int age;
      String nationality;
      int experienceYears;

      Driver(this.name, this.age, this.nationality, this.experienceYears);

      void introduce() {
        print('Привіт, я $name з $nationality');
      }

      void train() {
        print('$name тренується...');
      }

      String getExperienceLevel() {
        if (experienceYears < 3) return 'Новачок';
        if (experienceYears < 7) return 'Досвідчений';
        if (experienceYears < 15) return 'Ветеран';
        return 'Легенда';
      }
    }

    class F1Driver extends Driver {
      String team;
      int championships;
      int raceWins;
      double bestLapTime;

      F1Driver(String name, int age, String nationality, int experienceYears,
               this.team, this.championships, this.raceWins, this.bestLapTime)
          : super(name, age, nationality, experienceYears);

      void qualify() {
        print('$name кваліфікується для команди $team');
      }

      void race() {
        print('$name бере участь у гонці F1');
      }

      String getChampionshipStatus() {
        if (championships > 0) {
          return '$championships-кратний чемпіон світу';
        }
        return 'Переслідує перший титул';
      }

      @override
      void introduce() {
        super.introduce();
        print('Я пілот F1 команди $team з $raceWins перемогами');
      }

      @override
      String getExperienceLevel() {
        if (championships > 0) return 'Чемпіон';
        if (raceWins > 10) return 'Переможець';
        return super.getExperienceLevel();
      }
    }

    class RallyDriver extends Driver {
      String coDriver;
      int rallyWins;
      String terrainSpecialty;

      RallyDriver(String name, int age, String nationality, int experienceYears,
                  this.coDriver, this.rallyWins, this.terrainSpecialty)
          : super(name, age, nationality, experienceYears);

      void navigate() {
        print('$name навігує з $coDriver');
      }

      void switchTerrain() {
        print('Переключення на $terrainSpecialty');
      }

      String getRallyStats() {
        return '$rallyWins перемог у ралі, спеціалізація: $terrainSpecialty';
      }

      @override
      void introduce() {
        super.introduce();
        print('Мій штурман: $coDriver, $rallyWins перемог у ралі');
      }
    }

    class EnduranceDriver extends Driver {
      int enduranceWins;
      int staminaLevel;
      String teamRole;

      EnduranceDriver(String name, int age, String nationality, int experienceYears,
                      this.enduranceWins, this.staminaLevel, this.teamRole)
          : super(name, age, nationality, experienceYears);

      void longDistanceRace() {
        print('$name бере участь у довготривалій гонці');
      }

      void switchDriver() {
        print('$name змінює пілота');
      }

      String getEnduranceStats() {
        return '$enduranceWins перемог у витривалості, рівень витривалості: $staminaLevel/10';
      }

      @override
      void introduce() {
        super.introduce();
        print('Роль у команді: $teamRole, $enduranceWins перемог у витривалості');
      }

      @override
      String getExperienceLevel() {
        if (staminaLevel > 8) return 'Витривалий';
        return super.getExperienceLevel();
      }
    }

    void main() {
      Driver max = F1Driver('Макс Ферстаппен', 26, 'Нідерланди', 8, 'Red Bull', 3, 54, 1.18);
      Driver sebastien = RallyDriver('Себастьєн Ожьє', 39, 'Франція', 15, 'Жульєн Інграссія', 8, 'Асфальт');
      Driver fernando = EnduranceDriver('Фернандо Алонсо', 42, 'Іспанія', 20, 2, 9, 'Лідер команди');

      max.introduce();
      print('Досвід: ${max.getExperienceLevel()}');
      sebastien.introduce();
      print('Досвід: ${sebastien.getExperienceLevel()}');
      fernando.introduce();
      print('Досвід: ${fernando.getExperienceLevel()}');
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свої класи та протестуй їх

  print('');
}

// =============================================================================
// ЗАВДАННЯ 3: Ієрархія управління командою (TeamMember)
// =============================================================================

void task3() {
  print('ЗАВДАННЯ 3: Ієрархія управління командою (TeamMember)');
  print('=' * 45);

  /*
  🔎 Що таке ієрархія команди?
  Це система класів, яка представляє різні ролі в команді Формули 1 з їх специфічними обов'язками.

  🏁 Навіщо це потрібно?
  Це дозволяє моделювати різні ролі в команді (інженери, механіки, менеджери) з їх унікальними функціями.

  ✅ Що треба зробити:
  1. Створи базовий клас TeamMember з властивостями:
     - name (String): ім'я
     - role (String): роль
     - salary (double): зарплата
     - yearsInTeam (int): роки в команді

  2. Методи базового класу:
     - work(): робота
     - getSalary(): отримання зарплати
     - getTeamStatus(): статус в команді

  3. Створи дочірні класи:
     - Engineer extends TeamMember
       - Додаткові: specialization, certifications, projects
       - Методи: designSystem(), analyzeData(), getEngineeringStats()
     
     - Mechanic extends TeamMember
       - Додаткові: tools, certifications, pitStopExperience
       - Методи: repairCar(), performPitStop(), getMechanicStats()
     
     - Manager extends TeamMember
       - Додаткові: department, teamSize, budget
       - Методи: manageTeam(), makeDecisions(), getManagementStats()

  🧩 Пояснення:
  - Кожна роль має свої специфічні обов'язки та статистику
  - Зарплата може розраховуватися по-різному залежно від ролі

  💡 Підказка:
  Для getSalary() використовуй різну логіку розрахунку залежно від ролі та досвіду.

  🔨 Покроковий приклад:

    class TeamMember {
      String name;
      String role;
      double salary;
      int yearsInTeam;

      TeamMember(this.name, this.role, this.salary, this.yearsInTeam);

      void work() {
        print('$name працює як $role');
      }

      double getSalary() {
        return salary;
      }

      String getTeamStatus() {
        if (yearsInTeam < 2) return 'Новий член команди';
        if (yearsInTeam < 5) return 'Досвідчений член команди';
        return 'Ветеран команди';
      }
    }

    class Engineer extends TeamMember {
      String specialization;
      List<String> certifications;
      List<String> projects;

      Engineer(String name, String role, double salary, int yearsInTeam,
               this.specialization, this.certifications, this.projects)
          : super(name, role, salary, yearsInTeam);

      void designSystem() {
        print('$name проектує систему в галузі $specialization');
      }

      void analyzeData() {
        print('$name аналізує дані телеметрії');
      }

      String getEngineeringStats() {
        return 'Спеціалізація: $specialization, Сертифікати: ${certifications.length}, Проекти: ${projects.length}';
      }

      @override
      void work() {
        print('$name працює над проектом ${projects.isNotEmpty ? projects.last : "новий"}');
      }

      @override
      double getSalary() {
        double bonus = certifications.length * 1000 + projects.length * 500;
        return salary + bonus;
      }
    }

    class Mechanic extends TeamMember {
      List<String> tools;
      List<String> certifications;
      int pitStopExperience;

      Mechanic(String name, String role, double salary, int yearsInTeam,
               this.tools, this.certifications, this.pitStopExperience)
          : super(name, role, salary, yearsInTeam);

      void repairCar() {
        print('$name ремонтує автомобіль використовуючи ${tools.join(", ")}');
      }

      void performPitStop() {
        print('$name виконує піт-стоп (досвід: $pitStopExperience)');
      }

      String getMechanicStats() {
        return 'Інструменти: ${tools.length}, Сертифікати: ${certifications.length}, Піт-стопи: $pitStopExperience';
      }

      @override
      void work() {
        print('$name підготовляє автомобіль до гонки');
      }

      @override
      double getSalary() {
        double bonus = pitStopExperience * 50 + certifications.length * 200;
        return salary + bonus;
      }
    }

    class Manager extends TeamMember {
      String department;
      int teamSize;
      double budget;

      Manager(String name, String role, double salary, int yearsInTeam,
              this.department, this.teamSize, this.budget)
          : super(name, role, salary, yearsInTeam);

      void manageTeam() {
        print('$name керує командою з $teamSize людей у відділі $department');
      }

      void makeDecisions() {
        print('$name приймає стратегічні рішення з бюджетом ${budget.toStringAsFixed(0)}');
      }

      String getManagementStats() {
        return 'Відділ: $department, Розмір команди: $teamSize, Бюджет: ${budget.toStringAsFixed(0)}';
      }

      @override
      void work() {
        print('$name планує стратегію команди');
      }

      @override
      double getSalary() {
        double bonus = teamSize * 100 + budget * 0.001;
        return salary + bonus;
      }
    }

    void main() {
      TeamMember engineer = Engineer('Адріан Ньюї', 'Головний технічний директор', 5000000, 15,
                                   'Аеродинаміка', ['F1', 'Aero'], ['RB19', 'RB20']);
      TeamMember mechanic = Mechanic('Джон Сміт', 'Головний механік', 80000, 8,
                                    ['Гайковерт', 'Діагностичний інструмент'], ['F1 Safety'], 120);
      TeamMember manager = Manager('Крістіан Хорнер', 'Керівник команди', 3000000, 18,
                                  'Операції', 850, 500000000);

      engineer.work();
      engineer.getTeamStatus();
      mechanic.work();
      mechanic.getTeamStatus();
      manager.work();
      manager.getTeamStatus();
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свої класи та протестуй їх

  print('');
}

// =============================================================================
// ЗАВДАННЯ 4: Система чемпіонатів з наслідуванням (Championship)
// =============================================================================

void task4() {
  print('ЗАВДАННЯ 4: Система чемпіонатів з наслідуванням (Championship)');
  print('=' * 50);

  /*
  🔎 Що таке система чемпіонатів?
  Це система класів, яка представляє різні типи чемпіонатів з їх специфічними правилами та системами балів.

  🏁 Навіщо це потрібно?
  Це дозволяє моделювати різні типи змагань (F1, ралі, витривалість) з їх унікальними характеристиками.

  ✅ Що треба зробити:
  1. Створи базовий клас Championship з властивостями:
     - name (String): назва
     - year (int): рік
     - numberOfRounds (int): кількість раундів
     - participants (List<String>): учасники

  2. Методи базового класу:
     - addParticipant(): додати учасника
     - startSeason(): почати сезон
     - getStandings(): отримати позиції

  3. Створи дочірні класи:
     - F1Championship extends Championship
       - Додаткові: constructors, drivers, sprintRaces
       - Методи: addConstructor(), addDriver(), calculatePoints()
     
     - RallyChampionship extends Championship
       - Додаткові: events, terrainTypes, coDrivers
       - Методи: addEvent(), addTerrain(), calculateRallyPoints()
     
     - EnduranceChampionship extends Championship
       - Додаткові: races, carClasses, driverTeams
       - Методи: addRace(), addCarClass(), calculateEndurancePoints()

  🧩 Пояснення:
  - Кожен тип чемпіонату має свої правила та систему балів
  - addParticipant() може працювати по-різному для різних типів

  💡 Підказка:
  Для addParticipant() використовуй різну логіку залежно від типу чемпіонату.

  🔨 Покроковий приклад:

    class Championship {
      String name;
      int year;
      int numberOfRounds;
      List<String> participants = [];

      Championship(this.name, this.year, this.numberOfRounds);

      void addParticipant(String participant) {
        if (!participants.contains(participant)) {
          participants.add(participant);
          print('$participant додано до $name');
        }
      }

      void startSeason() {
        print('Сезон $name $year почався з ${participants.length} учасниками');
      }

      void getStandings() {
        print('Позиції в $name:');
        for (int i = 0; i < participants.length; i++) {
          print('${i + 1}. ${participants[i]}');
        }
      }
    }

    class F1Championship extends Championship {
      List<String> constructors = [];
      List<String> drivers = [];
      int sprintRaces;

      F1Championship(String name, int year, int numberOfRounds, this.sprintRaces)
          : super(name, year, numberOfRounds);

      void addConstructor(String constructor) {
        if (!constructors.contains(constructor)) {
          constructors.add(constructor);
          print('Конструктор $constructor додано до F1');
        }
      }

      void addDriver(String driver) {
        if (!drivers.contains(driver)) {
          drivers.add(driver);
          print('Пілот $driver додано до F1');
        }
      }

      void calculatePoints() {
        print('Розрахунок балів F1: 1-ше місце = 25 балів, 2-ге = 18, тощо');
      }

      @override
      void addParticipant(String participant) {
        // F1 має і конструкторів, і пілотів
        if (participant.contains('Racing') || participant.contains('Team')) {
          addConstructor(participant);
        } else {
          addDriver(participant);
        }
      }

      @override
      void getStandings() {
        print('Позиції в F1 $name:');
        print('Конструктори: ${constructors.join(", ")}');
        print('Пілоти: ${drivers.join(", ")}');
        print('Спринт-гонки: $sprintRaces');
      }
    }

    class RallyChampionship extends Championship {
      List<String> events = [];
      List<String> terrainTypes = [];
      List<String> coDrivers = [];

      RallyChampionship(String name, int year, int numberOfRounds)
          : super(name, year, numberOfRounds);

      void addEvent(String event) {
        if (!events.contains(event)) {
          events.add(event);
          print('Етап $event додано до ралі');
        }
      }

      void addTerrain(String terrain) {
        if (!terrainTypes.contains(terrain)) {
          terrainTypes.add(terrain);
          print('Тип місцевості $terrain додано');
        }
      }

      void calculateRallyPoints() {
        print('Розрахунок балів ралі: перемога = 25 балів, 2-ге = 18, тощо');
      }

      @override
      void addParticipant(String participant) {
        // Ралі має команди
        super.addParticipant(participant);
        print('Команда ралі $participant зареєстрована');
      }

      @override
      void getStandings() {
        print('Позиції в ралі $name:');
        print('Етапи: ${events.join(", ")}');
        print('Типи місцевості: ${terrainTypes.join(", ")}');
        print('Учасники: ${participants.join(", ")}');
      }
    }

    class EnduranceChampionship extends Championship {
      List<String> races = [];
      List<String> carClasses = [];
      List<String> driverTeams = [];

      EnduranceChampionship(String name, int year, int numberOfRounds)
          : super(name, year, numberOfRounds);

      void addRace(String race) {
        if (!races.contains(race)) {
          races.add(race);
          print('Гонка $race додана до витривалості');
        }
      }

      void addCarClass(String carClass) {
        if (!carClasses.contains(carClass)) {
          carClasses.add(carClass);
          print('Клас автомобілів $carClass додано');
        }
      }

      void calculateEndurancePoints() {
        print('Розрахунок балів витривалості: перемога = 25 балів, 2-ге = 18, тощо');
      }

      @override
      void addParticipant(String participant) {
        // Витривалість має команди
        super.addParticipant(participant);
        driverTeams.add(participant);
        print('Команда витривалості $participant зареєстрована');
      }

      @override
      void getStandings() {
        print('Позиції у витривалості $name:');
        print('Гонки: ${races.join(", ")}');
        print('Класи автомобілів: ${carClasses.join(", ")}');
        print('Команди: ${driverTeams.join(", ")}');
      }
    }

    void main() {
      Championship f1 = F1Championship('Чемпіонат світу Формули 1', 2024, 24, 6);
      Championship rally = RallyChampionship('Чемпіонат світу ралі', 2024, 13);
      Championship endurance = EnduranceChampionship('Чемпіонат світу витривалості', 2024, 8);

      f1.addParticipant('Red Bull Racing');
      f1.addParticipant('Макс Ферстаппен');
      rally.addParticipant('Toyota Gazoo Racing');
      endurance.addParticipant('Toyota Gazoo Racing');

      f1.startSeason();
      rally.startSeason();
      endurance.startSeason();
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свої класи та протестуй їх

  print('');
}

// =============================================================================
// ЗАВДАННЯ 5: Просунута система наслідування з інтерфейсами
// =============================================================================

void task5() {
  print('ЗАВДАННЯ 5: Просунута система наслідування з інтерфейсами');
  print('=' * 55);

  /*
  🔎 Що таке інтерфейси в наслідуванні?
  Інтерфейси визначають контракт, який класи повинні виконувати. Вони дозволяють створювати абстрактні методи, які дочірні класи повинні реалізувати.

  🏁 Навіщо це потрібно?
  Це забезпечує уніфікований інтерфейс для різних класів та дозволяє створювати більш гнучкі системи.

  ✅ Що треба зробити:
  1. Створи абстрактний клас RacingVehicle з абстрактними методами:
     - startEngine(): запуск двигуна
     - accelerate(): прискорення
     - brake(): гальмування

  2. Створи інтерфейс TelemetryProvider з методами:
     - getSpeed(): отримати швидкість
     - getFuelLevel(): отримати рівень пального
     - getStatus(): отримати статус

  3. Створи дочірні класи:
     - F1Car extends RacingVehicle implements TelemetryProvider
     - RallyCar extends RacingVehicle implements TelemetryProvider
     - ElectricCar extends RacingVehicle implements TelemetryProvider

  🧩 Пояснення:
  - abstract class визначає базову функціональність
  - interface визначає контракт, який класи повинні виконувати
  - implements означає "реалізує інтерфейс"

  💡 Підказка:
  Абстрактні методи не мають тіла і повинні бути реалізовані в дочірніх класах.

  🔨 Покроковий приклад:

    // Абстрактний базовий клас
    abstract class RacingVehicle {
      String brand;
      String model;
      int maxSpeed;

      RacingVehicle(this.brand, this.model, this.maxSpeed);

      // Абстрактні методи (повинні бути реалізовані в дочірніх класах)
      void startEngine();
      void accelerate();
      void brake();

      // Конкретний метод (має реалізацію)
      void displayInfo() {
        print('$brand $model, максимальна швидкість: $maxSpeed км/год');
      }
    }

    // Інтерфейс для телеметрії
    abstract class TelemetryProvider {
      double getSpeed();
      double getFuelLevel();
      String getStatus();
    }

    // F1 автомобіль
    class F1Car extends RacingVehicle implements TelemetryProvider {
      double currentSpeed = 0;
      double fuelLevel = 100;
      bool engineRunning = false;

      F1Car(String brand, String model, int maxSpeed)
          : super(brand, model, maxSpeed);

      @override
      void startEngine() {
        engineRunning = true;
        print('$brand $model: V6 турбо двигун запущено');
      }

      @override
      void accelerate() {
        if (engineRunning) {
          currentSpeed = (currentSpeed + 50).clamp(0, maxSpeed.toDouble());
          fuelLevel -= 2;
          print('Прискорення до ${currentSpeed.toStringAsFixed(0)} км/год');
        }
      }

      @override
      void brake() {
        currentSpeed = (currentSpeed - 30).clamp(0, maxSpeed.toDouble());
        print('Гальмування до ${currentSpeed.toStringAsFixed(0)} км/год');
      }

      @override
      double getSpeed() => currentSpeed;

      @override
      double getFuelLevel() => fuelLevel;

      @override
      String getStatus() {
        if (!engineRunning) return 'Двигун вимкнено';
        if (fuelLevel < 10) return 'Низький рівень пального';
        if (currentSpeed > maxSpeed * 0.9) return 'Висока швидкість';
        return 'Нормальна робота';
      }
    }

    // Ралі автомобіль
    class RallyCar extends RacingVehicle implements TelemetryProvider {
      double currentSpeed = 0;
      double fuelLevel = 100;
      bool engineRunning = false;
      bool fourWheelDrive = true;

      RallyCar(String brand, String model, int maxSpeed)
          : super(brand, model, maxSpeed);

      @override
      void startEngine() {
        engineRunning = true;
        print('$brand $model: Двигун ралі запущено');
      }

      @override
      void accelerate() {
        if (engineRunning) {
          currentSpeed = (currentSpeed + 30).clamp(0, maxSpeed.toDouble());
          fuelLevel -= 3;
          print('Прискорення ралі до ${currentSpeed.toStringAsFixed(0)} км/год');
        }
      }

      @override
      void brake() {
        currentSpeed = (currentSpeed - 20).clamp(0, maxSpeed.toDouble());
        print('Гальмування ралі до ${currentSpeed.toStringAsFixed(0)} км/год');
      }

      @override
      double getSpeed() => currentSpeed;

      @override
      double getFuelLevel() => fuelLevel;

      @override
      String getStatus() {
        if (!engineRunning) return 'Двигун вимкнено';
        if (fuelLevel < 15) return 'Низький рівень пального';
        if (fourWheelDrive) return 'Повний привід активний';
        return 'Нормальна робота';
      }
    }

    // Електромобіль
    class ElectricCar extends RacingVehicle implements TelemetryProvider {
      double currentSpeed = 0;
      double batteryLevel = 100;
      bool engineRunning = false;

      ElectricCar(String brand, String model, int maxSpeed)
          : super(brand, model, maxSpeed);

      @override
      void startEngine() {
        engineRunning = true;
        print('$brand $model: Електродвигун запущено');
      }

      @override
      void accelerate() {
        if (engineRunning) {
          currentSpeed = (currentSpeed + 40).clamp(0, maxSpeed.toDouble());
          batteryLevel -= 1;
          print('Електро прискорення до ${currentSpeed.toStringAsFixed(0)} км/год');
        }
      }

      @override
      void brake() {
        currentSpeed = (currentSpeed - 25).clamp(0, maxSpeed.toDouble());
        batteryLevel += 0.5; // Регенеративне гальмування
        print('Електро гальмування до ${currentSpeed.toStringAsFixed(0)} км/год');
      }

      @override
      double getSpeed() => currentSpeed;

      @override
      double getFuelLevel() => batteryLevel; // Для електромобіля це рівень батареї

      @override
      String getStatus() {
        if (!engineRunning) return 'Двигун вимкнено';
        if (batteryLevel < 20) return 'Низький рівень батареї';
        if (currentSpeed > maxSpeed * 0.8) return 'Висока швидкість';
        return 'Нормальна робота';
      }
    }

    void main() {
      List<RacingVehicle> vehicles = [
        F1Car('Red Bull', 'RB19', 350),
        RallyCar('Toyota', 'GR Yaris', 200),
        ElectricCar('Tesla', 'Model S Plaid', 320),
      ];

      for (var vehicle in vehicles) {
        vehicle.displayInfo();
        vehicle.startEngine();
        vehicle.accelerate();
        vehicle.accelerate();
        vehicle.brake();

        // Використання інтерфейсу телеметрії
        if (vehicle is TelemetryProvider) {
          print('Швидкість: ${vehicle.getSpeed()} км/год');
          print('Пальне/Батарея: ${vehicle.getFuelLevel()}%');
          print('Статус: ${vehicle.getStatus()}');
        }
        print('---');
      }
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свої класи та протестуй їх

  print('');
}

// =============================================================================
// ПІДКАЗКИ ДЛЯ НОВАЧКІВ
// =============================================================================

/*
ПІДКАЗКИ:

1. extends означає "наслідує від" - дочірній клас отримує всі властивості та методи батьківського
2. super() викликає конструктор батьківського класу
3. @override позначає перевизначення методу з батьківського класу
4. abstract class не може бути створена напряму, тільки через дочірні класи
5. implements означає "реалізує інтерфейс" - клас повинен реалізувати всі методи інтерфейсу

DART:
- Використовуй super для доступу до батьківського класу
- abstract методи не мають тіла і повинні бути реалізовані
- is перевіряє тип об'єкта
- as приводить тип об'єкта
*/
