import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'provider/habit_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    // Wrap the root app with ChangeNotifierProvider to manage state globally
    ChangeNotifierProvider(
      create: (context) => HabitProvider(),
      child: const DailyHabitTrackerApp(),
    ),
  );
}

class DailyHabitTrackerApp extends StatelessWidget {
  const DailyHabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Habit Tracker',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
