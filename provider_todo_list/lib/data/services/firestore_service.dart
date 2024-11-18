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

  static addTasksChangesListener({
    required Function(List<Task>) onChange,
  }) {
    addDocChangesListener(
      collection: usersCollection,
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

  static addDocChangesListener({
    required String collection,
    required String document,
    required Function(Map<String, dynamic>) onChange,
  }) {
    FirebaseFirestore.instance
        .collection(collection)
        .doc(document)
        .snapshots()
        .listen((snapshot) => onChange.call(snapshot.data() ?? {}));
  }
}
