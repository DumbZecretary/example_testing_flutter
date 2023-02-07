import 'package:note_location_app/config/app_view.dart';
import 'package:note_location_app/dependency/get_it.dart';
import 'package:note_location_app/domain/sample/bloc/sample_bloc/bloc.dart';
import 'package:note_location_app/domain/sample/repository/pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_location_app/domain/tracking/bloc/track_bloc/bloc.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/bloc.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/repository/pref.dart';

/// When ever you want to add Object to main context tree,
/// add this Object to [MultiRepositoryProvider]
/// When ever you create a new bloc by package bloc and want to use it from the start of app
/// as FlutterBloc package, you add this bloc to [MultiBlocProvider]
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          lazy: false,
          create: (context) => de.get<LoginRepoSharedPreference>(),
        ),
        // RepositoryProvider(
        //   lazy: false,
        //   create: (context) => de.get<UserRepoSharedPreference>(),
        // ),

        /// should be created as soon as possible because we've already created it at dependency
        /// [de] is the dependency instance that we created
        ///
        /// Example:
        // RepositoryProvider(
        //   lazy: false,
        //   create: (context) => de.get<UserRepoPref>(),
        // ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => de.get<LoginBloc>()
              ..loginRepoSharedPreference = de.get<LoginRepoSharedPreference>(),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => de.get<TrackingBloc>(),
          ),

          /// example
          // BlocProvider(
          //   lazy: false,
          //   create: (context) => de.get<UserBloc>(),
          // ),
        ],

        /// after all, the UI view can be built
        child: const AppView(),
      ),
    );
  }
}
