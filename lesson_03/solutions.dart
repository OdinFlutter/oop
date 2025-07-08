// LESSON 3: Inheritance Solutions
// Complete solutions for all practice tasks
// Run with: dart solutions.dart

void main() {
  print('Solutions - Lesson 3: Inheritance\n');

  // Run all solutions
  solution1();
  solution2();
  solution3();
  solution4();
  solution5();

  print('All solutions completed!');
}

// =============================================================================
// SOLUTION 1: Basic Vehicle Inheritance Hierarchy
// =============================================================================

class Vehicle {
  String brand;
  String model;
  int year;
  int maxSpeed;

  Vehicle(this.brand, this.model, this.year, this.maxSpeed);

  void start() {
    print('$brand $model starting...');
  }

  void stop() {
    print('$brand $model stopping...');
  }

  void getInfo() {
    print('Vehicle: $brand $model ($year) - Max Speed: $maxSpeed km/h');
  }
}

class F1Car extends Vehicle {
  String team;
  int aerodynamicLevel;

  F1Car(
    String brand,
    String model,
    int year,
    int maxSpeed,
    this.team,
    this.aerodynamicLevel,
  ) : super(brand, model, year, maxSpeed);

  void deployDRS() {
    print('DRS deployed for $team!');
  }

  void activateERS() {
    print('ERS system activated!');
  }

  @override
  void getInfo() {
    super.getInfo();
    print('Team: $team, Aero Level: $aerodynamicLevel');
  }
}

class RallyCar extends Vehicle {
  bool isFourWheelDrive;
  String terrainType;

  RallyCar(
    String brand,
    String model,
    int year,
    int maxSpeed,
    this.isFourWheelDrive,
    this.terrainType,
  ) : super(brand, model, year, maxSpeed);

  void switchToOffRoad() {
    print('Switching to off-road mode for $terrainType terrain');
  }

  void activateDifferential() {
    if (isFourWheelDrive) {
      print('4WD differential activated!');
    } else {
      print('2WD differential activated!');
    }
  }

  @override
  void getInfo() {
    super.getInfo();
    print('4WD: $isFourWheelDrive, Terrain: $terrainType');
  }
}

class GT3Car extends Vehicle {
  int enduranceLevel;
  int fuelCapacity;

  GT3Car(
    String brand,
    String model,
    int year,
    int maxSpeed,
    this.enduranceLevel,
    this.fuelCapacity,
  ) : super(brand, model, year, maxSpeed);

  void activateEnduranceMode() {
    print('Endurance mode activated for $enduranceLevel hours');
  }

  void refuel() {
    print('Refueling with $fuelCapacity liters capacity');
  }

  @override
  void getInfo() {
    super.getInfo();
    print('Endurance Level: $enduranceLevel, Fuel Capacity: $fuelCapacity L');
  }
}

void solution1() {
  print('SOLUTION 1: Basic Vehicle Inheritance Hierarchy');
  print('=' * 45);

  Vehicle f1 = F1Car('Red Bull', 'RB19', 2023, 350, 'Red Bull Racing', 3);
  Vehicle rally = RallyCar('Toyota', 'GR Yaris', 2023, 200, true, 'Gravel');
  Vehicle gt3 = GT3Car('Porsche', '911 GT3 R', 2023, 280, 8, 120);

  f1.start();
  f1.getInfo();
  (f1 as F1Car).deployDRS();
  (f1 as F1Car).activateERS();

  print('');

  rally.start();
  rally.getInfo();
  (rally as RallyCar).switchToOffRoad();
  (rally as RallyCar).activateDifferential();

  print('');

  gt3.start();
  gt3.getInfo();
  (gt3 as GT3Car).activateEnduranceMode();
  (gt3 as GT3Car).refuel();

  print('');
}

// =============================================================================
// SOLUTION 2: Driver Hierarchy with Experience Levels
// =============================================================================

class Driver {
  String name;
  int age;
  String nationality;
  int experienceYears;

  Driver(this.name, this.age, this.nationality, this.experienceYears);

  void introduce() {
    print('I am $name from $nationality');
  }

  void train() {
    print('$name is training...');
  }

