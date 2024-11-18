import 'package:flutter/material.dart';
import 'package:provider_todo_list/data/repositories/tasks_repository.dart';
import 'package:provider_todo_list/features/todo_list/models/task_status.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _tasks = await TasksRepository.fetchTasks();
    notifyListeners();
  }

  Future<void> toggleTaskCompletion(Task task) async {
    final newTaskStatus = task.status == TaskStatus.completed
        ? TaskStatus.todo
        : TaskStatus.completed;
    _tasks = await TasksRepository.changeTaskStatus(task, newTaskStatus);
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    await TasksRepository.deleteTask(task);
  }

  void listenToTaskChanges() {
    TasksRepository.addTasksChangesListener(
      onChange: (tasks) {
        if (tasks.length != _tasks.length) {
          _tasks = tasks;
          notifyListeners();
        }
      },
    );
  }
}
