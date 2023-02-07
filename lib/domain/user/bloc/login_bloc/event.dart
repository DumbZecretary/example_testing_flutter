import 'package:note_location_app/common/status.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class AddErrorLoginEvent extends LoginEvent {
  const AddErrorLoginEvent({
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

class SaveUserLoginEvent extends LoginEvent {
  const SaveUserLoginEvent({
    required this.userName,
  });
  final String userName;
}
