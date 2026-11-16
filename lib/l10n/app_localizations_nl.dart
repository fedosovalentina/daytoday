// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => 'Plan voor vandaag';

  @override
  String weekdayPlan(String weekday) {
    return 'Plan voor $weekday';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done van $planned';
  }

  @override
  String get backToToday => 'Terug naar vandaag';

  @override
  String get emptyPlan => 'Tik op + en plant de eerste gewoonte.';

  @override
  String get freeDay => 'Een vrije dag.';

  @override
  String get nothingPlanned => 'Niets gepland voor deze dag.';

  @override
  String get newHabit => 'Nieuwe gewoonte';

  @override
  String get addNewHabit => '+ Nieuwe gewoonte';

  @override
  String get nameLabel => 'Naam';

  @override
  String get habitNameHint => 'Naam van de gewoonte';

  @override
  String get daysLabel => 'Dagen';

  @override
  String get colorLabel => 'Kleur';

  @override
  String get saveHabit => 'Gewoonte opslaan';

  @override
  String get saveChanges => 'Wijzigingen opslaan';

  @override
  String get archive => 'Archiveren';

  @override
  String progress(String month) {
    return 'Voortgang · $month';
  }

  @override
  String get dayStreak => 'dagen op rij';

  @override
  String get daysTotal => 'dagen in totaal';

  @override
  String get leaveTitle => 'Weggaan zonder op te slaan?';

  @override
  String get leaveMessage => 'Naam, dagen en kleur blijven zoals ze waren.';

  @override
  String get discard => 'Weggooien';

  @override
  String get keep => 'Verder bewerken';

  @override
  String archiveTitle(String name) {
    return '$name archiveren?';
  }

  @override
  String get archiveMessage =>
      'Hij verdwijnt uit het plan. De geschiedenis blijft op deze telefoon.';

  @override
  String get back => 'Terug';

  @override
  String get previousMonth => 'Vorige maand';

  @override
  String get nextMonth => 'Volgende maand';

  @override
  String get adLabel => 'Plaats voor een advertentie';

  @override
  String get adMark => 'AD';

  @override
  String openHabit(String name) {
    return '$name openen';
  }

  @override
  String markDone(String name) {
    return '$name afvinken';
  }

  @override
  String markNotDone(String name) {
    return 'Vink bij $name weghalen';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name, $count dagen op rij';
  }

  @override
  String get wdMo => 'ma';

  @override
  String get wdTu => 'di';

  @override
  String get wdWe => 'wo';

  @override
  String get wdTh => 'do';

  @override
  String get wdFr => 'vr';

  @override
  String get wdSa => 'za';

  @override
  String get wdSu => 'zo';

  @override
  String get seedRun => 'Hardlopen';

  @override
  String get seedEnglish => 'Engels';

  @override
  String get seedStretch => 'Rekken';

  @override
  String get seedReading => 'Lezen';

  @override
  String get seedWater => 'Water';

  @override
  String get suggestGym => 'Sportschool';

  @override
  String get suggestRun => 'Hardlopen';

  @override
  String get suggestRead => 'Lezen';

  @override
  String get suggestWater => 'Water';

  @override
  String get suggestStretch => 'Rekken';
}
