import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider_todo_list/data/services/firestore_service.dart';

class MockFirestoreService extends Mock implements FirestoreService {}

final uid = 'testUser';

void main() async {
  group('Test firebase service methods', () {
    final instance = FakeFirebaseFirestore();
    final service = FirestoreService(instance);

    test('Test data fetching', () async {
      await instance.collection('users').doc('testUser').set({
        'tasks': [],
      });
      final data =
          await service.fetchDocument(collection: 'users', docId: uid);
      expect(data, {'tasks': []});
    });

    test('Test data updating', () async {
      await service.updateDocument(
        collection: 'users',
        docId: uid,
        updates: {'test': '123'},
      );
      final doc = await instance.collection('users').doc(uid).get();
      expect(doc['test'], '123');
    });
  });
}
