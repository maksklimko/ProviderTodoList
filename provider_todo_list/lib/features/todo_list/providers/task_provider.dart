import 'package:flutter/material.dart';
import 'package:provider_todo_list/data/repositories/tasks_repository.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _tasks = await TasksRepository.fetchTasks();
    notifyListeners();
  }

  Future<void> toggleTaskCompletion(String id) async {}

  Future<void> deleteTask(String id) async {}

  void listenToTaskChanges() {
    TasksRepository.addTasksChangesListener(
      onChange: (tasks) {
        _tasks = tasks;
        notifyListeners();
      },
    );
  }
}
