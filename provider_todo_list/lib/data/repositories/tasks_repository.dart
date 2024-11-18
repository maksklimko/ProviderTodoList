import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider_todo_list/features/todo_list/models/task_status.dart';

import '../../features/todo_list/models/task.dart';
import '../services/firestore_service.dart';

class TasksRepository {
  TasksRepository._();

  static Future<List<Task>> fetchTasks() async {
    try {
      final data = await FirestoreService.fetchDocument(
        collection: FirestoreService.usersCollection,
        docId: "testUser",
      );

      final tasksData = data?['tasks'] as List<dynamic>?;

      if (tasksData != null) {
        return tasksData.map((task) => Task.fromJson(task)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching tasks: $e');
      return [];
    }
  }

  static Future<void> addTask(Task task) async {
    try {
      await FirestoreService.updateDocument(
        collection: FirestoreService.usersCollection,
        docId: "testUser",
        updates: {
          'tasks': FieldValue.arrayUnion([task.toJson()]),
        },
      );
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  static Future<void> deleteTask(Task task) async {
    try {
      await FirestoreService.updateDocument(
        collection: FirestoreService.usersCollection,
        docId: "testUser",
        updates: {
          'tasks': FieldValue.arrayRemove([task.toJson()]),
        },
      );
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  static Future<List<Task>> changeTaskStatus(
    Task task,
    TaskStatus newTaskStatus,
  ) async {
    try {
      var tasks = await fetchTasks();

      final index = tasks.indexWhere((e) => task.id == e.id);
      if (index != -1) {
        tasks[index] = tasks[index].copyWith(status: newTaskStatus);
      } else {
        print('Task with ID ${task.id} not found');
      }

      FirestoreService.updateDocument(
        collection: FirestoreService.usersCollection,
        docId: "testUser",
        updates: {
          'tasks': tasks.map((e) => e.toJson()),
        },
      );
      return tasks;
    } catch (e) {
      print('Error completing task: $e');
      return [];
    }
  }

  static addTasksChangesListener({
    required Function(List<Task>) onChange,
  }) {
    FirestoreService.addDocChangesListener(
      collection: FirestoreService.usersCollection,
      document: 'testUser',
      onChange: (data) {
        final tasksData = data['tasks'] as List<dynamic>?;

        if (tasksData != null) {
          final tasks = tasksData.map((task) => Task.fromJson(task)).toList();
          onChange.call(tasks);
        } else {
          return [];
        }
      },
    );
  }
}
