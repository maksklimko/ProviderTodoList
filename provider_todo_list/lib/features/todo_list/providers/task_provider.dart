import 'package:flutter/material.dart';
import 'package:provider_todo_list/data/repositories/tasks_repository.dart';
import 'package:provider_todo_list/features/todo_list/models/task_status.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final TasksRepository tasksRepository;
  List<Task> _tasks = [];

  TaskProvider({required this.tasksRepository});

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _tasks = await tasksRepository.fetchTasks();
    notifyListeners();
  }

  Future<void> toggleTaskCompletion(Task task) async {
    final newTaskStatus = task.status == TaskStatus.completed
        ? TaskStatus.todo
        : TaskStatus.completed;
    _tasks = await tasksRepository.changeTaskStatus(task, newTaskStatus);
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    await tasksRepository.deleteTask(task);
  }

  void listenToTaskChanges() {
    tasksRepository.addTasksChangesListener(
      onChange: (tasks) {
        if (tasks.length != _tasks.length) {
          _tasks = tasks;
          notifyListeners();
        }
      },
    );
  }
}
