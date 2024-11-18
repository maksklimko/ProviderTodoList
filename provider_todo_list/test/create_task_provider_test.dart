import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_todo_list/data/repositories/tasks_repository.dart';
import 'package:provider_todo_list/data/services/firestore_service.dart';
import 'package:provider_todo_list/features/todo_list/providers/create_task_provider.dart';

void main() {
  final instance = FakeFirebaseFirestore();
  final firestoreService = FirestoreService(instance);
  final tasksRepository = TasksRepository(firestoreService);

  test('clearTaskTitle resets taskTitleController and notifies listeners', () {
    final provider = CreateTaskProvider(tasksRepository: tasksRepository);
    provider.taskTitleController.text = 'Some text';

    provider.clearTaskTitle();

    expect(provider.taskTitleController.text, isEmpty);
  });
}
