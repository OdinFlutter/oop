import '../progress.dart';

// УРОК 6: Практика — Фінальний проект
// Виконуйте завдання поступово, розкоментовуючи taskX() по черзі
// Запуск: dart practice.dart

void main() {
  // Ініціалізуємо прогрес-трекер
  ProgressTracker.initialize();

  // Показуємо прогрес курсу
  ProgressTracker.displayProgress();

  print('\n🎯 ПРАКТИКА — УРОК 6: ФІНАЛЬНИЙ ПРОЕКТ');
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
// ЗАВДАННЯ 1: Базова структура симулятора чемпіонату
// =============================================================================

void task1() {
  print('ЗАВДАННЯ 1: Базова структура симулятора чемпіонату');
  print('=' * 45);

  /*
  🔎 Що таке симулятор чемпіонату?
  Це програма, яка моделює проведення сезону Формули 1: створює пілотів, команди, гонки, підраховує бали та визначає переможців.

  🏁 Навіщо це потрібно?
  Це дозволяє потренувати всі принципи ООП на практиці: інкапсуляцію, наслідування, поліморфізм, абстракцію та взаємодію об'єктів.

  ✅ Що треба зробити:
  1. Створи класи:
     - Driver: name, team, number, points, wins; методи addPoints(), addWin(), getStats()
     - Team: name, drivers, constructorPoints, budget; методи addDriver(), calculateTeamPoints(), getTeamStats()
     - Race: name, location, date, results; методи addResult(), getPodium(), calculatePoints()
     - Championship: season, races, teams, drivers; методи addRace(), addTeam(), getStandings(), simulateSeason()

  2. Реалізуй базові принципи ООП: інкапсуляція (приватні поля), взаємодія об'єктів (команда містить пілотів, чемпіонат — команди і гонки).

  3. Протестуй роботу класів: створи чемпіонат, додай команди, пілотів, гонки, симулюй сезон, виведи результати.

  🧩 Пояснення:
  - Кожен клас відповідає за свою частину логіки
  - Об'єкти взаємодіють між собою через методи

  💡 Підказка:
  Для зберігання результатів гонки використовуй Map<int, Driver> (позиція -> пілот)

  🔨 Покроковий приклад:

    class Driver {
      String name;
      String team;
      int number;
      int points = 0;
      int wins = 0;

      Driver(this.name, this.team, this.number);

      void addPoints(int pts) {
        points += pts;
      }

      void addWin() {
        wins += 1;
      }

      void getStats() {
        print('$name ($team) — $points балів, перемог: $wins');
      }
    }

    class Team {
      String name;
      List<Driver> drivers = [];
      int constructorPoints = 0;
      double budget;

      Team(this.name, this.budget);

      void addDriver(Driver driver) {
        drivers.add(driver);
      }

      void calculateTeamPoints() {
        constructorPoints = drivers.fold(0, (sum, d) => sum + d.points);
      }

      void getTeamStats() {
        print('Команда $name — $constructorPoints балів, бюджет: $budget');
        for (var d in drivers) {
          d.getStats();
        }
      }
    }

    class Race {
      String name;
      String location;
      String date;
      Map<int, Driver> results = {};

      Race(this.name, this.location, this.date);

      void addResult(int position, Driver driver) {
        results[position] = driver;
        if (position == 1) driver.addWin();
        driver.addPoints(_pointsForPosition(position));
      }

      int _pointsForPosition(int pos) {
        switch (pos) {
          case 1: return 25;
          case 2: return 18;
          case 3: return 15;
          case 4: return 12;
          case 5: return 10;
          case 6: return 8;
          case 7: return 6;
          case 8: return 4;
          case 9: return 2;
          case 10: return 1;
          default: return 0;
        }
      }

      void getPodium() {
        print('Подіум гонки $name:');
        for (int i = 1; i <= 3; i++) {
          if (results.containsKey(i)) {
            print('$i. ${results[i]!.name} (${results[i]!.team})');
          }
        }
      }
    }

    class Championship {
      int season;
      List<Race> races = [];
      List<Team> teams = [];
      List<Driver> drivers = [];

      Championship(this.season);

      void addRace(Race race) {
        races.add(race);
      }

      void addTeam(Team team) {
        teams.add(team);
        drivers.addAll(team.drivers);
      }

      void simulateSeason() {
        for (var race in races) {
          race.getPodium();
        }
      }

      void getStandings() {
        drivers.sort((a, b) => b.points.compareTo(a.points));
        print('Підсумкові результати сезону $season:');
        for (int i = 0; i < drivers.length; i++) {
          print('${i + 1}. ${drivers[i].name} (${drivers[i].team}) — ${drivers[i].points} балів');
        }
      }
    }

    void main() {
      Championship championship = Championship(2024);
      Team redBull = Team('Red Bull Racing', 1000000000);
      Driver max = Driver('Макс Ферстаппен', 'Red Bull Racing', 1);
      Driver checo = Driver('Серхіо Перес', 'Red Bull Racing', 11);

      redBull.addDriver(max);
      redBull.addDriver(checo);
      championship.addTeam(redBull);

      Race monaco = Race('Гран-прі Монако', 'Монако', '2024-05-26');
      monaco.addResult(1, max);
      monaco.addResult(2, checo);
      championship.addRace(monaco);

      championship.simulateSeason();
      championship.getStandings();
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свої класи та протестуй їх

  print('');

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('lesson_06', 'task1');
  print('\n✅ Завдання 1 позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');
}

// =============================================================================
// TASK 2: Advanced Race Simulation System
// =============================================================================

void task2() {
  print('TASK 2: Advanced Race Simulation System');
  print('=' * 40);

  /*
  ЗАВДАННЯ:
  Створіть розширену систему симуляції гонок з використанням патерну Стратегія.
  
  ЧОМУ ЦЕ ВАЖЛИВО:
  У реальних гонках Formula 1 кожен пілот має свою стратегію. Деякі агресивні, 
  інші консервативні, а треті адаптуються до умов. Патерн Стратегія дозволяє 
  легко змінювати поведінку об'єкта без зміни його коду.
  
  АНАЛОГІЯ:
  Уявіть, що ви граєте в шахмати. У вас є різні стратегії: атакувати, 
  захищатися або адаптуватися до ходів суперника. Кожна стратегія має 
  свої правила, але ви можете легко перемикатися між ними.
  
  ЩО ВИ СТВОРИТЕ:
  1. Абстрактний клас RaceStrategy - "шаблон" для всіх стратегій
  2. Конкретні стратегії: AggressiveStrategy, ConservativeStrategy, AdaptiveStrategy
  3. Клас RaceSimulator для симуляції гонки
  
  ПОКРОКОВІ ІНСТРУКЦІЇ:
  */

  print('📋 ДЕТАЛЬНІ ІНСТРУКЦІЇ:');
  print('');

  print('КРОК 1: Створіть абстрактний клас RaceStrategy');
  print('   - Це буде "шаблон" для всіх стратегій гонки');
  print('   - Абстрактні методи: executeStrategy(), getStrategyName()');
  print('   - Конкретні методи: prepareStrategy(), validateStrategy()');
  print('   - Приклад:');
  print('     abstract class RaceStrategy {');
  print('       String getStrategyName();');
  print('       void executeStrategy(Driver driver, String conditions);');
  print('       void prepareStrategy() { /* загальна логіка */ }');
  print('       bool validateStrategy() { /* перевірка */ }');
  print('     }');
  print('');

  print('КРОК 2: Створіть AggressiveStrategy (Агресивна стратегія)');
  print('   - Розширює RaceStrategy');
  print('   - Методи: pushHard(), takeRisks(), getAggressiveStats()');
  print('   - Логіка: максимальна швидкість, високий ризик');
  print('   - Приклад використання: Max Verstappen у Monaco');
  print('');

  print('КРОК 3: Створіть ConservativeStrategy (Консервативна стратегія)');
  print('   - Розширює RaceStrategy');
  print('   - Методи: saveTires(), manageFuel(), getConservativeStats()');
  print('   - Логіка: економія ресурсів, мінімальний ризик');
  print('   - Приклад використання: Lewis Hamilton у довгих гонках');
  print('');

  print('КРОК 4: Створіть AdaptiveStrategy (Адаптивна стратегія)');
  print('   - Розширює RaceStrategy');
  print(
    '   - Методи: analyzeConditions(), adjustTactics(), getAdaptiveStats()',
  );
  print('   - Логіка: зміна тактики залежно від умов');
  print('   - Приклад використання: Charles Leclerc у змінних умовах');
  print('');

  print('КРОК 5: Створіть RaceSimulator (Симулятор гонки)');
  print('   - Властивості: drivers, track, weather, lapCount');
  print('   - Методи: simulateLap(), calculateOvertaking(), determineDNF()');
  print('   - Логіка: симуляція гонки з різними стратегіями');
  print('');

  print('ПРИКЛАД ВИКОРИСТАННЯ:');
  print('''
  // Створюємо симулятор
  RaceSimulator simulator = RaceSimulator('Monaco', 'Dry', 78);
  
  // Створюємо пілотів
  Driver max = Driver('Max Verstappen', 'Red Bull', 1);
  Driver lewis = Driver('Lewis Hamilton', 'Mercedes', 44);
  Driver charles = Driver('Charles Leclerc', 'Ferrari', 16);
  
  // Додаємо пілотів з різними стратегіями
  simulator.addDriver(max, AggressiveStrategy());
  simulator.addDriver(lewis, ConservativeStrategy());
  simulator.addDriver(charles, AdaptiveStrategy());
  
  // Симулюємо гонку
  simulator.simulateRace();
  simulator.getRaceResults();
  ''');
  print('');

  print('💡 ПОРАДИ:');
  print('   - Використовуйте enum для погодних умов (Dry, Wet, Mixed)');
  print('   - Додайте випадковість для реалістичності');
  print('   - Розгляньте вплив стратегії на шанси DNF (Did Not Finish)');
  print('   - Додайте систему очок за позиції');
  print('');

  // TODO: Create abstract RaceStrategy class

  // TODO: Create concrete strategy classes

  // TODO: Create RaceSimulator class

  // TODO: Test your implementation
  // RaceSimulator simulator = RaceSimulator('Monaco', 'Dry', 78);
  // Driver max = Driver('Max Verstappen', 'Red Bull', 1);
  // Driver lewis = Driver('Lewis Hamilton', 'Mercedes', 44);
  // Driver charles = Driver('Charles Leclerc', 'Ferrari', 16);
  //
  // simulator.addDriver(max, AggressiveStrategy());
  // simulator.addDriver(lewis, ConservativeStrategy());
  // simulator.addDriver(charles, AdaptiveStrategy());
  //
  // simulator.simulateRace();
  // simulator.getRaceResults();

  print('');

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('lesson_06', 'task2');
  print('\n✅ Завдання 2 позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');
}

// =============================================================================
// TASK 3: Team Management and Development System
// =============================================================================

void task3() {
  print('TASK 3: Team Management and Development System');
  print('=' * 45);

  /*
  ЗАВДАННЯ:
  Створіть систему управління командою та розвитку з використанням наслідування.
  
  ЧОМУ ЦЕ ВАЖЛИВО:
  У Formula 1 команда - це не тільки пілоти, а й сотні інженерів, механіків, 
  менеджерів. Кожен має свою роль, але всі працюють разом. Наслідування 
  дозволяє створити загальну структуру для всіх членів команди.
  
  АНАЛОГІЯ:
  Уявіть школу. Є абстрактний клас "Учитель" з загальними властивостями 
  (ім'я, зарплата, робота). Від нього наслідуються: "Вчитель математики", 
  "Вчитель фізики", "Директор". Кожен має свої специфічні методи, але 
  всі є вчителями.
  
  ЩО ВИ СТВОРИТЕ:
  1. Абстрактний клас TeamMember - батьківський клас для всіх членів команди
  2. Конкретні класи: Engineer, Mechanic, Manager
  3. Клас TeamDevelopment для управління розвитком команди
  
  ПОКРОКОВІ ІНСТРУКЦІЇ:
  */

  print('📋 ДЕТАЛЬНІ ІНСТРУКЦІЇ:');
  print('');

  print('КРОК 1: Створіть абстрактний клас TeamMember');
  print('   - Це буде "батько" для всіх членів команди');
  print('   - Абстрактні методи: work(), getRole(), getSalary()');
  print('   - Конкретні методи: checkPerformance(), getTeamStatus()');
  print('   - Приклад:');
  print('     abstract class TeamMember {');
  print('       String name;');
  print('       String role;');
  print('       double salary;');
  print('       ');
  print('       abstract void work();');
  print('       abstract String getRole();');
  print('       abstract double getSalary();');
  print('       ');
  print('       void checkPerformance() { /* загальна логіка */ }');
  print('       String getTeamStatus() { /* статус команди */ }');
  print('     }');
  print('');

  print('КРОК 2: Створіть Engineer (Інженер)');
  print('   - Розширює TeamMember');
  print('   - Властивості: specialization, experience, projects');
  print('   - Методи: designComponent(), analyzeData(), getEngineeringStats()');
  print('   - Приклад: Adrian Newey - головний аеродинамік Red Bull');
  print('   - Логіка: створення нових компонентів, аналіз даних');
  print('');

  print('КРОК 3: Створіть Mechanic (Механік)');
  print('   - Розширює TeamMember');
  print('   - Властивості: skills, certifications, pitStopExperience');
  print('   - Методи: repairCar(), performPitStop(), getMechanicStats()');
  print('   - Приклад: механіки, які роблять піт-стопи за 2 секунди');
  print('   - Логіка: ремонт автомобіля, швидкі піт-стопи');
  print('');

  print('КРОК 4: Створіть Manager (Менеджер)');
  print('   - Розширює TeamMember');
  print('   - Властивості: department, teamSize, budget');
  print('   - Методи: manageTeam(), makeDecisions(), getManagementStats()');
  print('   - Приклад: Christian Horner - керуючий Red Bull Racing');
  print('   - Логіка: управління командою, прийняття рішень');
  print('');

  print('КРОК 5: Створіть TeamDevelopment (Розвиток команди)');
  print('   - Властивості: team, budget, researchPoints, upgrades');
  print(
    '   - Методи: investInResearch(), developUpgrade(), calculatePerformance()',
  );
  print('   - Логіка: інвестування в дослідження, розробка покращень');
  print('');

  print('ПРИКЛАД ВИКОРИСТАННЯ:');
  print('''
  // Створюємо команду
  Team redBull = Team('Red Bull Racing', 1000000000);
  TeamDevelopment development = TeamDevelopment(redBull, 50000000);
  
  // Створюємо членів команди
  Engineer adrian = Engineer('Adrian Newey', 'Aerodynamics', 30, ['RB19', 'RB20']);
  Mechanic john = Mechanic('John Smith', ['Engine', 'Transmission'], ['F1 Safety'], 150);
  Manager christian = Manager('Christian Horner', 'Operations', 850, 500000000);
  
  // Додаємо до команди
  development.addTeamMember(adrian);
  development.addTeamMember(john);
  development.addTeamMember(christian);
  
  // Розвиваємо команду
  development.investInResearch(10000000);
  development.developUpgrade('Aerodynamic Package');
  development.calculatePerformance();
  ''');
  print('');

  print('💡 ПОРАДИ:');
  print(
    '   - Використовуйте super() для виклику конструктора батьківського класу',
  );
  print('   - Додайте систему рівнів досвіду для кожного типу працівника');
  print('   - Розгляньте взаємодію між різними типами членів команди');
  print('   - Додайте систему бонусів за досягнення');
  print('');

  // TODO: Create abstract TeamMember class

  // TODO: Create concrete team member classes

  // TODO: Create TeamDevelopment class

  // TODO: Test your implementation
  // Team redBull = Team('Red Bull Racing', 1000000000);
  // TeamDevelopment development = TeamDevelopment(redBull, 50000000);
  //
  // Engineer adrian = Engineer('Adrian Newey', 'Aerodynamics', 30, ['RB19', 'RB20']);
  // Mechanic john = Mechanic('John Smith', ['Engine', 'Transmission'], ['F1 Safety'], 150);
  // Manager christian = Manager('Christian Horner', 'Operations', 850, 500000000);
  //
  // development.addTeamMember(adrian);
  // development.addTeamMember(john);
  // development.addTeamMember(christian);
  //
  // development.investInResearch(10000000);
  // development.developUpgrade('Aerodynamic Package');
  // development.calculatePerformance();

  print('');

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('lesson_06', 'task3');
  print('\n✅ Завдання 3 позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');
}

// =============================================================================
// TASK 4: Championship Points and Scoring System
// =============================================================================

void task4() {
  print('TASK 4: Championship Points and Scoring System');
  print('=' * 45);

  /*
  ЗАВДАННЯ:
  Створіть комплексну систему очок та підрахунку балів для чемпіонату.
  
  ЧОМУ ЦЕ ВАЖЛИВО:
  У Formula 1 існує складна система нарахування очок. 1-е місце дає 25 очок, 
  2-е - 18, і так далі. Також є бонуси за найшвидший круг, спринт-гонки. 
  Абстракція дозволяє легко змінювати правила підрахунку.
  
  АНАЛОГІЯ:
  Уявіть різні школи з різними системами оцінювання. В одній школі максимум 
  100 балів, в іншій - 12-бальна система, в третій - літерна система (A, B, C). 
  Але всі вони мають спільну структуру - спосіб підрахунку очок.
  
  ЩО ВИ СТВОРИТЕ:
  1. Абстрактний клас ScoringSystem - "шаблон" для систем підрахунку
  2. Конкретні системи: F1ScoringSystem, AlternativeScoringSystem
  3. Клас ChampionshipStandings для управління турнірною таблицею
  
  ПОКРОКОВІ ІНСТРУКЦІЇ:
  */

  print('📋 ДЕТАЛЬНІ ІНСТРУКЦІЇ:');
  print('');

  print('КРОК 1: Створіть абстрактний клас ScoringSystem');
  print('   - Це буде "шаблон" для всіх систем підрахунку очок');
  print('   - Абстрактні методи: calculatePoints(), getScoringRules()');
  print('   - Конкретні методи: validateResult(), applyPenalties()');
  print('   - Приклад:');
  print('     abstract class ScoringSystem {');
  print('       abstract int calculatePoints(int position);');
  print('       abstract String getScoringRules();');
  print('       ');
  print('       bool validateResult(int position) {');
  print('         return position >= 1 && position <= 20;');
  print('       }');
  print('       ');
  print('       int applyPenalties(int points, List<String> penalties) {');
  print('         // логіка штрафів');
  print('         return points;');
  print('       }');
  print('     }');
  print('');

  print('КРОК 2: Створіть F1ScoringSystem (Система F1)');
  print('   - Розширює ScoringSystem');
  print('   - Властивості: pointsTable, sprintPoints, fastestLap');
  print(
    '   - Методи: calculateF1Points(), handleSprintRace(), awardFastestLap()',
  );
  print('   - Правила F1: 1-е = 25, 2-е = 18, 3-є = 15, 4-е = 12, 5-е = 10...');
  print('   - Бонус за найшвидший круг: +1 очко (якщо в топ-10)');
  print('');

  print('КРОК 3: Створіть AlternativeScoringSystem (Альтернативна система)');
  print('   - Розширює ScoringSystem');
  print('   - Властивості: alternativePoints, bonusPoints, multipliers');
  print(
    '   - Методи: calculateAlternativePoints(), applyBonus(), applyMultiplier()',
  );
  print('   - Приклад: система 10-6-4-3-2-1 або система з множниками');
  print('   - Можна додати бонуси за обгін, найкращий старт');
  print('');

  print('КРОК 4: Створіть ChampionshipStandings (Турнірна таблиця)');
  print('   - Властивості: drivers, teams, points, positions');
  print('   - Методи: updateStandings(), calculatePositions(), getLeader()');
  print('   - Логіка: підрахунок позицій, обробка нічиїх, штрафи');
  print('');

  print('ПРИКЛАД ВИКОРИСТАННЯ:');
  print('''
  // Створюємо системи підрахунку
  F1ScoringSystem f1Scoring = F1ScoringSystem();
  AlternativeScoringSystem altScoring = AlternativeScoringSystem();
  ChampionshipStandings standings = ChampionshipStandings();
  
  // Створюємо пілотів
  Driver max = Driver('Max Verstappen', 'Red Bull', 1);
  Driver lewis = Driver('Lewis Hamilton', 'Mercedes', 44);
  Driver charles = Driver('Charles Leclerc', 'Ferrari', 16);
  
  // Додаємо до турнірної таблиці
  standings.addDriver(max);
  standings.addDriver(lewis);
  standings.addDriver(charles);
  
  // Оновлюємо результати
  standings.updateStandings(max, 1, f1Scoring);  // 25 очок
  standings.updateStandings(lewis, 2, f1Scoring); // 18 очок
  standings.updateStandings(charles, 3, f1Scoring); // 15 очок
  
  // Підраховуємо позиції
  standings.calculatePositions();
  print('Лідер: \${standings.getLeader()}');
  standings.displayStandings();
  ''');
  print('');

  print('💡 ПОРАДИ:');
  print('   - Використовуйте Map для таблиці очок: {1: 25, 2: 18, 3: 15...}');
  print(
    '   - Додайте обробку нічиїх (за кількістю перемог, потім за 2-ми місцями)',
  );
  print(
    '   - Розгляньте штрафи (time penalty, grid penalty, disqualification)',
  );
  print('   - Додайте історію результатів для кожного пілота');
  print('');

  // TODO: Create abstract ScoringSystem class

  // TODO: Create concrete scoring system classes

  // TODO: Create ChampionshipStandings class

  // TODO: Test your implementation
  // F1ScoringSystem f1Scoring = F1ScoringSystem();
  // AlternativeScoringSystem altScoring = AlternativeScoringSystem();
  // ChampionshipStandings standings = ChampionshipStandings();
  //
  // Driver max = Driver('Max Verstappen', 'Red Bull', 1);
  // Driver lewis = Driver('Lewis Hamilton', 'Mercedes', 44);
  // Driver charles = Driver('Charles Leclerc', 'Ferrari', 16);
  //
  // standings.addDriver(max);
  // standings.addDriver(lewis);
  // standings.addDriver(charles);
  //
  // standings.updateStandings(max, 1, f1Scoring);
  // standings.updateStandings(lewis, 2, f1Scoring);
  // standings.updateStandings(charles, 3, f1Scoring);
  //
  // standings.calculatePositions();
  // print('Leader: ${standings.getLeader()}');
  // standings.displayStandings();

  print('');

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('lesson_06', 'task4');
  print('\n✅ Завдання 4 позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');
}

// =============================================================================
// TASK 5: Advanced - Complete Championship Simulator Integration
// =============================================================================

void task5() {
  print('TASK 5: Advanced Complete Championship Simulator');
  print('=' * 45);

  /*
  ЗАВДАННЯ:
  Інтегруйте всі компоненти в повноцінний симулятор чемпіонату.
  
  ЧОМУ ЦЕ ВАЖЛИВО:
  Це фінальне завдання, яке об'єднує всі принципи ООП. Ви створите 
  складну систему, де різні компоненти взаємодіють між собою. Це 
  показує, як абстракція, наслідування, поліморфізм та інкапсуляція 
  працюють разом у реальному проекті.
  
  АНАЛОГІЯ:
  Уявіть, що ви будуєте місто. У вас є різні будівлі (класи), які 
  мають спільні характеристики (наслідування), але кожна має своє 
  призначення (поліморфізм). Між будівлями є зв'язки (події), а 
  статистика показує, як місто розвивається. Все працює разом 
  як єдина система.
  
  ЩО ВИ СТВОРИТЕ:
  1. ChampionshipSimulator - головний клас, який керує всім
  2. EventManager - система подій для взаємодії між компонентами
  3. StatisticsTracker - відстеження статистики та аналітика
  
  ПОКРОКОВІ ІНСТРУКЦІЇ:
  */

  print('📋 ДЕТАЛЬНІ ІНСТРУКЦІЇ:');
  print('');

  print('КРОК 1: Створіть ChampionshipSimulator (Головний симулятор)');
  print('   - Це буде "мозок" всього чемпіонату');
  print(
    '   - Властивості: championship, raceSimulator, teamDevelopment, standings',
  );
  print(
    '   - Методи: initializeSeason(), simulateRace(), updateDevelopment(), generateReport()',
  );
  print('   - Логіка: координація всіх компонентів, управління сезоном');
  print('   - Приклад:');
  print('     class ChampionshipSimulator {');
  print('       int season;');
  print('       List<Team> teams;');
  print('       RaceSimulator raceSimulator;');
  print('       TeamDevelopment teamDevelopment;');
  print('       ChampionshipStandings standings;');
  print('       ');
  print('       void initializeSeason() { /* налаштування сезону */ }');
  print('       void simulateRace() { /* симуляція гонки */ }');
  print('       void generateReport() { /* звіт */ }');
  print('     }');
  print('');

  print('КРОК 2: Створіть EventManager (Менеджер подій)');
  print('   - Це буде "система сповіщень" між компонентами');
  print('   - Властивості: events, eventTypes, eventHandlers');
  print('   - Методи: addEvent(), triggerEvent(), handleEvent()');
  print('   - Логіка: події як "гонка закінчена", "пілот дискваліфікований"');
  print(
    '   - Приклад подій: RaceFinished, DriverDNF, TeamUpgrade, PenaltyApplied',
  );
  print('');

  print('КРОК 3: Створіть StatisticsTracker (Відстеження статистики)');
  print('   - Це буде "аналітик" чемпіонату');
  print('   - Властивості: statistics, records, trends');
  print(
    '   - Методи: trackStatistic(), updateRecord(), analyzeTrends(), generateReport()',
  );
  print('   - Логіка: збір даних, аналіз трендів, рекорди');
  print('   - Приклад статистики: найшвидші круги, найкращі старти, DNF');
  print('');

  print('ПРИКЛАД ВИКОРИСТАННЯ:');
  print('''
  // Створюємо головні компоненти
  ChampionshipSimulator simulator = ChampionshipSimulator(2024);
  EventManager eventManager = EventManager();
  StatisticsTracker statsTracker = StatisticsTracker();
  
  // Налаштовуємо симулятор
  simulator.initializeSeason();
  simulator.addEventManager(eventManager);
  simulator.addStatisticsTracker(statsTracker);
  
  // Додаємо команди та пілотів
  Team redBull = Team('Red Bull Racing', 1000000000);
  Driver max = Driver('Max Verstappen', 'Red Bull Racing', 1);
  redBull.addDriver(max);
  simulator.addTeam(redBull);
  
  // Симулюємо сезон
  simulator.simulateSeason();
  simulator.generateReport();
  statsTracker.generateReport();
  ''');
  print('');

  print('💡 ПОРАДИ:');
  print(
    '   - Використовуйте enum для типів подій (RaceEvent, TeamEvent, DriverEvent)',
  );
  print('   - Додайте систему логування для відстеження подій');
  print('   - Розгляньте збереження/завантаження стану симуляції');
  print('   - Додайте конфігураційні файли для налаштування');
  print('   - Створіть графічний інтерфейс для візуалізації результатів');
  print('');

  // TODO: Create ChampionshipSimulator class

  // TODO: Create EventManager class

  // TODO: Create StatisticsTracker class

  // TODO: Test your implementation
  // ChampionshipSimulator simulator = ChampionshipSimulator(2024);
  // EventManager eventManager = EventManager();
  // StatisticsTracker statsTracker = StatisticsTracker();
  //
  // simulator.initializeSeason();
  // simulator.addEventManager(eventManager);
  // simulator.addStatisticsTracker(statsTracker);
  //
  // // Add teams and drivers
  // Team redBull = Team('Red Bull Racing', 1000000000);
  // Driver max = Driver('Max Verstappen', 'Red Bull Racing', 1);
  // redBull.addDriver(max);
  // simulator.addTeam(redBull);
  //
  // // Simulate season
  // simulator.simulateSeason();
  // simulator.generateReport();
  // statsTracker.generateReport();

  print('');

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('lesson_06', 'task5');
  print('\n✅ Завдання 5 позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');
}
