import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sew_your_stash/models/stashItem.dart';

class Stash {
  final String documentID;
  final List<StashItem> stashItems;

  Stash({this.documentID, this.stashItems});

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> stashItemsJson = stashItems.map((stashItem) {
      return stashItem.toJson();
    });

    return {
      'documentID': documentID,
      'stashItems': stashItemsJson
    };
  }

  factory Stash.fromSnapshot(DocumentSnapshot snapshot) {
    List stashItemsMap = List.from(snapshot.data['stashItems']);

    List<StashItem> stashItems = stashItemsMap.map((map) {
      return StashItem.fromJson(map);
    }).toList();

    String id = snapshot.documentID;

    return Stash(
      documentID: id,
      stashItems: stashItems);
  }
}