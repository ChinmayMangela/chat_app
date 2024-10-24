import 'package:chat_app/common/utils/utils.dart';
import 'package:chat_app/features/authentication/domain/end_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final _firebaseFireStore = FirebaseFirestore.instance;
  final String currentUserId;

  UserService() : currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

  Future<void> saveUserToFireStore(EndUser user) async {
    try {
      await _firebaseFireStore.collection('users').add(user.toJson());
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  // fetch users list excluding current user
  Stream<List<EndUser>> fetchUsers() {
    return _firebaseFireStore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs
          .map(
            (user) {
              return EndUser.fromJson(user.data(), user.id);
            },
          )
          .where((user) => user.id != currentUserId)
          .toList();
    });
  }
}
