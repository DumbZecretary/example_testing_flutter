import 'package:note_location_app/domain/sample/router/transition.dart';
import 'package:go_router/go_router.dart';

import 'screens.dart';

final routerUser = [
  GoRoute(
    name: UserScreenName.home,
    path: UserScreenName.home,
    pageBuilder: (context, state) {
      return buildPageWithDefaultTransition(
        state: state,
        context: context,
        child: const HomeScreen(),
      );
    },
  ),
];

class UserScreenName {
  static const String home = '/';
}
