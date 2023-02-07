import 'package:go_router/go_router.dart';
import 'package:note_location_app/domain/tracking/router/router.dart';
import 'package:note_location_app/domain/user/router/router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',

  /// If we want error page 404
  // errorPageBuilder: (context, state) {
  //   return buildPageWithDefaultTransition(
  //     state: state,
  //     context: context,
  //     child: const PageNotFoundScreen(),
  //   );
  // },
  routes: [
    ...routerUser,
    ...routerTracking,
  ],
);
