// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => 'План на сегодня';

  @override
  String weekdayPlan(String weekday) {
    return 'План на $weekday';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done из $planned';
  }

  @override
  String get backToToday => 'Вернуться к сегодня';

  @override
  String get emptyPlan => 'Нажмите + и заведите первую привычку.';

  @override
  String get freeDay => 'Свободный день.';

  @override
  String get nothingPlanned => 'На этот день ничего не запланировано.';

  @override
  String get newHabit => 'Новая привычка';

  @override
  String get addNewHabit => '+ Новая привычка';

  @override
  String get nameLabel => 'Название';

  @override
  String get habitNameHint => 'Название привычки';

  @override
  String get daysLabel => 'Дни';

  @override
  String get colorLabel => 'Цвет';

  @override
  String get saveHabit => 'Сохранить привычку';

  @override
  String get saveChanges => 'Сохранить изменения';

  @override
  String get archive => 'В архив';

  @override
  String progress(String month) {
    return 'Прогресс · $month';
  }

  @override
  String get dayStreak => 'дней подряд';

  @override
  String get daysTotal => 'всего дней';

  @override
  String get leaveTitle => 'Выйти без сохранения?';

  @override
  String get leaveMessage => 'Название, дни и цвет останутся как были.';

  @override
  String get discard => 'Не сохранять';

  @override
  String get keep => 'Остаться';

  @override
  String archiveTitle(String name) {
    return 'Убрать «$name» в архив?';
  }

  @override
  String get archiveMessage =>
      'Она исчезнет из плана. История останется на этом телефоне.';

  @override
  String get back => 'Назад';

  @override
  String get previousMonth => 'Предыдущий месяц';

  @override
  String get nextMonth => 'Следующий месяц';

  @override
  String get adLabel => 'Место для рекламы';

  @override
  String get adMark => 'РЕКЛ';

  @override
  String openHabit(String name) {
    return 'Открыть $name';
  }

  @override
  String markDone(String name) {
    return 'Отметить $name';
  }

  @override
  String markNotDone(String name) {
    return 'Снять отметку $name';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name, серия $count';
  }

  @override
  String get wdMo => 'пн';

  @override
  String get wdTu => 'вт';

  @override
  String get wdWe => 'ср';

  @override
  String get wdTh => 'чт';

  @override
  String get wdFr => 'пт';

  @override
  String get wdSa => 'сб';

  @override
  String get wdSu => 'вс';

  @override
  String get seedRun => 'Бег';

  @override
  String get seedEnglish => 'Английский';

  @override
  String get seedStretch => 'Растяжка';

  @override
  String get seedReading => 'Чтение';

  @override
  String get seedWater => 'Вода';

  @override
  String get suggestGym => 'Зал';

  @override
  String get suggestRun => 'Бег';

  @override
  String get suggestRead => 'Чтение';

  @override
  String get suggestWater => 'Вода';

  @override
  String get suggestStretch => 'Растяжка';
}
