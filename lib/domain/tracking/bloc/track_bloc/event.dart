import 'package:note_location_app/common/status.dart';

abstract class TrackingEvent {
  const TrackingEvent();
}

class AddErrorTrackingEvent extends TrackingEvent {
  const AddErrorTrackingEvent({
    this.code,
    this.messageType,
    this.codeType,
    this.message,
  });
  final String? message;
  final int? code;
  final MessageType? messageType;
  final CodeType? codeType;
}

//====================================================================

class AddTrackingEvent extends TrackingEvent {
  const AddTrackingEvent();
}
