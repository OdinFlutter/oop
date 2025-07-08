// 🏎️ УРОК 1: Приклади класів та об'єктів у Формулі 1
// Запустіть цей файл командою: dart examples.dart

void main() {
  print('🏁 Ласкаво просимо в світ Формули 1! 🏁\n');

  // =============================================================================
  // 📖 ПРИКЛАД 1: Простий клас Driver (Гонщик)
  // =============================================================================

  print('📖 ПРИКЛАД 1: Створюємо гонщиків');
  print('=' * 40);

  // Створюємо об'єкти гонщиків
  Driver max = Driver('Max Verstappen', 26, 'Netherlands');
  Driver lewis = Driver('Lewis Hamilton', 39, 'United Kingdom');

  // Виводимо інформацію про гонщиків
  max.displayInfo();
  lewis.displayInfo();

  // Гонщики виконують дії
  max.drive();
  lewis.overtake();

  print('\n');

  // =============================================================================
  // 📖 ПРИКЛАД 2: Клас з різними конструкторами
  // =============================================================================

  print('📖 ПРИКЛАД 2: Різні способи створення автомобілів');
  print('=' * 50);

  // Основний конструктор
  F1Car redBull = F1Car('RB19', 'Red Bull', 350);

  // Названий конструктор для тестового автомобіля
  F1Car testCar = F1Car.testCar('McLaren');

  // Названий конструктор для класичного автомобіля
  F1Car vintage = F1Car.vintage('Ferrari F2004', 'Ferrari');

  redBull.displaySpecs();
  testCar.displaySpecs();
  vintage.displaySpecs();

  print('\n');

  // =============================================================================
  // 📖 ПРИКЛАД 3: Взаємодія об'єктів
  // =============================================================================

  print('📖 ПРИКЛАД 3: Гонщик сідає в автомобіль');
  print('=' * 40);

  // Створюємо гонщика та автомобіль
  Driver charles = Driver('Charles Leclerc', 26, 'Monaco');
  F1Car ferrari = F1Car('SF-23', 'Ferrari', 340);

  // Гонщик сідає в автомобіль
  charles.drive();
  ferrari.accelerate();
  ferrari.brake();

  print('\n🏆 Кінець прикладів! Тепер спробуйте practice.dart');
}

// =============================================================================
// 🏎️ КЛАС DRIVER (ГОНЩИК)
// =============================================================================

class Driver {
  // Властивості (поля) класу
  String name; // Ім'я гонщика
  int age; // Вік гонщика
  String country; // Країна гонщика
  int points; // Очки в чемпіонаті

  // Основний конструктор
  Driver(this.name, this.age, this.country) : points = 0;

  // Названий конструктор для легенд (автоматично 40 років)
  Driver.legend(this.name, this.country) : age = 40, points = 0;

  // Метод для відображення інформації про гонщика
  void displayInfo() {
    print('👤 Гонщик: $name');
    print('   Вік: $age років');
    print('   Країна: $country');
    print('   Очки: $points');
    print('');
  }

  // Метод для їзди
  void drive() {
    print('🏎️  $name їде по трасі з великою швидкістю!');
  }

  // Метод для обгону
  void overtake() {
    print('⚡ $name здійснює блискучий обгін!');
  }

  // Метод для додавання очок
  void addPoints(int racePoints) {
    points += racePoints;
    print('🏆 $name отримав $racePoints очок! Загалом: $points');
  }
}

// =============================================================================
// 🏎️ КЛАС F1CAR (АВТОМОБІЛЬ ФОРМУЛИ 1)
// =============================================================================

class F1Car {
  // Властивості автомобіля
  String model; // Модель автомобіля
  String team; // Команда
  int maxSpeed; // Максимальна швидкість (км/год)
  int currentSpeed; // Поточна швидкість
  bool isEngineOn; // Чи запущений двигун

  // Основний конструктор
  F1Car(this.model, this.team, this.maxSpeed)
    : currentSpeed = 0,
      isEngineOn = false;

  // Названий конструктор для тестового автомобіля
  F1Car.testCar(this.team)
    : model = 'Test Car',
      maxSpeed = 300,
      currentSpeed = 0,
      isEngineOn = false;

  // Названий конструктор для класичного автомобіля
  F1Car.vintage(this.model, this.team)
    : maxSpeed = 280,
      currentSpeed = 0,
      isEngineOn = false;

  // Метод для відображення характеристик
  void displaySpecs() {
    print('🏎️  Автомобіль: $model');
    print('   Команда: $team');
    print('   Макс. швидкість: $maxSpeed км/год');
    print('   Поточна швидкість: $currentSpeed км/год');
    print('   Двигун: ${isEngineOn ? "Запущений" : "Вимкнений"}');
    print('');
  }

  // Метод для запуску двигуна
  void startEngine() {
    isEngineOn = true;
    print('🔥 Двигун $model запущено! Готовий до гонки!');
  }

  // Метод для прискорення
  void accelerate() {
    if (!isEngineOn) {
      startEngine();
    }
    currentSpeed += 50;
    if (currentSpeed > maxSpeed) {
      currentSpeed = maxSpeed;
    }
    print('⚡ $model прискорюється! Швидкість: $currentSpeed км/год');
  }

  // Метод для гальмування
  void brake() {
    currentSpeed -= 30;
    if (currentSpeed < 0) {
      currentSpeed = 0;
    }
    print('🛑 $model гальмує! Швидкість: $currentSpeed км/год');
  }
}
