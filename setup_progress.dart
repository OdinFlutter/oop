import 'dart:io';

void main() {
  print('🔧 НАЛАШТУВАННЯ ПРОГРЕС-ТРЕКЕРА ДЛЯ ВСІХ УРОКІВ');
  print('=' * 50);

  // Список всіх уроків
  final lessons = [
    'lesson_01',
    'lesson_02',
    'lesson_03',
    'lesson_04',
    'lesson_05',
    'lesson_06',
  ];

  for (final lesson in lessons) {
    final practiceFile = '$lesson/practice.dart';
    final solutionsFile = '$lesson/solutions.dart';

    print('\n📚 Обробляємо $lesson...');

    // Оновлюємо practice.dart
    if (File(practiceFile).existsSync()) {
      _updatePracticeFile(practiceFile, lesson);
      print('✅ $practiceFile оновлено');
    } else {
      print('❌ $practiceFile не знайдено');
    }

    // Оновлюємо solutions.dart
    if (File(solutionsFile).existsSync()) {
      _updateSolutionsFile(solutionsFile, lesson);
      print('✅ $solutionsFile оновлено');
    } else {
      print('❌ $solutionsFile не знайдено');
    }
  }

  print('\n🎉 Налаштування завершено!');
  print('💡 Тепер кожен practice.dart показуватиме прогрес курсу.');
  print('📊 Завдання будуть автоматично позначені як виконані.');
}

void _updatePracticeFile(String filePath, String lesson) {
  final file = File(filePath);
  String content = file.readAsStringSync();

  // Додаємо імпорт progress.dart
  if (!content.contains("import '../progress.dart';")) {
    content = content.replaceFirst(
      '// УРОК',
      "import '../progress.dart';\n\n// УРОК",
    );
  }

  // Оновлюємо main() функцію
  if (content.contains('void main() {')) {
    content = _updateMainFunction(content, lesson);
  }

  // Додаємо позначення завдань як виконаних
  content = _addTaskCompletion(content, lesson);

  file.writeAsStringSync(content);
}

void _updateSolutionsFile(String filePath, String lesson) {
  final file = File(filePath);
  String content = file.readAsStringSync();

  // Додаємо імпорт progress.dart
  if (!content.contains("import '../progress.dart';")) {
    content = content.replaceFirst(
      '// УРОК',
      "import '../progress.dart';\n\n// УРОК",
    );
  }

  // Оновлюємо main() функцію
  if (content.contains('void main() {')) {
    content = _updateMainFunction(content, lesson);
  }

  // Додаємо позначення завдань як виконаних
  content = _addTaskCompletion(content, lesson);

  file.writeAsStringSync(content);
}

String _updateMainFunction(String content, String lesson) {
  // Знаходимо початок main() функції
  final mainStart = content.indexOf('void main() {');
  if (mainStart == -1) return content;

  // Знаходимо кінець main() функції
  final mainEnd = _findMainEnd(content, mainStart);
  if (mainEnd == -1) return content;

  // Отримуємо назву уроку для відображення
  final lessonNames = {
    'lesson_01': 'КЛАСИ ТА ОБ\'ЄКТИ',
    'lesson_02': 'ІНКАПСУЛЯЦІЯ',
    'lesson_03': 'НАСЛІДУВАННЯ',
    'lesson_04': 'ПОЛІМОРФІЗМ',
    'lesson_05': 'АБСТРАКЦІЯ',
    'lesson_06': 'ФІНАЛЬНИЙ ПРОЕКТ',
  };

  final lessonName = lessonNames[lesson] ?? lesson.toUpperCase();

  // Створюємо новий main()
  final newMain =
      '''
void main() {
  // Ініціалізуємо прогрес-трекер
  ProgressTracker.initialize();
  
  // Показуємо прогрес курсу
  ProgressTracker.displayProgress();
  
  print('\\n🎯 ПРАКТИКА — УРОК ${lesson.substring(8)}: $lessonName');
  print('=' * 50);

  // Розкоментуйте потрібне завдання для виконання
  // task1();
  // task2();
  // task3();
  // task4();
  // task5();

  print('\\n💡 Порада: Розкоментуйте task1() для початку роботи!');
  print('📚 Перевірте solutions.dart для порівняння після виконання.');
}
''';

  // Замінюємо старий main() на новий
  return content.substring(0, mainStart) +
      newMain +
      content.substring(mainEnd + 1);
}

int _findMainEnd(String content, int start) {
  int braceCount = 0;
  bool inMain = false;

  for (int i = start; i < content.length; i++) {
    if (content[i] == '{') {
      braceCount++;
      inMain = true;
    } else if (content[i] == '}') {
      braceCount--;
      if (inMain && braceCount == 0) {
        return i;
      }
    }
  }

  return -1;
}

String _addTaskCompletion(String content, String lesson) {
  // Додаємо позначення завдання як виконаного для кожного taskX()
  for (int i = 1; i <= 5; i++) {
    final taskName = 'task$i';
    final taskPattern = 'void $taskName() {';

    if (content.contains(taskPattern)) {
      // Знаходимо кінець функції taskX
      final taskStart = content.indexOf(taskPattern);
      final taskEnd = _findTaskEnd(content, taskStart);

      if (taskEnd != -1) {
        // Перевіряємо, чи вже є позначення завдання
        final taskContent = content.substring(taskStart, taskEnd);
        if (!taskContent.contains('ProgressTracker.markTaskCompleted')) {
          // Додаємо позначення завдання як виконаного
          final completionCode =
              '''

  // Позначаємо завдання як виконане
  ProgressTracker.markTaskCompleted('$lesson', '$taskName');
  print('\\n✅ Завдання $i позначено як виконане!');
  print('📊 Прогрес оновлено автоматично.');

  print('');''';

          content =
              content.substring(0, taskEnd) +
              completionCode +
              content.substring(taskEnd);
        }
      }
    }
  }

  return content;
}

int _findTaskEnd(String content, int start) {
  int braceCount = 0;
  bool inTask = false;

  for (int i = start; i < content.length; i++) {
    if (content[i] == '{') {
      braceCount++;
      inTask = true;
    } else if (content[i] == '}') {
      braceCount--;
      if (inTask && braceCount == 0) {
        return i;
      }
    }
  }

  return -1;
}
