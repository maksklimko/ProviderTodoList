import 'package:flutter/material.dart';
import 'package:provider_todo_list/data/services/firestore_service.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _tasks = await FirestoreService.fetchTasks();
    notifyListeners();
  }

  Future<void> addTask(String title) async {}

  Future<void> toggleTaskCompletion(String id) async {}

  Future<void> deleteTask(String id) async {}

  void listenToTaskChanges() {
    FirestoreService.addTasksChangesListener(
      onChange: (tasks) {
        _tasks = tasks;
        notifyListeners();
      },
    );
  }
}