  String getExperienceLevel() {
    if (experienceYears < 2) return 'Rookie';
    if (experienceYears < 5) return 'Experienced';
    if (experienceYears < 10) return 'Veteran';
    return 'Legend';
  }
}

class F1Driver extends Driver {
  String team;
  int championships;
  int raceWins;
  double bestLapTime;

  F1Driver(
    String name,
    int age,
    String nationality,
    int experienceYears,
    this.team,
    this.championships,
    this.raceWins,
    this.bestLapTime,
  ) : super(name, age, nationality, experienceYears);

  void qualify() {
    print('$name qualifying for $team');
  }

  void race() {
    print('$name racing for $team');
  }

  String getChampionshipStatus() {
    if (championships > 0) {
      return '$championships-time World Champion';
    }
    return 'Championship contender';
  }

  @override
  void introduce() {
    super.introduce();
    print('I drive for $team in Formula 1');
    print('Best lap time: ${bestLapTime}s');
  }
}

class RallyDriver extends Driver {
  String coDriver;
  int rallyWins;
  String terrainSpecialty;

  RallyDriver(
    String name,
    int age,
    String nationality,
    int experienceYears,
    this.coDriver,
    this.rallyWins,
    this.terrainSpecialty,
  ) : super(name, age, nationality, experienceYears);

  void navigate() {
    print('$name navigating with $coDriver');
  }

  void switchTerrain() {
    print('Switching to $terrainSpecialty terrain');
  }

  String getRallyStats() {
    return '$rallyWins rally wins, specialty: $terrainSpecialty';
  }

  @override
  void introduce() {
    super.introduce();
    print('I compete in rally with co-driver $coDriver');
    print('Specialty: $terrainSpecialty');
  }
}

class EnduranceDriver extends Driver {
  int enduranceWins;
  int staminaLevel;
  String teamRole;

  EnduranceDriver(
    String name,
    int age,
    String nationality,
    int experienceYears,
    this.enduranceWins,
    this.staminaLevel,
    this.teamRole,
  ) : super(name, age, nationality, experienceYears);

  void longDistanceRace() {
    print('$name in long distance race with stamina level $staminaLevel');
  }

  void switchDriver() {
    print('$name switching with teammate');
  }

  String getEnduranceStats() {
    return '$enduranceWins endurance wins, role: $teamRole';
  }

  @override
  void introduce() {
    super.introduce();
    print('I am a $teamRole in endurance racing');
    print('Stamina level: $staminaLevel/10');
  }
}

void solution2() {
  print('SOLUTION 2: Driver Hierarchy with Experience Levels');
  print('=' * 45);

  Driver max = F1Driver(
    'Max Verstappen',
    26,
    'Dutch',
    8,
    'Red Bull',
    3,
    54,
    1.18,
  );
  Driver sebastien = RallyDriver(
    'Sébastien Ogier',
    39,
    'French',
    15,
    'Julien Ingrassia',
    8,
    'Tarmac',
  );
  Driver fernando = EnduranceDriver(
    'Fernando Alonso',
    42,
    'Spanish',
    20,
    2,
    9,
    'Lead Driver',
  );

  max.introduce();
  print('Experience: ${max.getExperienceLevel()}');
  print('Status: ${(max as F1Driver).getChampionshipStatus()}');

  print('');

  sebastien.introduce();
  print('Experience: ${sebastien.getExperienceLevel()}');
  print('Stats: ${(sebastien as RallyDriver).getRallyStats()}');

  print('');

  fernando.introduce();
  print('Experience: ${fernando.getExperienceLevel()}');
  print('Stats: ${(fernando as EnduranceDriver).getEnduranceStats()}');

  print('');
}

// =============================================================================
// SOLUTION 3: Team Management Hierarchy
// =============================================================================

class TeamMember {
  String name;
  String role;
  double salary;
  int yearsInTeam;

  TeamMember(this.name, this.role, this.salary, this.yearsInTeam);

  void work() {
    print('$name is working as $role');
  }

  double getSalary() {
    return salary * (1 + yearsInTeam * 0.05); // 5% increase per year
  }

  String getTeamStatus() {
    return '$name ($role) - ${yearsInTeam} years in team';
  }
}

