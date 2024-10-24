import 'package:chat_app/common/utils/utils.dart';
import 'package:chat_app/features/authentication/domain/end_user.dart';
import 'package:chat_app/features/authentication/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _userService = UserService();

  Future<void> logInWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user =
          EndUser(id: userCredential.user!.uid, name: name, email: email);
      await _userService.saveUserToFireStore(user);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      Utils.showSnackBar('Email verification has been sent');
      await _firebaseAuth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  Future<void> signOut() async {
    try {
      _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }
}
