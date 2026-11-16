import 'package:flutter/material.dart';

import 'screens/today_screen.dart';
import 'store.dart';
import 'theme.dart';

typedef Clock = DateTime Function();

class AppClock extends InheritedWidget {
  const AppClock({super.key, required this.now, required super.child});

  final Clock now;

  static DateTime of(BuildContext context) {
    final clock = context.dependOnInheritedWidgetOfExactType<AppClock>();
    assert(clock != null, 'AppClock is missing above this widget');
    return clock!.now();
  }

  @override
  bool updateShouldNotify(AppClock oldWidget) => oldWidget.now != now;
}

class HabitScope extends InheritedNotifier<HabitStore> {
  const HabitScope({super.key, required HabitStore store, required super.child})
    : super(notifier: store);

  static HabitStore of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<HabitScope>();
    assert(scope != null, 'HabitScope is missing above this widget');
    return scope!.notifier!;
  }

  @override
  bool updateShouldNotify(HabitScope oldWidget) =>
      oldWidget.notifier != notifier;
}

class DayToDayApp extends StatelessWidget {
  const DayToDayApp({
    super.key,
    required this.store,
    this.clock = DateTime.now,
  });

  final HabitStore store;
  final Clock clock;

  @override
  Widget build(BuildContext context) {
    return AppClock(
      now: clock,
      child: HabitScope(
        store: store,
        child: MaterialApp(
          title: 'Day to Day',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          themeMode: ThemeMode.light,
          home: const TodayScreen(),
        ),
      ),
    );
  }
}
