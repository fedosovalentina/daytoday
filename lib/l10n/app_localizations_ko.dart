// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => '오늘의 계획';

  @override
  String weekdayPlan(String weekday) {
    return '$weekday 계획';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done/$planned';
  }

  @override
  String get backToToday => '오늘로 돌아가기';

  @override
  String get emptyPlan => '+를 눌러 첫 습관을 심어 보세요.';

  @override
  String get freeDay => '비어 있는 날.';

  @override
  String get nothingPlanned => '이 날에는 계획이 없어요.';

  @override
  String get newHabit => '새 습관';

  @override
  String get addNewHabit => '+ 새 습관';

  @override
  String get nameLabel => '이름';

  @override
  String get habitNameHint => '습관 이름';

  @override
  String get daysLabel => '요일';

  @override
  String get colorLabel => '색';

  @override
  String get saveHabit => '습관 저장';

  @override
  String get saveChanges => '변경 저장';

  @override
  String get archive => '보관';

  @override
  String progress(String month) {
    return '진행 · $month';
  }

  @override
  String get dayStreak => '연속 일수';

  @override
  String get daysTotal => '총 일수';

  @override
  String get leaveTitle => '저장하지 않고 나갈까요?';

  @override
  String get leaveMessage => '이름, 요일, 색은 그대로 남아요.';

  @override
  String get discard => '버리기';

  @override
  String get keep => '남기';

  @override
  String archiveTitle(String name) {
    return '$name을(를) 보관할까요?';
  }

  @override
  String get archiveMessage => '계획에서 사라져요. 기록은 이 휴대폰에 남아요.';

  @override
  String get back => '뒤로';

  @override
  String get previousMonth => '이전 달';

  @override
  String get nextMonth => '다음 달';

  @override
  String get adLabel => '광고 자리';

  @override
  String get adMark => '광고';

  @override
  String openHabit(String name) {
    return '$name 열기';
  }

  @override
  String markDone(String name) {
    return '$name 완료로 표시';
  }

  @override
  String markNotDone(String name) {
    return '$name 완료 취소';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name, $count일 연속';
  }

  @override
  String get wdMo => '월';

  @override
  String get wdTu => '화';

  @override
  String get wdWe => '수';

  @override
  String get wdTh => '목';

  @override
  String get wdFr => '금';

  @override
  String get wdSa => '토';

  @override
  String get wdSu => '일';

  @override
  String get seedRun => '달리기';

  @override
  String get seedEnglish => '영어';

  @override
  String get seedStretch => '스트레칭';

  @override
  String get seedReading => '독서';

  @override
  String get seedWater => '물';

  @override
  String get suggestGym => '운동';

  @override
  String get suggestRun => '달리기';

  @override
  String get suggestRead => '독서';

  @override
  String get suggestWater => '물';

  @override
  String get suggestStretch => '스트레칭';
}
