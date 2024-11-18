import 'package:flutter/material.dart';
import 'package:provider_todo_list/data/repositories/tasks_repository.dart';
import 'package:provider_todo_list/features/todo_list/models/task.dart';
import 'package:uuid/uuid.dart';

class CreateTaskProvider with ChangeNotifier {
  final TextEditingController taskTitleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future createTask() async {
    await TasksRepository.addTask(
      Task(id:Uuid().v4(),title: taskTitleController.text),
    );

    clearTaskTitle();
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
