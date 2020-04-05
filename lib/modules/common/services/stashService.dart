
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> createStash(String id) {
  return Firestore
    .instance
    .collection('stash')
    .document(id)
    .setData({
      'stashItems': List()
    });
}

Future<DocumentSnapshot> getStash(String id) {
  return Firestore
    .instance
    .collection('stash')
    .document(id)
    .get();
}

Future<void> updateStash(String id, List<Map<String, dynamic>> stashItems) {
  return Firestore
    .instance
    .collection('stash')
    .document(id)
    .updateData({
      'stashItems': stashItems
    });
}

Future<void> deleteStash(String id) {
  return Firestore
    .instance
    .collection('stash')
    .document(id)
    .delete();
}