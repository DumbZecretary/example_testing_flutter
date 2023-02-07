import 'package:note_location_app/config/app_bloc_observer.dart';
import 'package:bloc/bloc.dart';

import 'environment.dart';

Future<void> initialSettingApp() async {
  Bloc.observer = AppBlocObserver();

  /// if we run this project on web, please open this cmt:
  // setUrlStrategy(PathUrlStrategy());

  /// another way to set url strategy
  // usePathUrlStrategy();

  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.local,
  );

  Environment().initConfig(environment);
}
