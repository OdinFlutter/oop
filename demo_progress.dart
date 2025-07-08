import 'progress.dart';

void main() {
  print('🎬 ДЕМОНСТРАЦІЯ ПРОГРЕС-ТРЕКЕРА');
  print('=' * 40);

  // Ініціалізуємо прогрес
  ProgressTracker.initialize();

  print('\n📋 Початковий стан курсу:');
  ProgressTracker.displayProgress();

  print('\n🎯 Симулюємо виконання завдань...');

  // Симулюємо виконання різних завдань
  _simulateProgress();

  print('\n📋 Фінальний стан курсу:');
  ProgressTracker.displayProgress();

  print('\n🎉 Демонстрація завершена!');
  print('💡 Тепер ви можете:');
  print('   - Запускати будь-який practice.dart для перегляду прогресу');
  print('   - Розкоментовувати taskX() для виконання завдань');
  print('   - Бачити автоматичне оновлення прогресу');
  print('   - Ділитися прогресом з друзями через progress.json');
}

void _simulateProgress() {
  // Урок 1: Класи та об'єкти
  print('   ✅ Урок 1: task1, task2, task3');
  ProgressTracker.markTaskCompleted('lesson_01', 'task1');
  ProgressTracker.markTaskCompleted('lesson_01', 'task2');
  ProgressTracker.markTaskCompleted('lesson_01', 'task3');

  // Урок 2: Інкапсуляція
  print('   ✅ Урок 2: task1, task2');
  ProgressTracker.markTaskCompleted('lesson_02', 'task1');
  ProgressTracker.markTaskCompleted('lesson_02', 'task2');

  // Урок 3: Наслідування
  print('   ✅ Урок 3: task1, task2, task3, task4');
  ProgressTracker.markTaskCompleted('lesson_03', 'task1');
  ProgressTracker.markTaskCompleted('lesson_03', 'task2');
  ProgressTracker.markTaskCompleted('lesson_03', 'task3');
  ProgressTracker.markTaskCompleted('lesson_03', 'task4');

  // Урок 4: Поліморфізм
  print('   ✅ Урок 4: task1');
  ProgressTracker.markTaskCompleted('lesson_04', 'task1');

  // Урок 5: Абстракція
  print('   ✅ Урок 5: task1, task2');
  ProgressTracker.markTaskCompleted('lesson_05', 'task1');
  ProgressTracker.markTaskCompleted('lesson_05', 'task2');

  // Урок 6: Фінальний проект
  print('   ✅ Урок 6: task1');
  ProgressTracker.markTaskCompleted('lesson_06', 'task1');
}
