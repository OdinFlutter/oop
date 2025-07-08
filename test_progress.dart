import 'progress.dart';

void main() {
  print('🧪 ТЕСТ ПРОГРЕС-ТРЕКЕРА');
  print('=' * 30);

  // Ініціалізуємо прогрес
  ProgressTracker.initialize();

  // Показуємо початковий прогрес
  print('\n📋 Початковий прогрес:');
  ProgressTracker.displayProgress();

  // Тестуємо позначення завдань як виконаних
  print('\n✅ Позначаємо деякі завдання як виконані...');

  ProgressTracker.markTaskCompleted('lesson_01', 'task1');
  ProgressTracker.markTaskCompleted('lesson_01', 'task2');
  ProgressTracker.markTaskCompleted('lesson_02', 'task1');
  ProgressTracker.markTaskCompleted('lesson_03', 'task1');
  ProgressTracker.markTaskCompleted('lesson_03', 'task2');
  ProgressTracker.markTaskCompleted('lesson_03', 'task3');

  // Показуємо оновлений прогрес
  print('\n📋 Оновлений прогрес:');
  ProgressTracker.displayProgress();

  // Тестуємо перевірку статусу завдань
  print('\n🔍 Перевірка статусу завдань:');
  print(
    'Урок 1, Завдання 1: ${ProgressTracker.isTaskCompleted('lesson_01', 'task1') ? '✅' : '❌'}',
  );
  print(
    'Урок 1, Завдання 3: ${ProgressTracker.isTaskCompleted('lesson_01', 'task3') ? '✅' : '❌'}',
  );
  print(
    'Урок 2, Завдання 1: ${ProgressTracker.isTaskCompleted('lesson_02', 'task1') ? '✅' : '❌'}',
  );

  print('\n🎉 Тест завершено! Перевірте файл progress.json');
}
