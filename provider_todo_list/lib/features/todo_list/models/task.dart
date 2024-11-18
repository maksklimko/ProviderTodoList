import 'package:provider_todo_list/features/todo_list/models/task_status.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String title;
  final TaskStatus status;

  Task.firestore({
    required this.id,
    required this.title,
    this.status = TaskStatus.todo,
  });

  Task({
    required this.title,
    this.status = TaskStatus.todo,
  }) :id = Uuid().v4();

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task.firestore(
      id: json['id'] as String,
      title: json['title'] as String,
      status:  TaskStatus.fromJson(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status.name,
    };
  }

  Task copyWith({
    String? id,
    String? title,
    TaskStatus? status,
  }) {
    return Task.firestore(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
    );
  }
}