import 'package:chat_app/common/utils/utils.dart';
import 'package:chat_app/features/authentication/domain/end_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {

  final _firebaseFireStore = FirebaseFirestore.instance;

  Future<void> saveUserToFireStore(EndUser user) async {
    try {
      await _firebaseFireStore.collection('users').add(user.toJson());
    } on FirebaseException catch(e) {
      Utils.showSnackBar(e.message);
    }
  }
}