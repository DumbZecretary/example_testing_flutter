import 'package:note_location_app/domain/sample/router/transition.dart';
import 'package:go_router/go_router.dart';

import 'screens.dart';

final routerTracking = [
  GoRoute(
    name: TrackingScreenName.list,
    path: TrackingScreenName.list,
    pageBuilder: (context, state) {
      return buildPageWithDefaultTransition(
        state: state,
        context: context,
        child: const ListScreen(),
      );
    },
  ),
];

class TrackingScreenName {
  static const String list = '/list';
}
