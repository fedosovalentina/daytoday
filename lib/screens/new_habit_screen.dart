import 'package:flutter/material.dart';

import '../app.dart';
import '../copy.dart';
import '../models.dart';
import '../theme.dart';
import '../widgets/paper.dart';
import '../widgets/plan.dart';

class NewHabitScreen extends StatefulWidget {
  const NewHabitScreen({super.key, required this.weekday});

  final int weekday;

  @override
  State<NewHabitScreen> createState() => _NewHabitScreenState();
}

class _NewHabitScreenState extends State<NewHabitScreen> {
  final _name = TextEditingController();
  late final Set<int> _days = {widget.weekday};
  HabitTone _tone = HabitTone.pink;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  bool get _ready => _name.text.trim().isNotEmpty && _days.isNotEmpty;

  void _save() {
    if (!_ready) return;
    HabitScope.of(context).save(
      Habit(
        id: 'h${DateTime.now().microsecondsSinceEpoch}',
        name: _name.text.trim(),
        tone: _tone,
        days: _days,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final code = HabitLabel.fromName(_name.text).code;
    return PaperScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, pageInset, 0),
            child: Row(
              children: [
                BackChevron(onPressed: () => Navigator.of(context).pop()),
                const SizedBox(width: 4),
                MarkerText(
                  context.l10n.newHabit,
                  style: AppText.of(size: 26, weight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(pageInset, 22, pageInset, 16),
              children: [
                Text(
                  context.l10n.nameLabel,
                  style: AppText.of(size: 18, weight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                HabitNameField(
                  controller: _name,
                  code: code,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 14),
                SuggestionChips(
                  onPick: (name, tone) {
                    _name.text = name;
                    setState(() => _tone = tone);
                  },
                ),
                const SizedBox(height: 28),
                Text(
                  context.l10n.daysLabel,
                  style: AppText.of(size: 18, weight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                WeekdayPicker(
                  selected: _days,
                  color: _tone.color,
                  onToggle: (weekday) {
                    setState(() {
                      if (!_days.add(weekday)) _days.remove(weekday);
                    });
                  },
                ),
                const SizedBox(height: 28),
                Text(
                  context.l10n.colorLabel,
                  style: AppText.of(size: 18, weight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                TonePicker(
                  selected: _tone,
                  onChanged: (tone) => setState(() => _tone = tone),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(pageInset, 0, pageInset, 12),
            child: PrimaryButton(
              label: context.l10n.saveHabit,
              onPressed: _ready ? _save : null,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 12), child: AdSlot()),
        ],
      ),
    );
  }
}
