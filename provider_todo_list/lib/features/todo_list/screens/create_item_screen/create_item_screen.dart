import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/features/todo_list/providers/create_task_provider.dart';

class CreateItemScreen extends StatelessWidget {
  const CreateItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<CreateTaskProvider>();
    return Scaffold(
      body: ListenableBuilder(
        listenable: model,
        builder: (ctx, child) {
          return Form(
            key: model.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Title",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TextFormField(
                    controller: model.taskTitleController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a title';
                      }
                      if ((value?.length ?? 0) < 3) {
                        return 'Title is too short';
                      }
                      return null;
                    },
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        final isValid =
                            (model.formKey.currentState?.validate() ?? false);
                        if (!isValid) return;
                        model.createTask();
                        Navigator.pop(context);
                      },
                      child: Text("Continue"),
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
