import 'package:flutter/material.dart';
import 'package:provider_todo_list/data/repositories/tasks_repository.dart';
import 'package:provider_todo_list/features/todo_list/models/task.dart';

class CreateTaskProvider with ChangeNotifier {
  final TextEditingController taskTitleController = TextEditingController();

  Future createTask() async {
    await TasksRepository.addTask(
      Task(title: taskTitleController.text),
    );
  }

  void clearTaskTitle() {
    taskTitleController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    taskTitleController.dispose();
    super.dispose();
  }
}
