import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
    Locale('de'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh'),
  ];

  /// Product name. Do not translate.
  ///
  /// In en, this message translates to:
  /// **'DAY Today Plan'**
  String get appTitle;

  /// No description provided for @todayPlan.
  ///
  /// In en, this message translates to:
  /// **'Today\'s plan'**
  String get todayPlan;

  /// No description provided for @weekdayPlan.
  ///
  /// In en, this message translates to:
  /// **'{weekday}\'s plan'**
  String weekdayPlan(String weekday);

  /// No description provided for @scoreOf.
  ///
  /// In en, this message translates to:
  /// **'{done} of {planned}'**
  String scoreOf(int done, int planned);

  /// No description provided for @backToToday.
  ///
  /// In en, this message translates to:
  /// **'Back to today'**
  String get backToToday;

  /// No description provided for @emptyPlan.
  ///
  /// In en, this message translates to:
  /// **'Tap + and plant the first habit.'**
  String get emptyPlan;

  /// No description provided for @freeDay.
  ///
  /// In en, this message translates to:
  /// **'A free day.'**
  String get freeDay;

  /// No description provided for @nothingPlanned.
  ///
  /// In en, this message translates to:
  /// **'Nothing planned for this day.'**
  String get nothingPlanned;

  /// No description provided for @newHabit.
  ///
  /// In en, this message translates to:
  /// **'New habit'**
  String get newHabit;

  /// No description provided for @addNewHabit.
  ///
  /// In en, this message translates to:
  /// **'+ New habit'**
  String get addNewHabit;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @habitNameHint.
  ///
  /// In en, this message translates to:
  /// **'Habit name'**
  String get habitNameHint;

  /// No description provided for @daysLabel.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get daysLabel;

  /// No description provided for @colorLabel.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get colorLabel;

  /// No description provided for @saveHabit.
  ///
  /// In en, this message translates to:
  /// **'Save habit'**
  String get saveHabit;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress · {month}'**
  String progress(String month);

  /// No description provided for @dayStreak.
  ///
  /// In en, this message translates to:
  /// **'day streak'**
  String get dayStreak;

  /// No description provided for @daysTotal.
  ///
  /// In en, this message translates to:
  /// **'days total'**
  String get daysTotal;

  /// No description provided for @leaveTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave without saving?'**
  String get leaveTitle;

  /// No description provided for @leaveMessage.
  ///
  /// In en, this message translates to:
  /// **'The name, days, and color stay as they were.'**
  String get leaveMessage;

  /// No description provided for @discard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get discard;

  /// No description provided for @keep.
  ///
  /// In en, this message translates to:
  /// **'Keep'**
  String get keep;

  /// No description provided for @archiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Archive {name}?'**
  String archiveTitle(String name);

  /// No description provided for @archiveMessage.
  ///
  /// In en, this message translates to:
  /// **'It leaves the plan. The history stays on this phone.'**
  String get archiveMessage;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @previousMonth.
  ///
  /// In en, this message translates to:
  /// **'Previous month'**
  String get previousMonth;

  /// No description provided for @nextMonth.
  ///
  /// In en, this message translates to:
  /// **'Next month'**
  String get nextMonth;

  /// No description provided for @adLabel.
  ///
  /// In en, this message translates to:
  /// **'Advertisement placeholder'**
  String get adLabel;

  /// No description provided for @adMark.
  ///
  /// In en, this message translates to:
  /// **'AD'**
  String get adMark;

  /// No description provided for @openHabit.
  ///
  /// In en, this message translates to:
  /// **'Open {name}'**
  String openHabit(String name);

  /// No description provided for @markDone.
  ///
  /// In en, this message translates to:
  /// **'Mark {name} done'**
  String markDone(String name);

  /// No description provided for @markNotDone.
  ///
  /// In en, this message translates to:
  /// **'Mark {name} not done'**
  String markNotDone(String name);

  /// No description provided for @habitCardLabel.
  ///
  /// In en, this message translates to:
  /// **'{name}, {count, plural, =1{1 day streak} other{{count} day streak}}'**
  String habitCardLabel(String name, int count);

  /// No description provided for @wdMo.
  ///
  /// In en, this message translates to:
  /// **'Mo'**
  String get wdMo;

  /// No description provided for @wdTu.
  ///
  /// In en, this message translates to:
  /// **'Tu'**
  String get wdTu;

  /// No description provided for @wdWe.
  ///
  /// In en, this message translates to:
  /// **'We'**
  String get wdWe;

  /// No description provided for @wdTh.
  ///
  /// In en, this message translates to:
  /// **'Th'**
  String get wdTh;

  /// No description provided for @wdFr.
  ///
  /// In en, this message translates to:
  /// **'Fr'**
  String get wdFr;

  /// No description provided for @wdSa.
  ///
  /// In en, this message translates to:
  /// **'Sa'**
  String get wdSa;

  /// No description provided for @wdSu.
  ///
  /// In en, this message translates to:
  /// **'Su'**
  String get wdSu;

  /// No description provided for @seedRun.
  ///
  /// In en, this message translates to:
  /// **'Run'**
  String get seedRun;

  /// No description provided for @seedEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get seedEnglish;

  /// No description provided for @seedStretch.
  ///
  /// In en, this message translates to:
  /// **'Stretch'**
  String get seedStretch;

  /// No description provided for @seedReading.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get seedReading;

  /// No description provided for @seedWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get seedWater;

  /// No description provided for @suggestGym.
  ///
  /// In en, this message translates to:
  /// **'Gym'**
  String get suggestGym;

  /// No description provided for @suggestRun.
  ///
  /// In en, this message translates to:
  /// **'Run'**
  String get suggestRun;

  /// No description provided for @suggestRead.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get suggestRead;

  /// No description provided for @suggestWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get suggestWater;

  /// No description provided for @suggestStretch.
  ///
  /// In en, this message translates to:
  /// **'Stretch'**
  String get suggestStretch;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'ja',
    'ko',
    'nl',
    'pt',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
