// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => '今天的计划';

  @override
  String weekdayPlan(String weekday) {
    return '$weekday的计划';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done/$planned';
  }

  @override
  String get backToToday => '回到今天';

  @override
  String get emptyPlan => '点 +，种下第一个习惯。';

  @override
  String get freeDay => '今天空着。';

  @override
  String get nothingPlanned => '这一天没有安排。';

  @override
  String get newHabit => '新习惯';

  @override
  String get addNewHabit => '+ 新习惯';

  @override
  String get nameLabel => '名称';

  @override
  String get habitNameHint => '习惯名称';

  @override
  String get daysLabel => '星期';

  @override
  String get colorLabel => '颜色';

  @override
  String get saveHabit => '保存习惯';

  @override
  String get saveChanges => '保存更改';

  @override
  String get archive => '归档';

  @override
  String progress(String month) {
    return '进度 · $month';
  }

  @override
  String get dayStreak => '连续天数';

  @override
  String get daysTotal => '累计天数';

  @override
  String get leaveTitle => '不保存就离开？';

  @override
  String get leaveMessage => '名称、星期和颜色保持原样。';

  @override
  String get discard => '放弃';

  @override
  String get keep => '留下';

  @override
  String archiveTitle(String name) {
    return '归档「$name」？';
  }

  @override
  String get archiveMessage => '它会离开计划。记录仍留在这台手机上。';

  @override
  String get back => '返回';

  @override
  String get previousMonth => '上个月';

  @override
  String get nextMonth => '下个月';

  @override
  String get adLabel => '广告位';

  @override
  String get adMark => '广告';

  @override
  String openHabit(String name) {
    return '打开$name';
  }

  @override
  String markDone(String name) {
    return '标记$name完成';
  }

  @override
  String markNotDone(String name) {
    return '取消$name的完成';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name，连续 $count 天';
  }

  @override
  String get wdMo => '一';

  @override
  String get wdTu => '二';

  @override
  String get wdWe => '三';

  @override
  String get wdTh => '四';

  @override
  String get wdFr => '五';

  @override
  String get wdSa => '六';

  @override
  String get wdSu => '日';

  @override
  String get seedRun => '跑步';

  @override
  String get seedEnglish => '英语';

  @override
  String get seedStretch => '拉伸';

  @override
  String get seedReading => '阅读';

  @override
  String get seedWater => '喝水';

  @override
  String get suggestGym => '健身';

  @override
  String get suggestRun => '跑步';

  @override
  String get suggestRead => '阅读';

  @override
  String get suggestWater => '喝水';

  @override
  String get suggestStretch => '拉伸';
}
