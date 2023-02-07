import 'package:note_location_app/utils/log.dart';
import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    DebugLogger debugLogger = DebugLogger();
    debugLogger.logBLoc('${bloc.runtimeType} $change');
  }
}
