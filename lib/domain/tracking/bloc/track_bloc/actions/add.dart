import 'dart:async';

import 'package:note_location_app/common/status.dart';
import 'package:bloc/bloc.dart';
import 'package:note_location_app/dependency/get_it.dart';
import 'package:note_location_app/domain/tracking/bloc/track_bloc/event.dart';
import 'package:note_location_app/domain/tracking/bloc/track_bloc/state.dart';
import 'package:note_location_app/domain/tracking/utils/get_location.dart';
import 'package:note_location_app/domain/user/bloc/login_bloc/bloc.dart';

import '../bloc.dart';

extension AddTrackingBloc on TrackingBloc {
  FutureOr<void> addData(
      AddTrackingEvent event, Emitter<TrackingState> emit) async {
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
              MessageType.local: "add data ...",
            },
          ),
          data: state.data ?? [],
        ),
      );

      final data = await getLocation();
      var newData = state.data;
      newData
          ?.add("${de.get<LoginBloc>().state.userName ?? "Unkown user"} $data");

      emit(
        state.copyWith(
          data: newData,
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
