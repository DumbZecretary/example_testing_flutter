import 'dart:async';

import 'package:note_location_app/common/status.dart';
import 'package:bloc/bloc.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/event.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/state.dart';

import '../bloc.dart';

extension SaveLoginBloc on LoginBloc {
  FutureOr<void> save(
      SaveUserLoginEvent event, Emitter<LoginState> emit) async {
    try {
      /// START ACTION
      emit(
        state.copyWith(
          status: const Status(
            type: StatusType.loading,
            codes: {
              CodeType.local: 100,
            },
            messages: {
              MessageType.local: "save user ...",
            },
          ),
        ),
      );

      await loginRepoSharedPreference?.saveLocalValue(
        value: event.userName,
      );

      emit(
        state.copyWith(
          userName: loginRepoSharedPreference?.getLocalValue(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: Status(
            type: StatusType.error,
            codes: state.status?.codes,
          ),
        ),
      );
    }

    /// END ACTION
    finally {
      emit(
        state.copyWith(
          status: Status(
            type: StatusType.idle,
            codes: state.status?.codes,
          ),
        ),
      );
    }
  }
}
