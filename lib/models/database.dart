import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('Cars');

class Database {
  static String userUid;

  static Stream<QuerySnapshot> readItems() {
    CollectionReference CarItemCollection =
        _mainCollection.doc(userUid).collection('Cars');

    return CarItemCollection.snapshots();
  }
}
