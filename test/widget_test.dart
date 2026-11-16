import 'package:daytoday/app.dart';
import 'package:daytoday/seed.dart';
import 'package:daytoday/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final today = DateTime(2026, 11, 16, 8);

  Future<HabitStore> pump(
    WidgetTester tester,
    Size size, {
    Locale locale = const Locale('en'),
  }) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = size;
    tester.platformDispatcher.localesTestValue = [locale];
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);

    final store = HabitStore(
      repository: MemoryRepository(),
      snapshot: seed(today),
    );
    await tester.pumpWidget(DayToDayApp(store: store, clock: () => today));
    await tester.pumpAndSettle();
    return store;
  }

  testWidgets('today is a notebook page with the plan', (tester) async {
    await pump(tester, const Size(390, 844));

    expect(find.text('Monday 16 November 2026'), findsOneWidget);
    expect(find.text("Today's plan"), findsOneWidget);
    expect(find.text('0 of 4'), findsOneWidget);
    expect(find.text('RUN'), findsOneWidget);
    expect(find.text('ENG'), findsOneWidget);
    expect(find.text('-lish'), findsOneWidget);
    expect(find.text('November'), findsWidgets);
  });

  testWidgets('a day opens, a habit can be checked, and a name makes a code', (
    tester,
  ) async {
    final store = await pump(tester, const Size(390, 844));

    await tester.tap(find.text('Monday 16 November 2026'));
    await tester.pumpAndSettle();

    expect(find.text('Monday 16 November'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Stretch'), findsNothing);

    await tester.tap(find.bySemanticsLabel('Mark English done'));
    await tester.pump();
    expect(store.isDone('eng', today), isTrue);

    await tester.tap(find.bySemanticsLabel('Back'));
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('New habit'));
    await tester.pumpAndSettle();
    expect(find.text('ABC'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Reading');
    await tester.pump();
    expect(find.text('REA'), findsWidgets);
  });

  testWidgets('a narrow phone lays the page out without overflowing', (
    tester,
  ) async {
    await pump(tester, const Size(320, 568));
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Monday 16 November 2026'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    await tester.tap(find.bySemanticsLabel('Open English'));
    await tester.pumpAndSettle();
    expect(find.text('Save changes'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('russian follows the phone language', (tester) async {
    await pump(tester, const Size(390, 844), locale: const Locale('ru'));

    expect(find.text('План на сегодня'), findsOneWidget);
    expect(find.text('0 из 4'), findsOneWidget);
    expect(find.text('пн'), findsWidgets);
    expect(find.text('ENG'), findsOneWidget);
  });

  testWidgets('arabic lays the page out from the right', (tester) async {
    await pump(tester, const Size(390, 844), locale: const Locale('ar'));

    expect(find.text('خطة اليوم'), findsOneWidget);
    expect(
      Directionality.of(tester.element(find.text('خطة اليوم'))),
      TextDirection.rtl,
    );
    expect(tester.takeException(), isNull);
  });
}
