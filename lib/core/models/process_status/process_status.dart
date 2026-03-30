import 'package:freezed_annotation/freezed_annotation.dart';

enum ProcessStatus {
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
}
