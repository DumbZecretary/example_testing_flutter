import 'dart:async';

import 'package:flutter/material.dart';

import 'config/app.dart';
import 'config/initial_setting.dart';
import 'dependency/get_it.dart';
import 'utils/log.dart';

void main() async {
  await initialSettingApp();

  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap();
}

Future<void> bootstrap() async {
  /// only open comment when we need to see a short of error log
  // FlutterError.onError = (details) {
  //   debugLogger.error(details.exceptionAsString(), details.stack);
  // };

  runZonedGuarded(
    () async {
      await De().initial();
      runApp(
        const App(),
      );
    },
    (error, stackTrace) {
      debugLogger.error(error.toString());
    },
  );
}
