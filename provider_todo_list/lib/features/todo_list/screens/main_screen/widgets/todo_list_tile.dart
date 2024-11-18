import 'package:flutter/material.dart';
import 'package:provider_todo_list/common/constants/app_colors.dart';

import '../../../models/task.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        color: AppColors.grey,
        child: Text(task.title),
      ),
    );
  }
}
