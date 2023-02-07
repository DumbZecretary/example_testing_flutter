import 'dart:async';

import 'package:note_location_app/common/status.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/actions/save.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/repository/pref.dart';

import 'state.dart';
import 'package:bloc/bloc.dart';
import 'event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    this.loginRepoSharedPreference,
    required LoginState initState,
  }) : super(initState) {
    on<SaveUserLoginEvent>(save);
    on<AddErrorLoginEvent>(_addError);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(
      AddErrorLoginEvent(
        message: error.toString(),
      ),
    );
    super.onError(error, stackTrace);
  }

  LoginRepoSharedPreference? loginRepoSharedPreference;

  FutureOr<void> _addError(
      AddErrorLoginEvent event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        status: Status(
          type: StatusType.error,
          messages: state.status?.messages
            ?..addAll(
              {
                MessageType.local: event.message,
              },
            ),
        ),
      ),
    );
  }
}
