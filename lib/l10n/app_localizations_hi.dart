// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => 'आज की योजना';

  @override
  String weekdayPlan(String weekday) {
    return '$weekday की योजना';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done/$planned';
  }

  @override
  String get backToToday => 'आज पर वापस';

  @override
  String get emptyPlan => '+ दबाएँ और पहली आदत जोड़ें।';

  @override
  String get freeDay => 'खाली दिन।';

  @override
  String get nothingPlanned => 'इस दिन कुछ तय नहीं है।';

  @override
  String get newHabit => 'नई आदत';

  @override
  String get addNewHabit => '+ नई आदत';

  @override
  String get nameLabel => 'नाम';

  @override
  String get habitNameHint => 'आदत का नाम';

  @override
  String get daysLabel => 'दिन';

  @override
  String get colorLabel => 'रंग';

  @override
  String get saveHabit => 'आदत सहेजें';

  @override
  String get saveChanges => 'बदलाव सहेजें';

  @override
  String get archive => 'संग्रह';

  @override
  String progress(String month) {
    return 'प्रगति · $month';
  }

  @override
  String get dayStreak => 'लगातार दिन';

  @override
  String get daysTotal => 'कुल दिन';

  @override
  String get leaveTitle => 'बिना सहेजे जाएँ?';

  @override
  String get leaveMessage => 'नाम, दिन और रंग वैसे ही रहेंगे।';

  @override
  String get discard => 'छोड़ें';

  @override
  String get keep => 'रहें';

  @override
  String archiveTitle(String name) {
    return '$name को संग्रह में डालें?';
  }

  @override
  String get archiveMessage => 'यह योजना से हट जाएगी। इतिहास इस फ़ोन पर रहेगा।';

  @override
  String get back => 'वापस';

  @override
  String get previousMonth => 'पिछला महीना';

  @override
  String get nextMonth => 'अगला महीना';

  @override
  String get adLabel => 'विज्ञापन की जगह';

  @override
  String get adMark => 'विज्ञापन';

  @override
  String openHabit(String name) {
    return '$name खोलें';
  }

  @override
  String markDone(String name) {
    return '$name पूरा चिह्नित करें';
  }

  @override
  String markNotDone(String name) {
    return '$name का चिह्न हटाएँ';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name, $count दिन लगातार';
  }

  @override
  String get wdMo => 'सो';

  @override
  String get wdTu => 'मं';

  @override
  String get wdWe => 'बु';

  @override
  String get wdTh => 'गु';

  @override
  String get wdFr => 'शु';

  @override
  String get wdSa => 'श';

  @override
  String get wdSu => 'नि';

  @override
  String get seedRun => 'दौड़';

  @override
  String get seedEnglish => 'अंग्रेज़ी';

  @override
  String get seedStretch => 'स्ट्रेच';

  @override
  String get seedReading => 'पढ़ना';

  @override
  String get seedWater => 'पानी';

  @override
  String get suggestGym => 'जिम';

  @override
  String get suggestRun => 'दौड़';

  @override
  String get suggestRead => 'पढ़ना';

  @override
  String get suggestWater => 'पानी';

  @override
  String get suggestStretch => 'स्ट्रेच';
}
