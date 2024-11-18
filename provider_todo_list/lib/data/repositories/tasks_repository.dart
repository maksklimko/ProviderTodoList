import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider_todo_list/common/constants/firestore_collections.dart';
import '../../features/todo_list/models/task.dart';
import '../../features/todo_list/models/task_status.dart';
import '../services/firestore_service.dart';

class TasksRepository {
  final FirestoreService _firestoreService;
  final String _userId = 'testUser';

  TasksRepository(this._firestoreService);

  Future<List<Task>> fetchTasks() async {
    try {
      final data = await _firestoreService.fetchDocument(
        collection: FirestoreCollections.usersCollection,
        docId: _userId,
      );

      final tasksData = data?['tasks'] as List<dynamic>?;
      if (tasksData != null) {
        return tasksData.map((task) => Task.fromJson(task)).toList();
      }
      return [];
    } catch (e) {
      print('Error fetching tasks: $e');
      return [];
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await _firestoreService.updateDocument(
        collection: FirestoreCollections.usersCollection,
        docId: _userId,
        updates: {
          'tasks': FieldValue.arrayUnion([task.toJson()]),
        },
      );
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _firestoreService.updateDocument(
        collection: FirestoreCollections.usersCollection,
        docId: _userId,
        updates: {
          'tasks': FieldValue.arrayRemove([task.toJson()]),
        },
      );
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  Future<List<Task>> changeTaskStatus(Task task, TaskStatus newTaskStatus) async {
    try {
      final tasks = await fetchTasks();
      final index = tasks.indexWhere((e) => e.id == task.id);

      if (index != -1) {
        tasks[index] = tasks[index].copyWith(status: newTaskStatus);
         _firestoreService.updateDocument(
          collection: FirestoreCollections.usersCollection,
          docId: _userId,
          updates: {
            'tasks': tasks.map((task) => task.toJson()).toList(),
          },
        );
      } else {
        print('Task with ID ${task.id} not found');
      }

      return tasks;
    } catch (e) {
      print('Error updating task status: $e');
      return [];
    }
  }

  void addTasksChangesListener({required Function(List<Task>) onChange}) {
    _firestoreService.listenToDocumentChanges(
      collection: FirestoreCollections.usersCollection,
      docId: _userId,
    ).listen((data) {
      final tasksData = data?['tasks'] as List<dynamic>?;
      if (tasksData != null) {
        final tasks = tasksData.map((task) => Task.fromJson(task)).toList();
        onChange(tasks);
      }
    });
  }
}