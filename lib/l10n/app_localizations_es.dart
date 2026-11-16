// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => 'Plan de hoy';

  @override
  String weekdayPlan(String weekday) {
    return 'Plan del $weekday';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done de $planned';
  }

  @override
  String get backToToday => 'Volver a hoy';

  @override
  String get emptyPlan => 'Toca + y crea el primer hábito.';

  @override
  String get freeDay => 'Un día libre.';

  @override
  String get nothingPlanned => 'Nada previsto para este día.';

  @override
  String get newHabit => 'Nuevo hábito';

  @override
  String get addNewHabit => '+ Nuevo hábito';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get habitNameHint => 'Nombre del hábito';

  @override
  String get daysLabel => 'Días';

  @override
  String get colorLabel => 'Color';

  @override
  String get saveHabit => 'Guardar hábito';

  @override
  String get saveChanges => 'Guardar cambios';

  @override
  String get archive => 'Archivar';

  @override
  String progress(String month) {
    return 'Progreso · $month';
  }

  @override
  String get dayStreak => 'días seguidos';

  @override
  String get daysTotal => 'días en total';

  @override
  String get leaveTitle => '¿Salir sin guardar?';

  @override
  String get leaveMessage =>
      'El nombre, los días y el color se quedan como estaban.';

  @override
  String get discard => 'Descartar';

  @override
  String get keep => 'Seguir';

  @override
  String archiveTitle(String name) {
    return '¿Archivar $name?';
  }

  @override
  String get archiveMessage =>
      'Sale del plan. El historial se queda en este teléfono.';

  @override
  String get back => 'Atrás';

  @override
  String get previousMonth => 'Mes anterior';

  @override
  String get nextMonth => 'Mes siguiente';

  @override
  String get adLabel => 'Espacio para un anuncio';

  @override
  String get adMark => 'AD';

  @override
  String openHabit(String name) {
    return 'Abrir $name';
  }

  @override
  String markDone(String name) {
    return 'Marcar $name hecho';
  }

  @override
  String markNotDone(String name) {
    return 'Quitar $name';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name, $count días seguidos';
  }

  @override
  String get wdMo => 'lu';

  @override
  String get wdTu => 'ma';

  @override
  String get wdWe => 'mi';

  @override
  String get wdTh => 'ju';

  @override
  String get wdFr => 'vi';

  @override
  String get wdSa => 'sá';

  @override
  String get wdSu => 'do';

  @override
  String get seedRun => 'Correr';

  @override
  String get seedEnglish => 'Inglés';

  @override
  String get seedStretch => 'Estirar';

  @override
  String get seedReading => 'Leer';

  @override
  String get seedWater => 'Agua';

  @override
  String get suggestGym => 'Gym';

  @override
  String get suggestRun => 'Correr';

  @override
  String get suggestRead => 'Leer';

  @override
  String get suggestWater => 'Agua';

  @override
  String get suggestStretch => 'Estirar';
}
