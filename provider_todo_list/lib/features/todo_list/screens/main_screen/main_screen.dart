import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/data/services/firestore_service.dart';
import 'package:provider_todo_list/features/todo_list/providers/task_provider.dart';
import 'package:provider_todo_list/features/todo_list/screens/main_screen/widgets/todo_list_tile.dart';
import 'package:provider_todo_list/providers.dart';
import 'package:provider_todo_list/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final _model = context.read<TaskProvider>();
    return Scaffold(
      body: ListenableBuilder(
          listenable: _model,
          builder: (ctx, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    _model.tasks.map((e) => TodoListTile(task: e)).toList(),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
