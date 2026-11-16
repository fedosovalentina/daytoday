import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'l10n/app_localizations.dart';
import 'models.dart';

extension Copy on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// First-launch names follow the phone language. An empty locale list
/// stays English, so a test binding cannot plant Arabic by accident.
AppLocalizations deviceCopy() {
  final preferred = WidgetsBinding.instance.platformDispatcher.locales;
  final locale = basicLocaleListResolution(
    preferred.isEmpty ? const [Locale('en')] : preferred,
    AppLocalizations.supportedLocales,
  );
  return lookupAppLocalizations(locale);
}

List<String> shortWeekdays(AppLocalizations l10n) => [
  l10n.wdMo,
  l10n.wdTu,
  l10n.wdWe,
  l10n.wdTh,
  l10n.wdFr,
  l10n.wdSa,
  l10n.wdSu,
];

String weekdayList(Set<int> days, AppLocalizations l10n) {
  final shorts = shortWeekdays(l10n);
  return [
    for (var index = 0; index < shorts.length; index++)
      if (days.contains(index + 1)) shorts[index],
  ].join(' · ');
}

String _tag(BuildContext context) => Localizations.localeOf(context).toString();

bool _english(BuildContext context) =>
    Localizations.localeOf(context).languageCode == 'en';

/// English keeps the notebook order from the frames: Monday 16 November 2026.
String longDate(BuildContext context, DateTime day) {
  final tag = _tag(context);
  if (_english(context)) return DateFormat('EEEE d MMMM y', tag).format(day);
  return DateFormat.yMMMMEEEEd(tag).format(day);
}

String mediumDate(BuildContext context, DateTime day) {
  final tag = _tag(context);
  if (_english(context)) return DateFormat('EEEE d MMMM', tag).format(day);
  return DateFormat.MMMMEEEEd(tag).format(day);
}

String monthName(BuildContext context, DateTime day) =>
    DateFormat.MMMM(_tag(context)).format(day);

String planTitle(BuildContext context, DateTime day, DateTime today) {
  final l10n = context.l10n;
  if (sameDay(day, today)) return l10n.todayPlan;
  final weekday = DateFormat.EEEE(_tag(context)).format(day);
  return l10n.weekdayPlan(weekday);
}

String scoreLabel(BuildContext context, int done, int planned) =>
    context.l10n.scoreOf(done, planned);
