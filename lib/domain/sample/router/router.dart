import 'package:note_location_app/domain/sample/router/transition.dart';
import 'package:go_router/go_router.dart';

import 'screens.dart';

final routerSample = [
  GoRoute(
    name: SampleScreenName.home,
    path: SampleScreenName.home,
    pageBuilder: (context, state) {
      return buildPageWithDefaultTransition(
        state: state,
        context: context,
        child: const SampleHomeScreen(),
      );
    },
  ),
  GoRoute(
    name: SampleScreenName.feature,
    path: SampleScreenName.feature,
    pageBuilder: (context, state) {
      return buildPageWithDefaultTransition(
        state: state,
        context: context,
        child: const SampleFeatureScreen(

            /// example query:
            // apiKey: state.queryParams['api-key'],
            ),
      );
    },
  ),
];

class SampleScreenName {
  static const String home = '/';
  static const String feature = "/feature";
}
