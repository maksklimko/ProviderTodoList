import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider_todo_list/features/todo_list/models/task.dart';

class FirestoreService {
  FirestoreService._();

  static const String usersCollection = 'users';

  static Future<List<Task>> fetchTasks() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection(usersCollection)
          .doc("testUser")
          .get();

      final tasksData = doc.data()?['tasks'] as List<dynamic>?;

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
}
