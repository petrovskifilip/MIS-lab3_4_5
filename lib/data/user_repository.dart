import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  String? getUserEmail() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser?.email;
  }
}
