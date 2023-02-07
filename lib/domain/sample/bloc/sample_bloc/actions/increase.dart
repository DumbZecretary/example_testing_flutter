import 'dart:async';

import 'package:note_location_app/common/status.dart';
import 'package:note_location_app/domain/sample/bloc/sample_bloc/event.dart';
import 'package:note_location_app/domain/sample/bloc/sample_bloc/state.dart';
import 'package:bloc/bloc.dart';

import '../bloc.dart';

extension IncreaseSampleBloc on SampleBloc {
  FutureOr<void> increase(
      IncreaseSampleEvent event, Emitter<SampleState> emit) async {
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
              MessageType.local: "increase ...",
            },
          ),
        ),
      );

      /// WHEN REQUEST LOGIN
      final response = await sampleRepoSharedPreference?.saveLocalValue(
        value: state.value == null ? 0 : state.value! + 1,
      );

      /// THEN FAIL TO LOGIN
      if (response == null || !response) {
        emit(
          state.copyWith(
            value: 0,
            status: Status(
              type: StatusType.error,
              codes: state.status?.codes
                ?..addAll(
                  {
                    CodeType.server: 101,
                  },
                ),
              messages: const {
                MessageType.local: "Fail to save local data",
                MessageType.server: "Fail to save local data",
              },
            ),
          ),
        );
      }

      /// THEN SUCCESS
      else {
        emit(
          state.copyWith(
            value: state.value == null ? 0 : state.value! + 1,
            status: Status(
              type: StatusType.success,
              codes: state.status?.codes
                ?..addAll(
                  {
                    CodeType.server: 200,
                  },
                ),
              messages: const {
                MessageType.local: "Success increase value",
                MessageType.server: "Success save increase value",
              },
            ),
          ),
        );
      }
    }

    /// UNKNOWN ERROR
    catch (e) {
      add(
        AddErrorSampleEvent(
          message: e.toString(),
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
