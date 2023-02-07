import 'package:note_location_app/common/status.dart';
import 'package:equatable/equatable.dart';

class SampleState extends Equatable {
  const SampleState({
    this.status,
    this.value,
  });

  final Status? status;

  final int? value;

  SampleState copyWith({
    Status? status,
    int? value,
  }) {
    return SampleState(
      status: status ?? this.status,
      value: value ?? this.value,
    );
  }

  SampleState initial() {
    return const SampleState(
      status: Status(
        type: StatusType.idle,
      ),
    );
  }

  @override
  List<Object?> get props => [
        status,
        value,
      ];
  @override
  bool? get stringify => true;
}
