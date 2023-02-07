import 'package:note_location_app/common/status.dart';
import 'package:equatable/equatable.dart';

class TrackingState extends Equatable {
  const TrackingState({
    this.status,
    this.data,
  });

  final Status? status;

  final List<String?>? data;

  TrackingState copyWith({
    Status? status,
    List<String?>? data,
  }) {
    return TrackingState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  TrackingState initial() {
    return const TrackingState(
      status: Status(
        type: StatusType.idle,
      ),
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
      ];
  @override
  bool? get stringify => true;
}
