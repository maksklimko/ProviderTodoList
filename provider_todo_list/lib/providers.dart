import 'package:provider/provider.dart';
import 'package:provider_todo_list/features/todo_list/providers/create_task_provider.dart';
import 'package:provider_todo_list/features/todo_list/providers/task_provider.dart';
class Providers {
  Providers._();
  static final providers= [
    ChangeNotifierProvider<TaskProvider>(
      create: (_) =>  TaskProvider()..listenToTaskChanges(),
    ),
    ChangeNotifierProvider<CreateTaskProvider>(
      create: (_) =>  CreateTaskProvider(),
    ),
  ].toList();
}