import 'package:note_location_app/common/status.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status,
    this.userName,
  });

  final Status? status;

  final String? userName;

  LoginState copyWith({
    Status? status,
    String? userName,
  }) {
    return LoginState(
      status: status ?? this.status,
      userName: userName ?? this.userName,
    );
  }

  LoginState initial() {
    return const LoginState(
      status: Status(
        type: StatusType.start,
      ),
    );
  }

  @override
  List<Object?> get props => [
        status,
        userName,
      ];
  @override
  bool? get stringify => true;
}
