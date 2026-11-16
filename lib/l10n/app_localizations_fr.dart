// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => 'Programme du jour';

  @override
  String weekdayPlan(String weekday) {
    return 'Programme du $weekday';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done sur $planned';
  }

  @override
  String get backToToday => 'Revenir à aujourd\'hui';

  @override
  String get emptyPlan => 'Touchez + et plantez la première habitude.';

  @override
  String get freeDay => 'Jour libre.';

  @override
  String get nothingPlanned => 'Rien de prévu ce jour-là.';

  @override
  String get newHabit => 'Nouvelle habitude';

  @override
  String get addNewHabit => '+ Nouvelle habitude';

  @override
  String get nameLabel => 'Nom';

  @override
  String get habitNameHint => 'Nom de l\'habitude';

  @override
  String get daysLabel => 'Jours';

  @override
  String get colorLabel => 'Couleur';

  @override
  String get saveHabit => 'Enregistrer l\'habitude';

  @override
  String get saveChanges => 'Enregistrer';

  @override
  String get archive => 'Archiver';

  @override
  String progress(String month) {
    return 'Progrès · $month';
  }

  @override
  String get dayStreak => 'jours d\'affilée';

  @override
  String get daysTotal => 'jours au total';

  @override
  String get leaveTitle => 'Partir sans enregistrer ?';

  @override
  String get leaveMessage =>
      'Le nom, les jours et la couleur restent comme avant.';

  @override
  String get discard => 'Abandonner';

  @override
  String get keep => 'Rester';

  @override
  String archiveTitle(String name) {
    return 'Archiver $name ?';
  }

  @override
  String get archiveMessage =>
      'Elle quitte le programme. L\'historique reste sur ce téléphone.';

  @override
  String get back => 'Retour';

  @override
  String get previousMonth => 'Mois précédent';

  @override
  String get nextMonth => 'Mois suivant';

  @override
  String get adLabel => 'Emplacement publicitaire';

  @override
  String get adMark => 'PUB';

  @override
  String openHabit(String name) {
    return 'Ouvrir $name';
  }

  @override
  String markDone(String name) {
    return 'Marquer $name fait';
  }

  @override
  String markNotDone(String name) {
    return 'Retirer $name';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name, $count jours d\'affilée';
  }

  @override
  String get wdMo => 'lu';

  @override
  String get wdTu => 'ma';

  @override
  String get wdWe => 'me';

  @override
  String get wdTh => 'je';

  @override
  String get wdFr => 've';

  @override
  String get wdSa => 'sa';

  @override
  String get wdSu => 'di';

  @override
  String get seedRun => 'Course';

  @override
  String get seedEnglish => 'Anglais';

  @override
  String get seedStretch => 'Étirements';

  @override
  String get seedReading => 'Lecture';

  @override
  String get seedWater => 'Eau';

  @override
  String get suggestGym => 'Sport';

  @override
  String get suggestRun => 'Course';

  @override
  String get suggestRead => 'Lecture';

  @override
  String get suggestWater => 'Eau';

  @override
  String get suggestStretch => 'Étirements';
}
