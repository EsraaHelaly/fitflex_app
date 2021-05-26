import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitflex_app/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _collectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _collectionReference.doc(uid).get();
  }
}
