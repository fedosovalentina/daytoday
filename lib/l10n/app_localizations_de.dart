// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => 'Plan für heute';

  @override
  String weekdayPlan(String weekday) {
    return 'Plan für $weekday';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done von $planned';
  }

  @override
  String get backToToday => 'Zurück zu heute';

  @override
  String get emptyPlan => 'Tippe auf + und leg die erste Gewohnheit an.';

  @override
  String get freeDay => 'Ein freier Tag.';

  @override
  String get nothingPlanned => 'Für diesen Tag ist nichts geplant.';

  @override
  String get newHabit => 'Neue Gewohnheit';

  @override
  String get addNewHabit => '+ Neue Gewohnheit';

  @override
  String get nameLabel => 'Name';

  @override
  String get habitNameHint => 'Name der Gewohnheit';

  @override
  String get daysLabel => 'Tage';

  @override
  String get colorLabel => 'Farbe';

  @override
  String get saveHabit => 'Gewohnheit speichern';

  @override
  String get saveChanges => 'Änderungen speichern';

  @override
  String get archive => 'Archivieren';

  @override
  String progress(String month) {
    return 'Fortschritt · $month';
  }

  @override
  String get dayStreak => 'Tage in Folge';

  @override
  String get daysTotal => 'Tage insgesamt';

  @override
  String get leaveTitle => 'Ohne Speichern verlassen?';

  @override
  String get leaveMessage => 'Name, Tage und Farbe bleiben, wie sie waren.';

  @override
  String get discard => 'Verwerfen';

  @override
  String get keep => 'Weiter bearbeiten';

  @override
  String archiveTitle(String name) {
    return '$name archivieren?';
  }

  @override
  String get archiveMessage =>
      'Sie verschwindet aus dem Plan. Die Historie bleibt auf diesem Telefon.';

  @override
  String get back => 'Zurück';

  @override
  String get previousMonth => 'Vorheriger Monat';

  @override
  String get nextMonth => 'Nächster Monat';

  @override
  String get adLabel => 'Platz für Werbung';

  @override
  String get adMark => 'AD';

  @override
  String openHabit(String name) {
    return '$name öffnen';
  }

  @override
  String markDone(String name) {
    return '$name erledigen';
  }

  @override
  String markNotDone(String name) {
    return '$name zurücknehmen';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name, $count Tage in Folge';
  }

  @override
  String get wdMo => 'Mo';

  @override
  String get wdTu => 'Di';

  @override
  String get wdWe => 'Mi';

  @override
  String get wdTh => 'Do';

  @override
  String get wdFr => 'Fr';

  @override
  String get wdSa => 'Sa';

  @override
  String get wdSu => 'So';

  @override
  String get seedRun => 'Laufen';

  @override
  String get seedEnglish => 'Englisch';

  @override
  String get seedStretch => 'Dehnen';

  @override
  String get seedReading => 'Lesen';

  @override
  String get seedWater => 'Wasser';

  @override
  String get suggestGym => 'Fitness';

  @override
  String get suggestRun => 'Laufen';

  @override
  String get suggestRead => 'Lesen';

  @override
  String get suggestWater => 'Wasser';

  @override
  String get suggestStretch => 'Dehnen';
}
