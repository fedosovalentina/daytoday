// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'DAY Today Plan';

  @override
  String get todayPlan => 'خطة اليوم';

  @override
  String weekdayPlan(String weekday) {
    return 'خطة $weekday';
  }

  @override
  String scoreOf(int done, int planned) {
    return '$done من $planned';
  }

  @override
  String get backToToday => 'العودة إلى اليوم';

  @override
  String get emptyPlan => 'اضغط + وأضف أول عادة.';

  @override
  String get freeDay => 'يوم فارغ.';

  @override
  String get nothingPlanned => 'لا شيء مخطط لهذا اليوم.';

  @override
  String get newHabit => 'عادة جديدة';

  @override
  String get addNewHabit => '+ عادة جديدة';

  @override
  String get nameLabel => 'الاسم';

  @override
  String get habitNameHint => 'اسم العادة';

  @override
  String get daysLabel => 'الأيام';

  @override
  String get colorLabel => 'اللون';

  @override
  String get saveHabit => 'حفظ العادة';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get archive => 'أرشفة';

  @override
  String progress(String month) {
    return 'التقدم · $month';
  }

  @override
  String get dayStreak => 'أيام متتالية';

  @override
  String get daysTotal => 'مجموع الأيام';

  @override
  String get leaveTitle => 'الخروج دون حفظ؟';

  @override
  String get leaveMessage => 'الاسم والأيام واللون تبقى كما كانت.';

  @override
  String get discard => 'تجاهل';

  @override
  String get keep => 'البقاء';

  @override
  String archiveTitle(String name) {
    return 'أرشفة $name؟';
  }

  @override
  String get archiveMessage => 'تختفي من الخطة. السجل يبقى على هذا الهاتف.';

  @override
  String get back => 'رجوع';

  @override
  String get previousMonth => 'الشهر السابق';

  @override
  String get nextMonth => 'الشهر التالي';

  @override
  String get adLabel => 'مساحة إعلان';

  @override
  String get adMark => 'إعلان';

  @override
  String openHabit(String name) {
    return 'فتح $name';
  }

  @override
  String markDone(String name) {
    return 'تعليم $name كمنجز';
  }

  @override
  String markNotDone(String name) {
    return 'إلغاء تعليم $name';
  }

  @override
  String habitCardLabel(String name, int count) {
    return '$name، سلسلة $count';
  }

  @override
  String get wdMo => 'ن';

  @override
  String get wdTu => 'ث';

  @override
  String get wdWe => 'ر';

  @override
  String get wdTh => 'خ';

  @override
  String get wdFr => 'ج';

  @override
  String get wdSa => 'س';

  @override
  String get wdSu => 'ح';

  @override
  String get seedRun => 'جري';

  @override
  String get seedEnglish => 'إنجليزية';

  @override
  String get seedStretch => 'تمدد';

  @override
  String get seedReading => 'قراءة';

  @override
  String get seedWater => 'ماء';

  @override
  String get suggestGym => 'نادي';

  @override
  String get suggestRun => 'جري';

  @override
  String get suggestRead => 'قراءة';

  @override
  String get suggestWater => 'ماء';

  @override
  String get suggestStretch => 'تمدد';
}
