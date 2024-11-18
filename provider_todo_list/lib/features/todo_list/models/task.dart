import 'package:provider_todo_list/features/todo_list/models/task_status.dart';

class Task {
  final String id; // Task identifier
  final String title; // Title of the task
  final TaskStatus status; // Status of the task

  Task({
    required this.id,
    required this.title,
    this.status = TaskStatus.todo,
  });

  // Factory method to create a Task object from JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      status:  TaskStatus.fromJson(json['status']),
    );
  }

  // Method to convert a Task object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status,
    };
  }
}