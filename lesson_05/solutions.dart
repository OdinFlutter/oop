// LESSON 5: Abstraction Solutions
// Complete solutions for all practice tasks
// Run with: dart solutions.dart

import '../progress.dart';

void main() {
  // Ініціалізуємо прогрес-трекер
  ProgressTracker.initialize();

  // Показуємо прогрес курсу
  ProgressTracker.displayProgress();

  print('\n🎯 ПРАКТИКА — УРОК 5: АБСТРАКЦІЯ');
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
// SOLUTION 1: Abstract Racing Strategy System
// =============================================================================

abstract class RacingStrategy {
  // Abstract methods
  void executeStrategy();
  String getStrategyName();

  // Concrete methods
  void prepareStrategy() {
    print('Preparing ${getStrategyName()} strategy...');
  }

  void validateStrategy() {
    print('Validating ${getStrategyName()} strategy...');
  }
}

class AggressiveStrategy extends RacingStrategy {
  @override
  void executeStrategy() {
    print('Executing aggressive racing strategy');
    pushHard();
    takeRisks();
  }

  @override
  String getStrategyName() {
    return 'Aggressive';
  }

  void pushHard() {
    print('Pushing hard - maximum attack mode');
  }

  void takeRisks() {
    print('Taking calculated risks for overtaking');
  }

  String getAggressiveStats() {
    return 'High risk, high reward strategy';
  }
}

class ConservativeStrategy extends RacingStrategy {
  @override
  void executeStrategy() {
    print('Executing conservative racing strategy');
    saveTires();
    manageFuel();
  }

  @override
  String getStrategyName() {
    return 'Conservative';
  }

  void saveTires() {
    print('Managing tire wear carefully');
  }

  void manageFuel() {
    print('Optimizing fuel consumption');
  }

  String getConservativeStats() {
    return 'Low risk, consistent performance';
  }
}

class AdaptiveStrategy extends RacingStrategy {
  @override
  void executeStrategy() {
    print('Executing adaptive racing strategy');
    analyzeConditions();
    adjustTactics();
  }

  @override
  String getStrategyName() {
    return 'Adaptive';
  }

  void analyzeConditions() {
    print('Analyzing track and weather conditions');
  }

  void adjustTactics() {
    print('Adjusting tactics based on conditions');
  }

  String getAdaptiveStats() {
    return 'Flexible strategy based on conditions';
  }
}

void solution1() {
  print('SOLUTION 1: Abstract Racing Strategy System');
  print('=' * 40);

  List<RacingStrategy> strategies = [
    AggressiveStrategy(),
    ConservativeStrategy(),
    AdaptiveStrategy(),
  ];

  for (var strategy in strategies) {
    strategy.prepareStrategy();
    strategy.validateStrategy();
    strategy.executeStrategy();
    print('Strategy: ${strategy.getStrategyName()}');
    print('');
  }
}

// =============================================================================
// SOLUTION 2: Abstract Car Component System
// =============================================================================

abstract class CarComponent {
  // Abstract methods
  void initialize();
  String getStatus();
  void performMaintenance();

  // Concrete methods
  void checkHealth() {
    print('Checking component health...');
  }

  void logActivity() {
    print('Logging component activity...');
  }
}

class Engine extends CarComponent {
  int horsepower;
  double fuelEfficiency;
  int temperature;

  Engine(this.horsepower, this.fuelEfficiency, this.temperature);

  @override
  void initialize() {
    print('Initializing engine with $horsepower HP');
  }

  @override
  String getStatus() {
    return 'Engine: ${horsepower}HP, ${(fuelEfficiency * 100).toStringAsFixed(0)}% efficiency, ${temperature}°C';
  }

  @override
  void performMaintenance() {
    print('Performing engine maintenance');
    temperature = 85; // Reset to optimal temperature
  }

  void startEngine() {
    print('Starting engine...');
  }

  void adjustPower() {
    print('Adjusting engine power output');
  }

  String getEngineStats() {
    return 'Power: ${horsepower}HP, Efficiency: ${(fuelEfficiency * 100).toStringAsFixed(0)}%';
  }
}

class Transmission extends CarComponent {
  int gears;
  int currentGear;
  double efficiency;

  Transmission(this.gears, this.currentGear, this.efficiency);

  @override
  void initialize() {
    print('Initializing $gears-speed transmission');
  }

  @override
  String getStatus() {
    return 'Transmission: Gear $currentGear/$gears, ${(efficiency * 100).toStringAsFixed(0)}% efficiency';
  }

  @override
  void performMaintenance() {
    print('Performing transmission maintenance');
    currentGear = 1; // Reset to first gear
  }

  void shiftGear() {
    print('Shifting transmission gear');
  }

  void optimizeGearing() {
    print('Optimizing gear ratios');
  }

  String getTransmissionStats() {
    return 'Gears: $gears, Current: $currentGear, Efficiency: ${(efficiency * 100).toStringAsFixed(0)}%';
  }
}

class Aerodynamics extends CarComponent {
  int downforce;
  double drag;
  int wingAngle;

  Aerodynamics(this.downforce, this.drag, this.wingAngle);

  @override
  void initialize() {
    print('Initializing aerodynamics package');
  }

  @override
  String getStatus() {
    return 'Aero: ${downforce}kg downforce, ${(drag * 100).toStringAsFixed(0)}% drag, ${wingAngle}° wing';
  }

  @override
  void performMaintenance() {
    print('Performing aerodynamics maintenance');
    wingAngle = 10; // Reset to default angle
  }

  void adjustWing() {
    print('Adjusting aerodynamic wing');
  }

  void optimizeFlow() {
    print('Optimizing airflow');
  }

  String getAeroStats() {
    return 'Downforce: ${downforce}kg, Drag: ${(drag * 100).toStringAsFixed(0)}%';
  }
}

void solution2() {
  print('SOLUTION 2: Abstract Car Component System');
  print('=' * 40);

  List<CarComponent> components = [
    Engine(1000, 0.85, 90),
    Transmission(8, 3, 0.92),
    Aerodynamics(500, 0.15, 15),
  ];

  for (var component in components) {
    component.initialize();
    component.checkHealth();
    component.performMaintenance();
    print('Status: ${component.getStatus()}');
    print('');
  }
}

// =============================================================================
// SOLUTION 3: Abstract Team Communication System
// =============================================================================

abstract class CommunicationChannel {
  // Abstract methods
  void sendMessage(String message);
  void receiveMessage();
  String getChannelType();

  // Concrete methods
  void establishConnection() {
    print('Establishing ${getChannelType()} connection...');
  }

  void validateMessage(String message) {
    print('Validating message: $message');
  }
}

class RadioCommunication extends CommunicationChannel {
  double frequency;
  bool encryption;
  int signalStrength;

  RadioCommunication(this.frequency, this.encryption, this.signalStrength);

  @override
  void sendMessage(String message) {
    print('Sending radio message at ${frequency}MHz');
    if (encryption) {
      encryptMessage(message);
    }
  }

  @override
  void receiveMessage() {
    print('Receiving radio message');
  }

  @override
  String getChannelType() {
    return 'Radio';
  }

  void tuneFrequency() {
    print('Tuning radio frequency');
  }

  void encryptMessage(String message) {
    print('Encrypting message: $message');
  }

  String getRadioStats() {
    return 'Freq: ${frequency}MHz, Encrypted: $encryption, Signal: ${signalStrength}%';
  }
}

class DigitalCommunication extends CommunicationChannel {
  String protocol;
  int bandwidth;
  int latency;

  DigitalCommunication(this.protocol, this.bandwidth, this.latency);

  @override
  void sendMessage(String message) {
    print('Sending digital message via $protocol');
    setProtocol(protocol);
  }

  @override
  void receiveMessage() {
    print('Receiving digital message');
  }

  @override
  String getChannelType() {
    return 'Digital';
  }

  void setProtocol(String protocol) {
    print('Setting protocol: $protocol');
  }

  void optimizeBandwidth() {
    print('Optimizing bandwidth usage');
  }

  String getDigitalStats() {
    return 'Protocol: $protocol, Bandwidth: ${bandwidth}Mbps, Latency: ${latency}ms';
  }
}

class VisualCommunication extends CommunicationChannel {
  String signalType;
  int visibility;
  int range;

  VisualCommunication(this.signalType, this.visibility, this.range);

  @override
  void sendMessage(String message) {
    print('Sending visual signal: $signalType');
    setSignalType(signalType);
  }

  @override
  void receiveMessage() {
    print('Receiving visual signal');
  }

  @override
  String getChannelType() {
    return 'Visual';
  }

  void setSignalType(String signalType) {
    print('Setting signal type: $signalType');
  }

  void adjustVisibility() {
    print('Adjusting signal visibility');
  }

  String getVisualStats() {
    return 'Signal: $signalType, Visibility: ${visibility}%, Range: ${range}m';
  }
}

void solution3() {
  print('SOLUTION 3: Abstract Team Communication System');
  print('=' * 40);

  List<CommunicationChannel> channels = [
    RadioCommunication(95.5, true, 85),
    DigitalCommunication('TCP/IP', 100, 5),
    VisualCommunication('LED', 100, 200),
  ];

  for (var channel in channels) {
    channel.establishConnection();
    channel.sendMessage('Test message');
    channel.receiveMessage();
    print('Channel: ${channel.getChannelType()}');
    print('');
  }
}

// =============================================================================
// SOLUTION 4: Abstract Data Analysis System
// =============================================================================

abstract class DataAnalyzer {
  // Abstract methods
  void analyzeData();
  void generateReport();
  String getAnalysisType();

  // Concrete methods
  void validateData() {
    print('Validating data for ${getAnalysisType()} analysis...');
  }

  void exportResults() {
    print('Exporting analysis results...');
  }
}

class TelemetryAnalyzer extends DataAnalyzer {
  int dataPoints;
  int samplingRate;
  double accuracy;

  TelemetryAnalyzer(this.dataPoints, this.samplingRate, this.accuracy);

  @override
  void analyzeData() {
    print('Analyzing telemetry data');
    processTelemetry();
    calculateMetrics();
  }

  @override
  void generateReport() {
    print('Generating telemetry analysis report');
  }

  @override
  String getAnalysisType() {
    return 'Telemetry';
  }

  void processTelemetry() {
    print('Processing $dataPoints data points at ${samplingRate}Hz');
  }

  void calculateMetrics() {
    print('Calculating performance metrics');
  }

  String getTelemetryStats() {
    return 'Data points: $dataPoints, Sampling: ${samplingRate}Hz, Accuracy: ${(accuracy * 100).toStringAsFixed(0)}%';
  }
}

class PerformanceAnalyzer extends DataAnalyzer {
  List<String> metrics;
  double benchmarks;
  String trends;

  PerformanceAnalyzer(this.metrics, this.benchmarks, this.trends);

  @override
  void analyzeData() {
    print('Analyzing performance data');
    comparePerformance();
    identifyBottlenecks();
  }

  @override
  void generateReport() {
    print('Generating performance analysis report');
  }

  @override
  String getAnalysisType() {
    return 'Performance';
  }

  void comparePerformance() {
    print('Comparing performance against benchmarks');
  }

  void identifyBottlenecks() {
    print('Identifying performance bottlenecks');
  }

  String getPerformanceStats() {
    return 'Metrics: ${metrics.length}, Benchmarks: ${(benchmarks * 100).toStringAsFixed(0)}%, Trend: $trends';
  }
}

class PredictiveAnalyzer extends DataAnalyzer {
  List<String> algorithms;
  double predictionAccuracy;
  int timeHorizon;

  PredictiveAnalyzer(
    this.algorithms,
    this.predictionAccuracy,
    this.timeHorizon,
  );

  @override
  void analyzeData() {
    print('Running predictive analysis');
    runPredictions();
    updateModels();
  }

  @override
  void generateReport() {
    print('Generating predictive analysis report');
  }

  @override
  String getAnalysisType() {
    return 'Predictive';
  }

  void runPredictions() {
    print('Running predictions with ${algorithms.length} algorithms');
  }

  void updateModels() {
    print('Updating prediction models');
  }

  String getPredictionStats() {
    return 'Algorithms: ${algorithms.length}, Accuracy: ${(predictionAccuracy * 100).toStringAsFixed(0)}%, Horizon: ${timeHorizon}h';
  }
}

void solution4() {
  print('SOLUTION 4: Abstract Data Analysis System');
  print('=' * 40);

  List<DataAnalyzer> analyzers = [
    TelemetryAnalyzer(1000, 100, 0.95),
    PerformanceAnalyzer(['lapTime', 'speed', 'fuel'], 0.90, 'improving'),
    PredictiveAnalyzer(['ML', 'Statistical'], 0.85, 24),
  ];

  for (var analyzer in analyzers) {
    analyzer.validateData();
    analyzer.analyzeData();
    analyzer.generateReport();
    print('Analysis: ${analyzer.getAnalysisType()}');
    print('');
  }
}

// =============================================================================
// SOLUTION 5: Advanced - Abstract Factory Pattern for Car Parts
// =============================================================================

abstract class CarPart {
  // Abstract methods
  void install();
  void test();
  String getSpecifications();
}

class FactoryEngine extends CarPart {
  String type;
  int horsepower;

  FactoryEngine(this.type, this.horsepower);

  @override
  void install() {
    print('Installing $type engine');
  }

  @override
  void test() {
    print('Testing $type engine');
  }

  @override
  String getSpecifications() {
    return '$type engine with $horsepower HP';
  }
}

class FactoryTransmission extends CarPart {
  String type;
  int gears;

  FactoryTransmission(this.type, this.gears);

  @override
  void install() {
    print('Installing $type transmission');
  }

  @override
  void test() {
    print('Testing $type transmission');
  }

  @override
  String getSpecifications() {
    return '$type transmission with $gears gears';
  }
}

class FactoryAerodynamics extends CarPart {
  String type;
  int downforce;

  FactoryAerodynamics(this.type, this.downforce);

  @override
  void install() {
    print('Installing $type aerodynamics');
  }

  @override
  void test() {
    print('Testing $type aerodynamics');
  }

  @override
  String getSpecifications() {
    return '$type aerodynamics with ${downforce}kg downforce';
  }
}

abstract class CarPartFactory {
  // Abstract methods
  CarPart createEngine();
  CarPart createTransmission();
  CarPart createAerodynamics();

  // Concrete methods
  void validateSpecifications() {
    print('Validating factory specifications...');
  }

  String getFactoryInfo();
}

class F1CarFactory extends CarPartFactory {
  @override
  CarPart createEngine() {
    return FactoryEngine('F1 Hybrid', 1000);
  }

  @override
  CarPart createTransmission() {
    return FactoryTransmission('F1 Sequential', 8);
  }

  @override
  CarPart createAerodynamics() {
    return FactoryAerodynamics('F1 High-Downforce', 800);
  }

  @override
  String getFactoryInfo() {
    return 'Formula 1 Car Parts Factory';
  }
}

class RallyCarFactory extends CarPartFactory {
  @override
  CarPart createEngine() {
    return FactoryEngine('Rally Turbo', 400);
  }

  @override
  CarPart createTransmission() {
    return FactoryTransmission('Rally Sequential', 6);
  }

  @override
  CarPart createAerodynamics() {
    return FactoryAerodynamics('Rally Off-Road', 200);
  }

  @override
  String getFactoryInfo() {
    return 'Rally Car Parts Factory';
  }
}

class EnduranceCarFactory extends CarPartFactory {
  @override
  CarPart createEngine() {
    return FactoryEngine('Endurance Hybrid', 600);
  }

  @override
  CarPart createTransmission() {
    return FactoryTransmission('Endurance Sequential', 7);
  }

  @override
  CarPart createAerodynamics() {
    return FactoryAerodynamics('Endurance Balanced', 400);
  }

  @override
  String getFactoryInfo() {
    return 'Endurance Car Parts Factory';
  }
}

void solution5() {
  print('SOLUTION 5: Advanced Abstract Factory Pattern');
  print('=' * 40);

  List<CarPartFactory> factories = [
    F1CarFactory(),
    RallyCarFactory(),
    EnduranceCarFactory(),
  ];

  for (var factory in factories) {
    print('Factory: ${factory.getFactoryInfo()}');
    factory.validateSpecifications();

    var engine = factory.createEngine();
    var transmission = factory.createTransmission();
    var aerodynamics = factory.createAerodynamics();

    engine.install();
    engine.test();
    print('Engine: ${engine.getSpecifications()}');

    transmission.install();
    transmission.test();
    print('Transmission: ${transmission.getSpecifications()}');

    aerodynamics.install();
    aerodynamics.test();
    print('Aerodynamics: ${aerodynamics.getSpecifications()}');

    print('');
  }
}
