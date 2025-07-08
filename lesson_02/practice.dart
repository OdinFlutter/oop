import '../progress.dart';

// УРОК 2: Практика — Інкапсуляція
// Виконуйте завдання поступово, розкоментовуючи taskX() по черзі
// Запуск: dart practice.dart

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
// ЗАВДАННЯ 1: Безпечний профіль пілота (DriverProfile)
// =============================================================================

void task1() {
  print('ЗАВДАННЯ 1: Безпечний профіль пілота (DriverProfile)');
  print('=' * 40);

  /*
  🔎 Що таке інкапсуляція?
  Інкапсуляція — це принцип ООП, який об'єднує дані та методи, які працюють з цими даними, в одному класі. Приватні поля (_fieldName) захищають дані від прямого доступу ззовні.

  🏁 Навіщо це потрібно?
  Це забезпечує безпеку даних, контролює доступ до властивостей та дозволяє додавати валідацію при зміні значень.

  ✅ Що треба зробити:
  1. Створи клас DriverProfile з приватними полями:
     - _driverNumber (int): номер пілота
     - _points (int): бали чемпіонату
     - _salary (double): річна зарплата
     - _contractYears (int): роки контракту

  2. Публічні поля:
     - name (String): ім'я пілота
     - team (String): поточна команда

  3. Вимоги:
     - Конструктор приймає name, team, driverNumber, contractYears
     - points і salary починають з 0
     - Створи геттери для всіх приватних полів
     - Створи сеттер для salary з валідацією (має бути > 0 і < 100M)
     - Метод addPoints(int points) для додавання балів
     - Метод renewContract(int years) для продовження контракту

  🧩 Пояснення:
  - Приватні поля (_fieldName) не можна змінювати напряму ззовні класу
  - Геттери (get) дозволяють читати приватні поля
  - Сеттери (set) дозволяють змінювати приватні поля з валідацією

  💡 Підказка:
  Для приватного поля використовуй _ перед назвою: _salary
  Для геттера: double get salary => _salary;
  Для сеттера: set salary(double value) { if (value > 0 && value < 100000000) _salary = value; }

  🔨 Покроковий приклад:

    class DriverProfile {
      // Публічні поля
      String name;
      String team;
      
      // Приватні поля (захищені)
      int _driverNumber;
      int _points;
      double _salary;
      int _contractYears;

      // Конструктор
      DriverProfile(this.name, this.team, this._driverNumber, this._contractYears) {
        _points = 0; // Початкові бали
        _salary = 0; // Початкова зарплата
      }

      // Геттери для доступу до приватних полів
      int get driverNumber => _driverNumber;
      int get points => _points;
      double get salary => _salary;
      int get contractYears => _contractYears;

      // Сеттер з валідацією
      set salary(double value) {
        if (value > 0 && value < 100000000) {
          _salary = value;
        } else {
          print('Помилка: зарплата має бути між 0 та 100M');
        }
      }

      // Методи для роботи з даними
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

      void displayProfile() {
        print('Пілот: $name, Команда: $team');
        print('Номер: $_driverNumber, Бали: $_points');
        print('Зарплата: $_salary, Контракт: $_contractYears років');
      }
    }

    void main() {
      DriverProfile max = DriverProfile('Макс Ферстаппен', 'Red Bull', 1, 3);
      max.addPoints(25);
      max.salary = 50000000; // 50M - працює
      max.salary = 150000000; // 150M - помилка
      max.displayProfile();
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свій клас та протестуй його

  print('');

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('lesson_02', 'task1');
  print('\n✅ Завдання 1 позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');}

// =============================================================================
// ЗАВДАННЯ 2: Безпечна система телеметрії автомобіля (CarTelemetry)
// =============================================================================

void task2() {
  print('ЗАВДАННЯ 2: Безпечна система телеметрії автомобіля (CarTelemetry)');
  print('=' * 50);

  /*
  🔎 Що таке телеметрія?
  Телеметрія — це система моніторингу параметрів автомобіля в реальному часі (швидкість, оберти двигуна, температура шин тощо).

  🏁 Навіщо це потрібно?
  Це дозволяє контролювати безпечні межі параметрів автомобіля та попереджати про небезпечні ситуації.

  ✅ Що треба зробити:
  1. Створи клас CarTelemetry з приватними полями:
     - _speed (double): поточна швидкість
     - _rpm (int): оберти двигуна
     - _fuelLevel (double): відсоток пального (0-100)
     - _tyreTemperature (double): середня температура шин

  2. Публічне поле:
     - carNumber (int): номер автомобіля

  3. Вимоги:
     - Конструктор приймає тільки carNumber, всі приватні поля починають з 0
     - Геттери для всіх приватних полів
     - Сеттери з валідацією:
       - speed: 0-370 км/год
       - rpm: 0-15000
       - fuelLevel: 0-100%
       - tyreTemperature: 0-150°C
     - Обчислювана властивість 'status' повертає: 'Normal', 'Warning', або 'Critical'
     - Метод resetTelemetry() для скидання всіх значень до безпечних

  🧩 Пояснення:
  - Валідація в сеттерах забезпечує безпеку автомобіля
  - Обчислювана властивість status автоматично визначає стан системи

  💡 Підказка:
  Для статусу перевіряй, чи будь-який параметр знаходиться в небезпечній зоні.

  🔨 Покроковий приклад:

    class CarTelemetry {
      int carNumber;
      
      // Приватні поля
      double _speed = 0;
      int _rpm = 0;
      double _fuelLevel = 0;
      double _tyreTemperature = 0;

      CarTelemetry(this.carNumber);

      // Геттери
      double get speed => _speed;
      int get rpm => _rpm;
      double get fuelLevel => _fuelLevel;
      double get tyreTemperature => _tyreTemperature;

      // Сеттери з валідацією
      set speed(double value) {
        if (value >= 0 && value <= 370) {
          _speed = value;
        } else {
          print('Помилка: швидкість має бути між 0 та 370 км/год');
        }
      }

      set rpm(int value) {
        if (value >= 0 && value <= 15000) {
          _rpm = value;
        } else {
          print('Помилка: оберти мають бути між 0 та 15000');
        }
      }

      set fuelLevel(double value) {
        if (value >= 0 && value <= 100) {
          _fuelLevel = value;
        } else {
          print('Помилка: рівень пального має бути між 0 та 100%');
        }
      }

      set tyreTemperature(double value) {
        if (value >= 0 && value <= 150) {
          _tyreTemperature = value;
        } else {
          print('Помилка: температура шин має бути між 0 та 150°C');
        }
      }

      // Обчислювана властивість статусу
      String get status {
        if (_speed > 350 || _rpm > 14000 || _fuelLevel < 5 || _tyreTemperature > 140) {
          return 'Critical';
        } else if (_speed > 300 || _rpm > 12000 || _fuelLevel < 15 || _tyreTemperature > 120) {
          return 'Warning';
        } else {
          return 'Normal';
        }
      }

      void resetTelemetry() {
        _speed = 0;
        _rpm = 0;
        _fuelLevel = 100;
        _tyreTemperature = 80;
      }

      void displayTelemetry() {
        print('Автомобіль #$carNumber:');
        print('Швидкість: ${_speed} км/год, Оберти: $_rpm');
        print('Пальне: ${_fuelLevel}%, Температура шин: ${_tyreTemperature}°C');
        print('Статус: $status');
      }
    }

    void main() {
      CarTelemetry car1 = CarTelemetry(1);
      car1.speed = 200;
      car1.rpm = 12000;
      car1.fuelLevel = 15;
      car1.tyreTemperature = 120;
      car1.displayTelemetry();
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свій клас та протестуй його

  print('');

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('lesson_02', 'task2');
  print('\n✅ Завдання 2 позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');}

// =============================================================================
// ЗАВДАННЯ 3: Менеджер балів чемпіонату (ChampionshipManager)
// =============================================================================

void task3() {
  print('ЗАВДАННЯ 3: Менеджер балів чемпіонату (ChampionshipManager)');
  print('=' * 45);

  /*
  🔎 Що таке менеджер чемпіонату?
  Це система, яка відстежує бали всіх пілотів, управляє раундами чемпіонату та визначає лідерів.

  🏁 Навіщо це потрібно?
  Це дозволяє автоматично рахувати позиції, визначати лідерів та керувати ходом чемпіонату.

  ✅ Що треба зробити:
  1. Створи клас ChampionshipManager з приватними полями:
     - _drivers (Map<String, int>): ім'я пілота -> бали
     - _maxRounds (int): загальна кількість раундів
     - _currentRound (int): поточний раунд

  2. Вимоги:
     - Конструктор приймає maxRounds (має бути > 0)
     - Геттери для currentRound, maxRounds
     - Метод addDriver(String name) для додавання пілота з 0 балами
     - Метод addRaceResult(String driverName, int position) для нарахування балів:
       1-ше: 25, 2-ге: 18, 3-тє: 15, 4-те: 12, 5-те: 10,
       6-те: 8, 7-ме: 6, 8-ме: 4, 9-те: 2, 10-те: 1, інші: 0
     - Метод nextRound() для переходу до наступного раунду
     - Геттер 'leader' повертає ім'я лідера чемпіонату
     - Геттер 'standings' повертає відсортований список пілотів за балами
     - Метод getDriverPoints(String name) повертає бали конкретного пілота

  🧩 Пояснення:
  - Map<String, int> зберігає пари "ім'я пілота - бали"
  - Сортування дозволяє визначити позиції в чемпіонаті

  💡 Підказка:
  Для сортування використовуй entries.toList() та sort().

  🔨 Покроковий приклад:

    class ChampionshipManager {
      Map<String, int> _drivers = {};
      int _maxRounds;
      int _currentRound = 0;

      ChampionshipManager(this._maxRounds) {
        if (_maxRounds <= 0) {
          throw ArgumentError('Кількість раундів має бути більше 0');
        }
      }

      // Геттери
      int get currentRound => _currentRound;
      int get maxRounds => _maxRounds;

      void addDriver(String name) {
        if (!_drivers.containsKey(name)) {
          _drivers[name] = 0;
        }
      }

      void addRaceResult(String driverName, int position) {
        if (!_drivers.containsKey(driverName)) {
          addDriver(driverName);
        }

        int points = 0;
        switch (position) {
          case 1: points = 25; break;
          case 2: points = 18; break;
          case 3: points = 15; break;
          case 4: points = 12; break;
          case 5: points = 10; break;
          case 6: points = 8; break;
          case 7: points = 6; break;
          case 8: points = 4; break;
          case 9: points = 2; break;
          case 10: points = 1; break;
          default: points = 0;
        }

        _drivers[driverName] = (_drivers[driverName] ?? 0) + points;
      }

      void nextRound() {
        if (_currentRound < _maxRounds) {
          _currentRound++;
        }
      }

      String? get leader {
        if (_drivers.isEmpty) return null;
        
        String leaderName = _drivers.keys.first;
        int maxPoints = _drivers[leaderName]!;
        
        for (var entry in _drivers.entries) {
          if (entry.value > maxPoints) {
            maxPoints = entry.value;
            leaderName = entry.key;
          }
        }
        
        return leaderName;
      }

      List<MapEntry<String, int>> get standings {
        var entries = _drivers.entries.toList();
        entries.sort((a, b) => b.value.compareTo(a.value));
        return entries;
      }

      int getDriverPoints(String name) {
        return _drivers[name] ?? 0;
      }

      void displayStandings() {
        print('Позиції в чемпіонаті (раунд $_currentRound/$_maxRounds):');
        for (int i = 0; i < standings.length; i++) {
          var entry = standings[i];
          print('${i + 1}. ${entry.key} - ${entry.value} балів');
        }
        print('Лідер: ${leader ?? "Немає"}');
      }
    }

    void main() {
      ChampionshipManager championship = ChampionshipManager(23);
      championship.addDriver('Макс Ферстаппен');
      championship.addDriver('Льюїс Хемілтон');
      championship.addDriver('Шарль Леклер');

      championship.addRaceResult('Макс Ферстаппен', 1);
      championship.addRaceResult('Льюїс Хемілтон', 2);
      championship.addRaceResult('Шарль Леклер', 3);

      championship.displayStandings();
      championship.nextRound();
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свій клас та протестуй його

  print('');

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('lesson_02', 'task3');
  print('\n✅ Завдання 3 позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');}

// =============================================================================
// ЗАВДАННЯ 4: Безпечна система радіо команди (TeamRadio)
// =============================================================================

void task4() {
  print('ЗАВДАННЯ 4: Безпечна система радіо команди (TeamRadio)');
  print('=' * 45);

  /*
  🔎 Що таке система радіо команди?
  Це система зв'язку між пілотом та командою, яка дозволяє передавати повідомлення, шифрувати їх та зберігати історію.

  🏁 Навіщо це потрібно?
  Це забезпечує безпечний зв'язок, дозволяє шифрувати важливі повідомлення та зберігає історію комунікації.

  ✅ Що треба зробити:
  1. Створи клас TeamRadio з приватними полями:
     - _messages (List<String>): збережені радіо повідомлення
     - _isEncrypted (bool): чи зашифровані повідомлення
     - _frequency (double): частота радіо
     - _maxMessages (int): максимальна кількість збережених повідомлень

  2. Публічне поле:
     - teamName (String): назва команди

  3. Вимоги:
     - Конструктор приймає teamName, frequency, maxMessages
     - isEncrypted починає як false
     - Геттери для frequency, messageCount, isEncrypted
     - Сеттер для frequency (88.0-108.0 МГц тільки)
     - Метод sendMessage(String message) додає повідомлення до списку
     - Метод enableEncryption() / disableEncryption()
     - Метод getLastMessage() повертає останнє повідомлення або 'No messages'
     - Метод clearMessages() видаляє всі повідомлення
     - Приватний метод _encryptMessage(String msg) повертає 'ENCRYPTED: ' + msg

  🧩 Пояснення:
  - Приватний метод _encryptMessage використовується тільки всередині класу
  - Список повідомлень має обмежену довжину

  💡 Підказка:
  Якщо список повідомлень повний, видали найстаріше повідомлення перед додаванням нового.

  🔨 Покроковий приклад:

    class TeamRadio {
      String teamName;
      
      List<String> _messages = [];
      bool _isEncrypted = false;
      double _frequency;
      int _maxMessages;

      TeamRadio(this.teamName, this._frequency, this._maxMessages) {
        if (_frequency < 88.0 || _frequency > 108.0) {
          throw ArgumentError('Частота має бути між 88.0 та 108.0 МГц');
        }
      }

      // Геттери
      double get frequency => _frequency;
      int get messageCount => _messages.length;
      bool get isEncrypted => _isEncrypted;

      // Сеттер для частоти
      set frequency(double value) {
        if (value >= 88.0 && value <= 108.0) {
          _frequency = value;
        } else {
          print('Помилка: частота має бути між 88.0 та 108.0 МГц');
        }
      }

      void sendMessage(String message) {
        String finalMessage = _isEncrypted ? _encryptMessage(message) : message;
        
        _messages.add(finalMessage);
        
        // Якщо список повний, видали найстаріше повідомлення
        if (_messages.length > _maxMessages) {
          _messages.removeAt(0);
        }
      }

      void enableEncryption() {
        _isEncrypted = true;
        print('Шифрування увімкнено');
      }

      void disableEncryption() {
        _isEncrypted = false;
        print('Шифрування вимкнено');
      }

      String getLastMessage() {
        if (_messages.isEmpty) {
          return 'No messages';
        }
        return _messages.last;
      }

      void clearMessages() {
        _messages.clear();
        print('Всі повідомлення видалено');
      }

      // Приватний метод для шифрування
      String _encryptMessage(String msg) {
        return 'ENCRYPTED: $msg';
      }

      void displayRadioInfo() {
        print('Радіо команди: $teamName');
        print('Частота: ${_frequency} МГц');
        print('Шифрування: ${_isEncrypted ? "Увімкнено" : "Вимкнено"}');
        print('Повідомлень: ${_messages.length}/$_maxMessages');
        if (_messages.isNotEmpty) {
          print('Останнє повідомлення: ${getLastMessage()}');
        }
      }
    }

    void main() {
      TeamRadio radio = TeamRadio('Ferrari', 95.5, 5);
      radio.sendMessage('Вікно піт-стопу відкривається');
      radio.enableEncryption();
      radio.sendMessage('Зміна стратегії');
      radio.displayRadioInfo();
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свій клас та протестуй його

  print('');

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('lesson_02', 'task4');
  print('\n✅ Завдання 4 позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');}

// =============================================================================
// ЗАВДАННЯ 5: Просунутий таймер піт-стопу з валідацією (PitStopTimer)
// =============================================================================

void task5() {
  print('ЗАВДАННЯ 5: Просунутий таймер піт-стопу з валідацією (PitStopTimer)');
  print('=' * 55);

  /*
  🔎 Що таке таймер піт-стопу?
  Це система, яка відстежує час піт-стопу, кількість членів команди та виконання завдань для визначення валідності зупинки.

  🏁 Навіщо це потрібно?
  Це дозволяє контролювати якість піт-стопів, забезпечувати безпеку та аналізувати ефективність команди.

  ✅ Що треба зробити:
  1. Створи клас PitStopTimer з приватними полями:
     - _startTime (DateTime?): коли піт-стоп почався
     - _endTime (DateTime?): коли піт-стоп закінчився
     - _minCrewMembers (int): мінімум команди для валідної зупинки
     - _currentCrewMembers (int): поточна кількість команди
     - _tasks (Map<String, bool>): статус виконання завдань піт-стопу

  2. Вимоги:
     - Конструктор приймає minCrewMembers (за замовчуванням 12)
     - Ініціалізуй _tasks з: 'Front tyres', 'Rear tyres', 'Fuel', 'Adjustments'
     - Геттер isInProgress повертає true, якщо почався, але не закінчився
     - Геттер duration повертає Duration? піт-стопу (null, якщо не завершено)
     - Геттер isValidStop повертає true, якщо команда >= мінімуму і всі завдання виконані
     - Метод startPitStop(int crewMembers) починає таймер
     - Метод completeTask(String taskName) позначає завдання як виконане
     - Метод endPitStop() зупиняє таймер і повертає тривалість
     - Метод reset() очищає всі дані для нового піт-стопу
     - Обчислювана властивість 'status' повертає детальний статус

  🧩 Пояснення:
  - DateTime? означає, що час може бути null (якщо піт-стоп ще не почався)
  - Map<String, bool> зберігає пари "назва завдання - виконано/ні"

  💡 Підказка:
  Для обчислення тривалості використовуй endTime.difference(startTime).

  🔨 Покроковий приклад:

    class PitStopTimer {
      DateTime? _startTime;
      DateTime? _endTime;
      int _minCrewMembers;
      int _currentCrewMembers = 0;
      Map<String, bool> _tasks = {};

      PitStopTimer([this._minCrewMembers = 12]) {
        // Ініціалізація завдань
        _tasks['Front tyres'] = false;
        _tasks['Rear tyres'] = false;
        _tasks['Fuel'] = false;
        _tasks['Adjustments'] = false;
      }

      // Геттери
      bool get isInProgress => _startTime != null && _endTime == null;
      Duration? get duration {
        if (_startTime != null && _endTime != null) {
          return _endTime!.difference(_startTime!);
        }
        return null;
      }

      bool get isValidStop {
        bool crewValid = _currentCrewMembers >= _minCrewMembers;
        bool tasksValid = _tasks.values.every((task) => task);
        return crewValid && tasksValid;
      }

      void startPitStop(int crewMembers) {
        if (isInProgress) {
          print('Піт-стоп вже почався!');
          return;
        }
        
        _startTime = DateTime.now();
        _currentCrewMembers = crewMembers;
        print('Піт-стоп почався з $crewMembers членами команди');
      }

      void completeTask(String taskName) {
        if (!isInProgress) {
          print('Піт-стоп не почався!');
          return;
        }

        if (_tasks.containsKey(taskName)) {
          _tasks[taskName] = true;
          print('Завдання "$taskName" виконано');
        } else {
          print('Невідоме завдання: $taskName');
        }
      }

      Duration? endPitStop() {
        if (!isInProgress) {
          print('Піт-стоп не почався!');
          return null;
        }

        _endTime = DateTime.now();
        var duration = this.duration;
        
        print('Піт-стоп завершено за ${duration?.inMilliseconds} мс');
        print('Валідна зупинка: ${isValidStop ? "Так" : "Ні"}');
        
        return duration;
      }

      void reset() {
        _startTime = null;
        _endTime = null;
        _currentCrewMembers = 0;
        _tasks.forEach((key, value) => _tasks[key] = false);
        print('Таймер скинуто');
      }

      String get status {
        if (!isInProgress && _startTime == null) {
          return 'Готовий до піт-стопу';
        } else if (isInProgress) {
          var completedTasks = _tasks.values.where((task) => task).length;
          var totalTasks = _tasks.length;
          return 'Піт-стоп в процесі: $completedTasks/$totalTasks завдань виконано';
        } else {
          return 'Піт-стоп завершено. Валідна зупинка: ${isValidStop ? "Так" : "Ні"}';
        }
      }

      void displayStatus() {
        print('Статус піт-стопу: $status');
        if (isInProgress) {
          print('Команда: $_currentCrewMembers/$_minCrewMembers мінімум');
          _tasks.forEach((task, completed) {
            print('  $task: ${completed ? "✓" : "✗"}');
          });
        }
      }
    }

    void main() async {
      PitStopTimer timer = PitStopTimer(14);
      timer.startPitStop(16);
      
      // Симуляція роботи
      await Future.delayed(Duration(milliseconds: 100));
      timer.completeTask('Front tyres');
      timer.completeTask('Rear tyres');
      timer.completeTask('Fuel');
      timer.completeTask('Adjustments');
      
      Duration? pitTime = timer.endPitStop();
      timer.displayStatus();
    }

  -----------------------------------------------------------------------------
  Якщо не зрозуміло — скопіюй цей приклад у solutions.dart і змінюй дані!
  */

  // Тут створи свій клас та протестуй його

  print('');

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('lesson_02', 'task5');
  print('\n✅ Завдання 5 позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');}

// =============================================================================
// ПІДКАЗКИ ДЛЯ НОВАЧКІВ
// =============================================================================

/*
ПІДКАЗКИ:

1. Приватні поля (_fieldName) захищають дані від прямого доступу
2. Геттери (get) дозволяють читати приватні поля
3. Сеттери (set) дозволяють змінювати приватні поля з валідацією
4. Обчислювані властивості (get) рахуються автоматично
5. Приватні методи (_methodName) використовуються тільки всередині класу

DART:
- Використовуй _ для приватних членів класу
- Геттери та сеттери можна оголошувати як властивості
- Map<String, bool> зручно для зберігання пар ключ-значення
- DateTime? означає nullable тип (може бути null)
*/
