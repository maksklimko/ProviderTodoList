import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/features/todo_list/providers/create_task_provider.dart';
import 'package:provider_todo_list/features/todo_list/providers/task_provider.dart';

import 'data/repositories/tasks_repository.dart';
import 'data/services/firestore_service.dart';

class Providers {
  Providers._();

  static final providers = [
    Provider<FirestoreService>(
      create: (context) => FirestoreService(FirebaseFirestore.instance),
    ),
    ProxyProvider<FirestoreService, TasksRepository>(
      update: (context, firestoreService, _) =>
          TasksRepository(firestoreService),
    ),
    ListenableProxyProvider<TasksRepository, TaskProvider>(
      update: (context, tasksRepository, _) =>
          TaskProvider(tasksRepository: tasksRepository)..listenToTaskChanges(),
    ),
    ListenableProxyProvider<TasksRepository, CreateTaskProvider>(
      update: (context, tasksRepository, _) =>
          CreateTaskProvider(tasksRepository: tasksRepository),
    ),
  ].toList();
}
