// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => 'Today\'s plan';

  @override
  String weekdayPlan(String weekday) {
    return '$weekday\'s plan';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done of $planned';
  }

  @override
  String get backToToday => 'Back to today';

  @override
  String get emptyPlan => 'Tap + and plant the first habit.';

  @override
  String get freeDay => 'A free day.';

  @override
  String get nothingPlanned => 'Nothing planned for this day.';

  @override
  String get newHabit => 'New habit';

  @override
  String get addNewHabit => '+ New habit';

  @override
  String get nameLabel => 'Name';

  @override
  String get habitNameHint => 'Habit name';

  @override
  String get daysLabel => 'Days';

  @override
  String get colorLabel => 'Color';

  @override
  String get saveHabit => 'Save habit';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get archive => 'Archive';

  @override
  String progress(String month) {
    return 'Progress · $month';
  }

  @override
  String get dayStreak => 'day streak';

  @override
  String get daysTotal => 'days total';

  @override
  String get leaveTitle => 'Leave without saving?';

  @override
  String get leaveMessage => 'The name, days, and color stay as they were.';

  @override
  String get discard => 'Discard';

  @override
  String get keep => 'Keep';

  @override
  String archiveTitle(String name) {
    return 'Archive $name?';
  }

  @override
  String get archiveMessage =>
      'It leaves the plan. The history stays on this phone.';

  @override
  String get back => 'Back';

  @override
  String get previousMonth => 'Previous month';

  @override
  String get nextMonth => 'Next month';

  @override
  String get adLabel => 'Advertisement placeholder';

  @override
  String get adMark => 'AD';

  @override
  String openHabit(String name) {
    return 'Open $name';
  }

  @override
  String markDone(String name) {
    return 'Mark $name done';
  }

  @override
  String markNotDone(String name) {
    return 'Mark $name not done';
  }

  @override
  String habitCardLabel(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count day streak',
      one: '1 day streak',
    );
    return '$name, $_temp0';
  }

  @override
  String get wdMo => 'Mo';

  @override
  String get wdTu => 'Tu';

  @override
  String get wdWe => 'We';

  @override
  String get wdTh => 'Th';

  @override
  String get wdFr => 'Fr';

  @override
  String get wdSa => 'Sa';

  @override
  String get wdSu => 'Su';

  @override
  String get seedRun => 'Run';

  @override
  String get seedEnglish => 'English';

  @override
  String get seedStretch => 'Stretch';

  @override
  String get seedReading => 'Reading';

  @override
  String get seedWater => 'Water';

  @override
  String get suggestGym => 'Gym';

  @override
  String get suggestRun => 'Run';

  @override
  String get suggestRead => 'Read';

  @override
  String get suggestWater => 'Water';

  @override
  String get suggestStretch => 'Stretch';
}
