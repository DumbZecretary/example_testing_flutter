import 'dart:async';

import 'package:note_location_app/common/status.dart';
import 'package:note_location_app/domain/tracking/bloc/track_bloc/actions/action.dart';

import 'state.dart';
import 'package:bloc/bloc.dart';
import 'event.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  TrackingBloc({
    required TrackingState initState,
  }) : super(initState) {
    on<AddTrackingEvent>(addData);
    on<AddErrorTrackingEvent>(_addError);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(
      AddErrorTrackingEvent(
        message: error.toString(),
      ),
    );
    super.onError(error, stackTrace);
  }

  FutureOr<void> _addError(
      AddErrorTrackingEvent event, Emitter<TrackingState> emit) async {
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
