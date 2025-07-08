// УРОК 5: Практика — Абстракція
// Виконуйте завдання поступово, розкоментовуючи taskX() по черзі
// Запуск: dart practice.dart

void main() {
  print('Практика — Урок 5: Абстракція\n');

  // Розкоментуйте потрібне завдання для виконання
  // task1();
  // task2();
  // task3();
  // task4();
  // task5();

  print('Всі завдання виконано! Перевірте solutions.dart для порівняння.');
}

// =============================================================================
// ЗАВДАННЯ 1: Абстрактна система гоночних стратегій
// =============================================================================

void task1() {
  print('ЗАВДАННЯ 1: Абстрактна система гоночних стратегій');
  print('=' * 40);

  /*
  🔎 Що таке абстракція?
  Абстракція — це виділення головного, суттєвого для задачі, і приховування деталей реалізації. В ООП це означає створення абстрактних класів і методів, які описують лише "що робити", а не "як саме".

  🏁 Навіщо це потрібно?
  Це дозволяє створювати універсальні інтерфейси для різних реалізацій, спрощує розширення коду та робить його зрозумілішим.

  ✅ Що треба зробити:
  1. Створи абстрактний клас RacingStrategy з абстрактними методами:
     - executeStrategy(): виконати стратегію
     - getStrategyName(): назва стратегії
     - Додай конкретні методи: prepareStrategy(), validateStrategy()

  2. Створи дочірні класи:
     - AggressiveStrategy: реалізуй методи, додай pushHard(), takeRisks(), getAggressiveStats()
     - ConservativeStrategy: реалізуй методи, додай saveTires(), manageFuel(), getConservativeStats()
     - AdaptiveStrategy: реалізуй методи, додай analyzeConditions(), adjustTactics(), getAdaptiveStats()

  3. Продемонструй поліморфну поведінку (список стратегій, виклик методів у циклі).

  🧩 Пояснення:
  - abstract class — не можна створити напряму, тільки через наслідування
  - Абстрактні методи не мають тіла, їх треба реалізувати у дочірніх класах
  - Конкретні методи мають реалізацію і доступні у всіх дочірніх класах

  💡 Підказка:
  Для списку стратегій використовуй List<RacingStrategy> і цикл for (var strategy in strategies) { ... }

  🔨 Покроковий приклад:

    abstract class RacingStrategy {
      void executeStrategy(); // абстрактний метод
      String getStrategyName(); // абстрактний метод

      void prepareStrategy() {
        print('Підготовка стратегії...');
      }

      void validateStrategy() {
        print('Перевірка стратегії...');
      }
    }

    class AggressiveStrategy extends RacingStrategy {
      @override
      void executeStrategy() {
        print('Виконується агресивна стратегія: максимальний темп!');
      }

      @override
      String getStrategyName() => 'Агресивна';

      void pushHard() {
        print('Пілот тисне на межі можливого!');
      }

      void takeRisks() {
        print('Ризиковані обгони та пізні гальмування.');
      }

      void getAggressiveStats() {
        print('Статистика: найшвидші кола, обгони, ризики.');
      }
    }

    class ConservativeStrategy extends RacingStrategy {
      @override
      void executeStrategy() {
        print('Виконується обережна стратегія: економія ресурсів.');
      }

      @override
      String getStrategyName() => 'Обережна';

      void saveTires() {
        print('Пілот зберігає шини для довшого відрізку.');
      }

      void manageFuel() {
        print('Контроль витрати пального.');
      }

      void getConservativeStats() {
        print('Статистика: економія, стабільність, мінімум ризику.');
      }
    }

    class AdaptiveStrategy extends RacingStrategy {
      @override
      void executeStrategy() {
        print('Виконується адаптивна стратегія: підлаштування під умови.');
      }

      @override
      String getStrategyName() => 'Адаптивна';

      void analyzeConditions() {
        print('Аналіз погоди, стану траси, суперників.');
      }

      void adjustTactics() {
        print('Зміна тактики під час гонки.');
      }

      void getAdaptiveStats() {
        print('Статистика: гнучкість, реакція на зміни.');
      }
    }

    void main() {
      List<RacingStrategy> strategies = [
        AggressiveStrategy(),
        ConservativeStrategy(),
        AdaptiveStrategy(),
      ];

      for (var strategy in strategies) {
        strategy.prepareStrategy();
        strategy.executeStrategy();
        print('Стратегія: ${strategy.getStrategyName()}');
        strategy.validateStrategy();
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
// ЗАВДАННЯ 2: Абстрактна система компонентів автомобіля
// =============================================================================

void task2() {
  print('ЗАВДАННЯ 2: Абстрактна система компонентів автомобіля');
  print('=' * 40);

  /*
  TASK:
  Create an abstract car component system:
  
  Abstract class: CarComponent
  - Abstract methods: initialize(), getStatus(), performMaintenance()
  - Concrete methods: checkHealth(), logActivity()
  
  Concrete classes:
  1. Engine extends CarComponent
     - Properties: horsepower, fuelEfficiency, temperature
     - Methods: startEngine(), adjustPower(), getEngineStats()
  
  2. Transmission extends CarComponent
     - Properties: gears, currentGear, efficiency
     - Methods: shiftGear(), optimizeGearing(), getTransmissionStats()
  
  3. Aerodynamics extends CarComponent
     - Properties: downforce, drag, wingAngle
     - Methods: adjustWing(), optimizeFlow(), getAeroStats()
  
  Requirements:
  - Implement component-specific logic
  - Add health monitoring
  - Demonstrate component interactions
  */

  // TODO: Create abstract CarComponent class

  // TODO: Create Engine class

  // TODO: Create Transmission class

  // TODO: Create Aerodynamics class

  // TODO: Test your implementation
  // List<CarComponent> components = [
  //   Engine(1000, 0.85, 90),
  //   Transmission(8, 3, 0.92),
  //   Aerodynamics(500, 0.15, 15),
  // ];
  //
  // for (var component in components) {
  //   component.initialize();
  //   component.checkHealth();
  //   component.performMaintenance();
  //   print('Status: ${component.getStatus()}');
  //   print('');
  // }

  print('');
}

