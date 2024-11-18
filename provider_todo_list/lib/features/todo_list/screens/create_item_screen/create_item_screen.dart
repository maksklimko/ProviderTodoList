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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Title",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,
                  ),
                ),
                TextField(controller: model.taskTitleController,),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: ()async{
                      model.createTask();
                      Navigator.pop(context);
                    },
                    child: Text("Continue"),
                  ),
                ),
                Spacer(flex: 5,),
              ],
            ),
          );
        },
      ),
    );
  }
}
