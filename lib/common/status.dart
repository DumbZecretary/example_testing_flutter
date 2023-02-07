import 'package:equatable/equatable.dart';

enum StatusType {
  idle,
  start,
  loading,
  end,
  success,
  error,
  pause,
  resume,
}

enum MessageType {
  local,
  network,
  server,
}

enum CodeType {
  local,
  network,
  server,
}

class Status extends Equatable {
  const Status({
    required this.type,
    this.codes,
    this.messages,
  });

  final StatusType type;

  final Map<CodeType, int?>? codes;
  final Map<MessageType, String?>? messages;

  @override
  List<Object?> get props => [
        type,
        codes,
        messages,
      ];

  @override
  bool? get stringify => true;
}
