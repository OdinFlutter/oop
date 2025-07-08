import 'dart:convert';
import 'dart:io';

class ProgressTracker {
  static const String _progressFile = 'progress.json';
  static Map<String, dynamic> _progress = {};

  // Ініціалізація прогресу
  static void initialize() {
    _loadProgress();
    _ensureAllLessonsExist();
  }

  // Завантаження прогресу з файлу
  static void _loadProgress() {
    try {
      final file = File(_progressFile);
      if (file.existsSync()) {
        final content = file.readAsStringSync();
        _progress = json.decode(content);
      }
    } catch (e) {
      print('Помилка завантаження прогресу: $e');
      _progress = {};
    }
  }

  // Збереження прогресу у файл
  static void _saveProgress() {
    try {
      final file = File(_progressFile);
      file.writeAsStringSync(json.encode(_progress), flush: true);
    } catch (e) {
      print('Помилка збереження прогресу: $e');
    }
  }

  // Переконатися, що всі уроки існують у прогресі
  static void _ensureAllLessonsExist() {
    for (int i = 1; i <= 6; i++) {
      final lessonKey = 'lesson_0$i';
      if (!_progress.containsKey(lessonKey)) {
        _progress[lessonKey] = {
          'task1': false,
          'task2': false,
          'task3': false,
          'task4': false,
          'task5': false,
        };
      }
    }
    _saveProgress();
  }

  // Позначити завдання як виконане
  static void markTaskCompleted(String lesson, String task) {
    if (!_progress.containsKey(lesson)) {
      _progress[lesson] = {};
    }
    _progress[lesson][task] = true;
    _saveProgress();
  }

  // Отримати статус завдання
  static bool isTaskCompleted(String lesson, String task) {
    return _progress[lesson]?[task] == true;
  }

  // Отримати прогрес уроку
  static Map<String, bool> getLessonProgress(String lesson) {
    return Map<String, bool>.from(_progress[lesson] ?? {});
  }

  // Підрахувати загальний прогрес
  static Map<String, int> getOverallProgress() {
    Map<String, int> overall = {};

    for (int i = 1; i <= 6; i++) {
      final lessonKey = 'lesson_0$i';
      final lessonProgress = getLessonProgress(lessonKey);
      final completed = lessonProgress.values
          .where((completed) => completed)
          .length;
      final total = lessonProgress.length;
      overall[lessonKey] = completed;
    }

    return overall;
  }

  // Відобразити прогрес у терміналі
  static void displayProgress() {
    print('\n🏁 ПРОГРЕС КУРСУ OOP DART - FORMULA 1');
    print('=' * 50);

    final overall = getOverallProgress();
    int totalCompleted = 0;
    int totalTasks = 0;

    for (int i = 1; i <= 6; i++) {
      final lessonKey = 'lesson_0$i';
      final lessonProgress = getLessonProgress(lessonKey);
      final completed = overall[lessonKey] ?? 0;
      final total = lessonProgress.length;

      totalCompleted += completed;
      totalTasks += total;

      // Назви уроків
      final lessonNames = {
        'lesson_01': 'Урок 1: Класи та об\'єкти',
        'lesson_02': 'Урок 2: Інкапсуляція',
        'lesson_03': 'Урок 3: Наслідування',
        'lesson_04': 'Урок 4: Поліморфізм',
        'lesson_05': 'Урок 5: Абстракція',
        'lesson_06': 'Урок 6: Фінальний проект',
      };

      final lessonName = lessonNames[lessonKey] ?? lessonKey;
      final percentage = total > 0 ? (completed * 100 / total).round() : 0;

      print('\n📚 $lessonName');
      print('   Прогрес: $completed/$total завдань ($percentage%)');

      // Чекбокси для кожного завдання
      for (int j = 1; j <= 5; j++) {
        final taskKey = 'task$j';
        final isCompleted = lessonProgress[taskKey] == true;
        final checkbox = isCompleted ? '✅' : '⭕';
        print('   $checkbox Завдання $j');
      }
    }

    // Загальний прогрес
    final totalPercentage = totalTasks > 0
        ? (totalCompleted * 100 / totalTasks).round()
        : 0;
    print('\n' + '=' * 50);
    print(
      '🎯 ЗАГАЛЬНИЙ ПРОГРЕС: $totalCompleted/$totalTasks завдань ($totalPercentage%)',
    );

    // Прогрес-бар
    final progressBarLength = 30;
    final filledLength = (totalPercentage * progressBarLength / 100).round();
    final progressBar =
        '█' * filledLength + '░' * (progressBarLength - filledLength);
    print('📊 [$progressBar] $totalPercentage%');
    print('=' * 50);
  }

  // Очистити прогрес (для тестування)
  static void resetProgress() {
    _progress = {};
    _ensureAllLessonsExist();
    print('🔄 Прогрес скинуто!');
  }
}
