import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/features/todo_list/providers/task_provider.dart';
import 'package:provider_todo_list/features/todo_list/screens/main_screen/widgets/todo_list_tile.dart';
import 'package:provider_todo_list/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final model = context.read<TaskProvider>();
    return Scaffold(
      body: ListenableBuilder(
          listenable: model,
          builder: (ctx, child) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      model.tasks.map((e) => TodoListTile(task: e)).toList(),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.createItemScreen),
        child: const Icon(Icons.add),
      ),
    );
  }
}
