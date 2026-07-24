import 'package:flutter/material.dart';

/// Simple model representing a single Habit.
/// Defined in this file to keep the project structure minimal and beginner-friendly.
class Habit {
  final String id;
  final String title;
  final IconData icon;
  bool isCompleted;

  Habit({
    required this.id,
    required this.title,
    required this.icon,
    this.isCompleted = false,
  });
}

/// HabitProvider handles state management for the daily habits.
/// Inherits from ChangeNotifier to notify UI components when data changes.
class HabitProvider extends ChangeNotifier {
  // List of initial habits for the tracker
  final List<Habit> _habits = [
    Habit(
      id: '1',
      title: 'Drink Water',
      icon: Icons.water_drop_outlined,
      isCompleted: false,
    ),
    Habit(
      id: '2',
      title: 'Exercise',
      icon: Icons.fitness_center_outlined,
      isCompleted: false,
    ),
    Habit(
      id: '3',
      title: 'Read Book',
      icon: Icons.menu_book_outlined,
      isCompleted: false,
    ),
    Habit(
      id: '4',
      title: 'Study Flutter',
      icon: Icons.code_rounded,
      isCompleted: false,
    ),
    Habit(
      id: '5',
      title: 'Sleep Early',
      icon: Icons.bedtime_outlined,
      isCompleted: false,
    ),
  ];

  /// Getter to retrieve the list of habits
  List<Habit> get habits => _habits;

  /// Toggle completion status of a habit by index
  void toggleHabit(int index) {
    if (index >= 0 && index < _habits.length) {
      _habits[index].isCompleted = !_habits[index].isCompleted;
      notifyListeners(); // Triggers UI rebuild
    }
  }

  /// Total count of completed habits
  int get completedCount {
    return _habits.where((habit) => habit.isCompleted).length;
  }

  /// Total count of all habits
  int get totalCount => _habits.length;

  /// Progress ratio from 0.0 to 1.0
  double get progress {
    if (_habits.isEmpty) return 0.0;
    return completedCount / totalCount;
  }
}
