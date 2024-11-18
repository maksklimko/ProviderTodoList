import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/common/constants/app_colors.dart';
import 'package:provider_todo_list/features/todo_list/providers/task_provider.dart';

import '../../../models/task.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final model = context.read<TaskProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        color: AppColors.grey,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            Text(task.title),
            GestureDetector(
              onTap: () => model.deleteTask(task),
              child: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