// =============================================================================
// ЗАВДАННЯ 3: Абстрактна система комунікації команди
// =============================================================================

void task3() {
  print('ЗАВДАННЯ 3: Абстрактна система комунікації команди');
  print('=' * 40);

  /*
  TASK:
  Create an abstract team communication system:
  
  Abstract class: CommunicationChannel
  - Abstract methods: sendMessage(), receiveMessage(), getChannelType()
  - Concrete methods: establishConnection(), validateMessage()
  
  Concrete classes:
  1. RadioCommunication extends CommunicationChannel
     - Properties: frequency, encryption, signalStrength
     - Methods: tuneFrequency(), encryptMessage(), getRadioStats()
  
  2. DigitalCommunication extends CommunicationChannel
     - Properties: protocol, bandwidth, latency
     - Methods: setProtocol(), optimizeBandwidth(), getDigitalStats()
  
  3. VisualCommunication extends CommunicationChannel
     - Properties: signalType, visibility, range
     - Methods: setSignalType(), adjustVisibility(), getVisualStats()
  
  Requirements:
  - Implement communication protocols
  - Add message validation
  - Demonstrate different communication types
  */

  // TODO: Create abstract CommunicationChannel class

  // TODO: Create RadioCommunication class

  // TODO: Create DigitalCommunication class

  // TODO: Create VisualCommunication class

  // TODO: Test your implementation
  // List<CommunicationChannel> channels = [
  //   RadioCommunication(95.5, true, 85),
  //   DigitalCommunication('TCP/IP', 100, 5),
  //   VisualCommunication('LED', 100, 200),
  // ];
  //
  // for (var channel in channels) {
  //   channel.establishConnection();
  //   channel.sendMessage('Test message');
  //   channel.receiveMessage();
  //   print('Channel: ${channel.getChannelType()}');
  //   print('');
  // }

  print('');
}

// =============================================================================
// ЗАВДАННЯ 4: Абстрактна система аналізу даних
// =============================================================================