class Engineer extends TeamMember {
  String specialization;
  List<String> certifications;
  List<String> projects;

  Engineer(
    String name,
    String role,
    double salary,
    int yearsInTeam,
    this.specialization,
    this.certifications,
    this.projects,
  ) : super(name, role, salary, yearsInTeam);

  void designSystem() {
    print('$name designing $specialization system');
  }

  void analyzeData() {
    print('$name analyzing telemetry data');
  }

  String getEngineeringStats() {
    return 'Specialization: $specialization, Certifications: ${certifications.length}, Projects: ${projects.length}';
  }

  @override
  void work() {
    super.work();
    print('Focusing on $specialization engineering');
  }
}

class Mechanic extends TeamMember {
  List<String> tools;
  List<String> certifications;
  int pitStopExperience;

  Mechanic(
    String name,
    String role,
    double salary,
    int yearsInTeam,
    this.tools,
    this.certifications,
    this.pitStopExperience,
  ) : super(name, role, salary, yearsInTeam);

  void repairCar() {
    print('$name repairing car with ${tools.length} tools');
  }

  void performPitStop() {
    print('$name performing pit stop (experience: $pitStopExperience stops)');
  }

  String getMechanicStats() {
    return 'Tools: ${tools.length}, Certifications: ${certifications.length}, Pit stops: $pitStopExperience';
  }

  @override
  void work() {
    super.work();
    print('Maintaining and preparing race cars');
  }
}

class Manager extends TeamMember {
  String department;
  int teamSize;
  double budget;

  Manager(
    String name,
    String role,
    double salary,
    int yearsInTeam,
    this.department,
    this.teamSize,
    this.budget,
  ) : super(name, role, salary, yearsInTeam);

  void manageTeam() {
    print('$name managing $teamSize people in $department');
  }

  void makeDecisions() {
    print(
      '$name making strategic decisions with \$${budget.toStringAsFixed(0)} budget',
    );
  }

  String getManagementStats() {
    return 'Department: $department, Team size: $teamSize, Budget: \$${budget.toStringAsFixed(0)}';
  }

  @override
  void work() {
    super.work();
    print('Leading and coordinating team activities');
  }
}

void solution3() {
  print('SOLUTION 3: Team Management Hierarchy');
  print('=' * 35);

  TeamMember engineer = Engineer(
    'Adrian Newey',
    'Chief Technical Officer',
    5000000,
    15,
    'Aerodynamics',
    ['F1', 'Aero'],
    ['RB19', 'RB20'],
  );
  TeamMember mechanic = Mechanic(
    'John Smith',
    'Chief Mechanic',
    80000,
    8,
    ['Impact Wrench', 'Diagnostic Tool'],
    ['F1 Safety'],
    120,
  );
  TeamMember manager = Manager(
    'Christian Horner',
    'Team Principal',
    3000000,
    18,
    'Operations',
    850,
    500000000,
  );

  engineer.work();
  engineer.getTeamStatus();
  print('Salary: \$${(engineer.getSalary() / 1000000).toStringAsFixed(1)}M');
  print('Stats: ${(engineer as Engineer).getEngineeringStats()}');

  print('');

  mechanic.work();
  mechanic.getTeamStatus();
  print('Salary: \$${mechanic.getSalary().toStringAsFixed(0)}');
  print('Stats: ${(mechanic as Mechanic).getMechanicStats()}');

  print('');

  manager.work();
  manager.getTeamStatus();
  print('Salary: \$${(manager.getSalary() / 1000000).toStringAsFixed(1)}M');
  print('Stats: ${(manager as Manager).getManagementStats()}');

  print('');
}

// =============================================================================
// SOLUTION 4: Championship System with Inheritance
// =============================================================================

class Championship {
  String name;
  int year;
  int numberOfRounds;
  List<String> participants;

  Championship(this.name, this.year, this.numberOfRounds, int maxParticipants)
    : participants = [];

  void addParticipant(String participant) {
    if (participants.length < 20) {
      // Generic limit
      participants.add(participant);
      print('Added $participant to $name');
    }
  }

  void startSeason() {
    print(
      '$name $year season started with ${participants.length} participants',
    );
  }

