// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => 'Plano de hoje';

  @override
  String weekdayPlan(String weekday) {
    return 'Plano de $weekday';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done de $planned';
  }

  @override
  String get backToToday => 'Voltar a hoje';

  @override
  String get emptyPlan => 'Toque em + e crie o primeiro hábito.';

  @override
  String get freeDay => 'Um dia livre.';

  @override
  String get nothingPlanned => 'Nada planeado para este dia.';

  @override
  String get newHabit => 'Novo hábito';

  @override
  String get addNewHabit => '+ Novo hábito';

  @override
  String get nameLabel => 'Nome';

  @override
  String get habitNameHint => 'Nome do hábito';

  @override
  String get daysLabel => 'Dias';

  @override
  String get colorLabel => 'Cor';

  @override
  String get saveHabit => 'Guardar hábito';

  @override
  String get saveChanges => 'Guardar alterações';

  @override
  String get archive => 'Arquivar';

  @override
  String progress(String month) {
    return 'Progresso · $month';
  }

  @override
  String get dayStreak => 'dias seguidos';

  @override
  String get daysTotal => 'dias no total';

  @override
  String get leaveTitle => 'Sair sem guardar?';

  @override
  String get leaveMessage => 'O nome, os dias e a cor ficam como estavam.';

  @override
  String get discard => 'Descartar';

  @override
  String get keep => 'Continuar';

  @override
  String archiveTitle(String name) {
    return 'Arquivar $name?';
  }

  @override
  String get archiveMessage =>
      'Sai do plano. O histórico fica neste telemóvel.';

  @override
  String get back => 'Voltar';

  @override
  String get previousMonth => 'Mês anterior';

  @override
  String get nextMonth => 'Mês seguinte';

  @override
  String get adLabel => 'Espaço para um anúncio';

  @override
  String get adMark => 'AD';

  @override
  String openHabit(String name) {
    return 'Abrir $name';
  }

  @override
  String markDone(String name) {
    return 'Marcar $name feito';
  }

  @override
  String markNotDone(String name) {
    return 'Retirar $name';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name, $count dias seguidos';
  }

  @override
  String get wdMo => '2ª';

  @override
  String get wdTu => '3ª';

  @override
  String get wdWe => '4ª';

  @override
  String get wdTh => '5ª';

  @override
  String get wdFr => '6ª';

  @override
  String get wdSa => 'sá';

  @override
  String get wdSu => 'do';

  @override
  String get seedRun => 'Corrida';

  @override
  String get seedEnglish => 'Inglês';

  @override
  String get seedStretch => 'Alongar';

  @override
  String get seedReading => 'Leitura';

  @override
  String get seedWater => 'Água';

  @override
  String get suggestGym => 'Ginásio';

  @override
  String get suggestRun => 'Corrida';

  @override
  String get suggestRead => 'Leitura';

  @override
  String get suggestWater => 'Água';

  @override
  String get suggestStretch => 'Alongar';
}
