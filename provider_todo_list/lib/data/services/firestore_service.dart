import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  Future<Map<String, dynamic>?> fetchDocument({
    required String collection,
    required String docId,
  }) async {
    try {
      final docSnapshot =
      await _firestore.collection(collection).doc(docId).get();
      return docSnapshot.data();
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  Future<void> updateDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> updates,
  }) async {
    try {
      await _firestore.collection(collection).doc(docId).update(updates);
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  Stream<Map<String, dynamic>?> listenToDocumentChanges({
    required String collection,
    required String docId,
  }) {
    return _firestore
        .collection(collection)
        .doc(docId)
        .snapshots()
        .map((snapshot) => snapshot.data());
  }
}