  List<String> getStandings() {
    return List.from(participants); // Simple implementation
  }
}

class F1Championship extends Championship {
  List<String> constructors;
  List<String> drivers;
  int sprintRaces;

  F1Championship(String name, int year, int numberOfRounds, int maxTeams)
    : constructors = [],
      drivers = [],
      sprintRaces = 0,
      super(name, year, numberOfRounds, maxTeams);

  void addConstructor(String constructor) {
    constructors.add(constructor);
    print('Added constructor: $constructor');
  }

  void addDriver(String driver) {
    drivers.add(driver);
    print('Added driver: $driver');
  }

  void calculatePoints() {
    print('Calculating F1 championship points...');
  }

  @override
  void addParticipant(String participant) {
    super.addParticipant(participant);
    if (participant.contains('Racing') || participant.contains('Team')) {
      addConstructor(participant);
    } else {
      addDriver(participant);
    }
  }
}

class RallyChampionship extends Championship {
  List<String> events;
  List<String> terrainTypes;
  List<String> coDrivers;

  RallyChampionship(String name, int year, int numberOfRounds, int maxTeams)
    : events = [],
      terrainTypes = [],
      coDrivers = [],
      super(name, year, numberOfRounds, maxTeams);

  void addEvent(String event) {
    events.add(event);
    print('Added rally event: $event');
  }

  void addTerrain(String terrain) {
    terrainTypes.add(terrain);
    print('Added terrain type: $terrain');
  }

  void calculateRallyPoints() {
    print('Calculating rally championship points...');
  }

  @override
  void addParticipant(String participant) {
    super.addParticipant(participant);
    if (participant.contains('Racing')) {
      print('Rally team added: $participant');
    }
  }
}

class EnduranceChampionship extends Championship {
  List<String> races;
  List<String> carClasses;
  List<String> driverTeams;

  EnduranceChampionship(String name, int year, int numberOfRounds, int maxTeams)
    : races = [],
      carClasses = [],
      driverTeams = [],
      super(name, year, numberOfRounds, maxTeams);

  void addRace(String race) {
    races.add(race);
    print('Added endurance race: $race');
  }

  void addCarClass(String carClass) {
    carClasses.add(carClass);
    print('Added car class: $carClass');
  }

  void calculateEndurancePoints() {
    print('Calculating endurance championship points...');
  }

  @override
  void addParticipant(String participant) {
    super.addParticipant(participant);
    if (participant.contains('Racing')) {
      print('Endurance team added: $participant');
    }
  }
}

void solution4() {
  print('SOLUTION 4: Championship System with Inheritance');
  print('=' * 45);

  Championship f1 = F1Championship(
    'Formula 1 World Championship',
    2024,
    24,
    10,
  );
  Championship rally = RallyChampionship(
    'World Rally Championship',
    2024,
    13,
    8,
  );
  Championship endurance = EnduranceChampionship(
    'World Endurance Championship',
    2024,
    8,
    12,
  );

  f1.addParticipant('Red Bull Racing');
  f1.addParticipant('Max Verstappen');
  f1.addParticipant('Lewis Hamilton');

  rally.addParticipant('Toyota Gazoo Racing');
  (rally as RallyChampionship).addEvent('Monte Carlo Rally');
  (rally as RallyChampionship).addTerrain('Tarmac');

  endurance.addParticipant('Toyota Gazoo Racing');
  (endurance as EnduranceChampionship).addRace('24 Hours of Le Mans');
  (endurance as EnduranceChampionship).addCarClass('Hypercar');

  f1.startSeason();
  rally.startSeason();
  endurance.startSeason();

  print('');
}

// =============================================================================
// SOLUTION 5: Advanced Multi-level Inheritance with Abstract Classes
// =============================================================================

abstract class RacingVehicle {
  String brand;
  String model;
  int maxSpeed;
  String team;

  RacingVehicle(this.brand, this.model, this.maxSpeed, this.team);

  // Abstract methods
  void accelerate();
  void brake();
  String getPerformance();

  // Concrete methods
  void start() {
    print('$brand $model starting...');
  }

  void stop() {
    print('$brand $model stopping...');
  }

  String getBasicInfo() {
    return '$brand $model - Max Speed: $maxSpeed km/h - Team: $team';
  }
}

