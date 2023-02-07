import 'dart:async';

import 'package:note_location_app/common/status.dart';
import 'package:note_location_app/domain/sample/repository/pref.dart';

import 'state.dart';
import 'package:bloc/bloc.dart';
import 'event.dart';

import 'actions/action.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc({
    this.sampleRepoSharedPreference,
    required SampleState initState,
  }) : super(initState) {
    on<IncreaseSampleEvent>(increase);
    on<AddErrorSampleEvent>(_addError);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(
      AddErrorSampleEvent(
        message: error.toString(),
      ),
    );
    super.onError(error, stackTrace);
  }

  SampleRepoSharedPreference? sampleRepoSharedPreference;

  FutureOr<void> _addError(
      AddErrorSampleEvent event, Emitter<SampleState> emit) async {
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
