import 'package:note_location_app/common/status.dart';

abstract class SampleEvent {
  const SampleEvent();
}

class AddErrorSampleEvent extends SampleEvent {
  const AddErrorSampleEvent({
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

class IncreaseSampleEvent extends SampleEvent {
  const IncreaseSampleEvent({
    this.isDouble = false,
  });
  final bool? isDouble;
}
