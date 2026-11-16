import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'store.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0x00000000),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.paper,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(DayToDayApp(store: await HabitStore.open()));
}