void task4() {
  print('ЗАВДАННЯ 4: Абстрактна система аналізу даних');
  print('=' * 40);

  /*
  TASK:
  Create an abstract data analysis system:
  
  Abstract class: DataAnalyzer
  - Abstract methods: analyzeData(), generateReport(), getAnalysisType()
  - Concrete methods: validateData(), exportResults()
  
  Concrete classes:
  1. TelemetryAnalyzer extends DataAnalyzer
     - Properties: dataPoints, samplingRate, accuracy
     - Methods: processTelemetry(), calculateMetrics(), getTelemetryStats()
  
  2. PerformanceAnalyzer extends DataAnalyzer
     - Properties: metrics, benchmarks, trends
     - Methods: comparePerformance(), identifyBottlenecks(), getPerformanceStats()
  
  3. PredictiveAnalyzer extends DataAnalyzer
     - Properties: algorithms, predictionAccuracy, timeHorizon
     - Methods: runPredictions(), updateModels(), getPredictionStats()
  
  Requirements:
  - Implement analysis algorithms
  - Add data validation
  - Demonstrate different analysis types
  */

  // TODO: Create abstract DataAnalyzer class

  // TODO: Create TelemetryAnalyzer class

  // TODO: Create PerformanceAnalyzer class

  // TODO: Create PredictiveAnalyzer class

  // TODO: Test your implementation
  // List<DataAnalyzer> analyzers = [
  //   TelemetryAnalyzer(1000, 100, 0.95),
  //   PerformanceAnalyzer(['lapTime', 'speed', 'fuel'], 0.90, 'improving'),
  //   PredictiveAnalyzer(['ML', 'Statistical'], 0.85, 24),
  // ];
  //
  // for (var analyzer in analyzers) {
  //   analyzer.validateData();
  //   analyzer.analyzeData();
  //   analyzer.generateReport();
  //   print('Analysis: ${analyzer.getAnalysisType()}');
  //   print('');
  // }

  print('');
}

// =============================================================================
// ЗАВДАННЯ 5: Розширена - Абстрактний Фабричний Шаблон для Деталей Автомобіля
// =============================================================================

void task5() {
  print(
    'ЗАВДАННЯ 5: Розширена - Абстрактний Фабричний Шаблон для Деталей Автомобіля',
  );
  print('=' * 40);

  /*
  TASK:
  Create an abstract factory pattern for car parts:
  
  Abstract class: CarPartFactory
  - Abstract methods: createEngine(), createTransmission(), createAerodynamics()
  - Concrete methods: validateSpecifications(), getFactoryInfo()
  
  Concrete factories:
  1. F1CarFactory extends CarPartFactory
     - Methods: createF1Engine(), createF1Transmission(), createF1Aerodynamics()
  
  2. RallyCarFactory extends CarPartFactory
     - Methods: createRallyEngine(), createRallyTransmission(), createRallyAerodynamics()
  
  3. EnduranceCarFactory extends CarPartFactory
     - Methods: createEnduranceEngine(), createEnduranceTransmission(), createEnduranceAerodynamics()
  
  Abstract class: CarPart
  - Abstract methods: install(), test(), getSpecifications()
  
  Concrete parts classes for each category
  
  Requirements:
  - Implement factory pattern
  - Create part hierarchies
  - Demonstrate factory usage
  */

  // TODO: Create abstract CarPart class

  // TODO: Create concrete part classes

  // TODO: Create abstract CarPartFactory class

  // TODO: Create concrete factory classes

  // TODO: Test your implementation
  // List<CarPartFactory> factories = [
  //   F1CarFactory(),
  //   RallyCarFactory(),
  //   EnduranceCarFactory(),
  // ];
  //
  // for (var factory in factories) {
  //   print('Factory: ${factory.getFactoryInfo()}');
  //
  //   var engine = factory.createEngine();
  //   var transmission = factory.createTransmission();
  //   var aerodynamics = factory.createAerodynamics();
  //
  //   engine.install();
  //   transmission.install();
  //   aerodynamics.install();
  //
  //   print('');
  // }

  print('');
}
