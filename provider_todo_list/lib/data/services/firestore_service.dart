import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();

  static const String usersCollection = 'users';

  static Future<Map<String, dynamic>?> fetchDocument({
    required String collection,
    required String docId,
  }) async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection(collection)
          .doc(docId)
          .get();

      return docSnapshot.data();
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  static Future<void> updateDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> updates,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection(collection)
          .doc(docId)
          .update(updates);
    } catch (e) {
      print('Error updating document: $e');
    }
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