abstract class SingleSeater extends RacingVehicle {
  SingleSeater(String brand, String model, int maxSpeed, String team)
    : super(brand, model, maxSpeed, team);

  // Abstract methods
  void deployAero();
  void activateDRS();

  // Concrete methods
  String getDriverPosition() {
    return 'Single seat position';
  }

  void adjustWing() {
    print('Adjusting aerodynamic wing');
  }

  @override
  void accelerate() {
    print('Single seater accelerating with high downforce');
  }

  @override
  void brake() {
    print('Single seater braking with carbon fiber discs');
  }

  @override
  String getPerformance() {
    return 'High downforce, maximum grip, precise handling';
  }
}

class AdvancedF1Car extends SingleSeater {
  AdvancedF1Car(String brand, String model, int maxSpeed, String team)
    : super(brand, model, maxSpeed, team);

  void activateERS() {
    print('ERS (Energy Recovery System) activated');
  }

  void deployHALO() {
    print('HALO safety system deployed');
  }

  String getF1Stats() {
    return 'F1 car with advanced aerodynamics and hybrid power';
  }

  @override
  void deployAero() {
    print('Deploying F1 aerodynamic package');
  }

  @override
  void activateDRS() {
    print('DRS (Drag Reduction System) activated');
  }
}

class IndyCar extends SingleSeater {
  IndyCar(String brand, String model, int maxSpeed, String team)
    : super(brand, model, maxSpeed, team);

  void activatePushToPass() {
    print('Push-to-Pass overtaking system activated');
  }

  void deployAeroScreen() {
    print('AeroScreen safety device deployed');
  }

  String getIndyStats() {
    return 'IndyCar with oval and road course configurations';
  }

  @override
  void deployAero() {
    print('Deploying IndyCar aerodynamic package');
  }

  @override
  void activateDRS() {
    print('IndyCar overtaking assist activated');
  }
}

class FormulaE extends SingleSeater {
  FormulaE(String brand, String model, int maxSpeed, String team)
    : super(brand, model, maxSpeed, team);

  void activateAttackMode() {
    print('Attack Mode activated for extra power');
  }

  void deployFanBoost() {
    print('FanBoost deployed - extra energy from fan votes');
  }

  String getFormulaEStats() {
    return 'Formula E electric racing with sustainable technology';
  }

  @override
  void deployAero() {
    print('Deploying Formula E aerodynamic package');
  }

  @override
  void activateDRS() {
    print('Formula E energy management system activated');
  }
}

void solution5() {
  print('SOLUTION 5: Advanced Multi-level Inheritance');
  print('=' * 40);

  List<RacingVehicle> vehicles = [
    AdvancedF1Car('Red Bull', 'RB20', 350, 'Red Bull Racing'),
    IndyCar('Honda', 'IR18', 320, 'Team Penske'),
    FormulaE('Porsche', '99X Electric', 280, 'TAG Heuer Porsche'),
  ];

  for (var vehicle in vehicles) {
    print('${vehicle.getBasicInfo()}');
    vehicle.start();
    vehicle.accelerate();
    vehicle.brake();
    print('Performance: ${vehicle.getPerformance()}');

    if (vehicle is SingleSeater) {
      vehicle.deployAero();
      vehicle.activateDRS();
      print('Driver position: ${vehicle.getDriverPosition()}');
    }

    if (vehicle is AdvancedF1Car) {
      (vehicle as AdvancedF1Car).activateERS();
      (vehicle as AdvancedF1Car).deployHALO();
      print('Stats: ${(vehicle as AdvancedF1Car).getF1Stats()}');
    } else if (vehicle is IndyCar) {
      (vehicle as IndyCar).activatePushToPass();
      (vehicle as IndyCar).deployAeroScreen();
      print('Stats: ${(vehicle as IndyCar).getIndyStats()}');
    } else if (vehicle is FormulaE) {
      (vehicle as FormulaE).activateAttackMode();
      (vehicle as FormulaE).deployFanBoost();
      print('Stats: ${(vehicle as FormulaE).getFormulaEStats()}');
    }

    vehicle.stop();
    print('');
  }
}
