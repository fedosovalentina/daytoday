// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => '今日の予定';

  @override
  String weekdayPlan(String weekday) {
    return '$weekdayの予定';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done/$planned';
  }

  @override
  String get backToToday => '今日に戻る';

  @override
  String get emptyPlan => '＋を押して、最初の習慣を植えてください。';

  @override
  String get freeDay => '予定のない日。';

  @override
  String get nothingPlanned => 'この日の予定はありません。';

  @override
  String get newHabit => '新しい習慣';

  @override
  String get addNewHabit => '＋ 新しい習慣';

  @override
  String get nameLabel => '名前';

  @override
  String get habitNameHint => '習慣の名前';

  @override
  String get daysLabel => '曜日';

  @override
  String get colorLabel => '色';

  @override
  String get saveHabit => '習慣を保存';

  @override
  String get saveChanges => '変更を保存';

  @override
  String get archive => 'アーカイブ';

  @override
  String progress(String month) {
    return '進捗 · $month';
  }

  @override
  String get dayStreak => '連続日数';

  @override
  String get daysTotal => '合計日数';

  @override
  String get leaveTitle => '保存せずに戻りますか？';

  @override
  String get leaveMessage => '名前、曜日、色はそのまま残ります。';

  @override
  String get discard => '破棄';

  @override
  String get keep => '残る';

  @override
  String archiveTitle(String name) {
    return '$nameをアーカイブしますか？';
  }

  @override
  String get archiveMessage => '予定から外れます。記録はこの端末に残ります。';

  @override
  String get back => '戻る';

  @override
  String get previousMonth => '前の月';

  @override
  String get nextMonth => '次の月';

  @override
  String get adLabel => '広告スペース';

  @override
  String get adMark => '広告';

  @override
  String openHabit(String name) {
    return '$nameを開く';
  }

  @override
  String markDone(String name) {
    return '$nameを完了にする';
  }

  @override
  String markNotDone(String name) {
    return '$nameの完了を取り消す';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name、$count日連続';
  }

  @override
  String get wdMo => '月';

  @override
  String get wdTu => '火';

  @override
  String get wdWe => '水';

  @override
  String get wdTh => '木';

  @override
  String get wdFr => '金';

  @override
  String get wdSa => '土';

  @override
  String get wdSu => '日';

  @override
  String get seedRun => 'ランニング';

  @override
  String get seedEnglish => '英語';

  @override
  String get seedStretch => 'ストレッチ';

  @override
  String get seedReading => '読書';

  @override
  String get seedWater => '水';

  @override
  String get suggestGym => 'ジム';

  @override
  String get suggestRun => 'ランニング';

  @override
  String get suggestRead => '読書';

  @override
  String get suggestWater => '水';

  @override
  String get suggestStretch => 'ストレッチ';
}
