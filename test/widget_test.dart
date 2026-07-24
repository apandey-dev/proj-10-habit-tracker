import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:habit_tracker/main.dart';
import 'package:habit_tracker/provider/habit_provider.dart';

void main() {
  testWidgets('Daily Habit Tracker smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => HabitProvider(),
        child: const DailyHabitTrackerApp(),
      ),
    );

    expect(find.text("Today's Habits"), findsOneWidget);
  });
}
