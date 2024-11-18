import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_todo_list/features/todo_list/models/task_status.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task{
  const factory Task({
    required String id,
    required String title,
    @Default(TaskStatus.todo) TaskStatus status,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json)
  => _$TaskFromJson(json);
}