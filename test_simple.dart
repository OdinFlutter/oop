// Simple test file for Formula 1 OOP concepts
// Run with: dart test_simple.dart

void main() {
  print('Welcome to Formula 1 OOP Learning!');

  // Create a simple driver
  Driver driver1 = Driver('Max Verstappen', 26);
  driver1.displayInfo();

  // Test encapsulation
  Car car1 = Car();
  car1.speed = 200;
  print('Car speed: ${car1.speed} km/h');
  print('Speed category: ${car1.speedCategory}');

  car1.speed = 400; // This should show error
  print('Car speed after invalid set: ${car1.speed} km/h');
}

class Driver {
  String name;
  int age;

  Driver(this.name, this.age);

  void displayInfo() {
    print('Driver: $name, Age: $age years old');
  }
}

class Car {
  double _speed = 0;
  double _maxSpeed = 350;

  double get speed => _speed;

  set speed(double newSpeed) {
    if (newSpeed >= 0 && newSpeed <= _maxSpeed) {
      _speed = newSpeed;
    } else {
      print('Invalid speed: $newSpeed km/h (max: $_maxSpeed)');
    }
  }

  String get speedCategory {
    if (_speed == 0) return 'Stopped';
    if (_speed < 100) return 'Slow';
    if (_speed < 200) return 'Medium';
    if (_speed < 300) return 'Fast';
    return 'Very Fast';
  }
}
