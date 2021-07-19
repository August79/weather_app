import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Future<User?> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final newUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return newUser.user;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<User?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.user;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  bool isSignedIn() {
    final curentUser = _firebaseAuth.currentUser;
    return curentUser != null;
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
