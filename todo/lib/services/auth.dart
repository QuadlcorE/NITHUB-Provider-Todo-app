import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object
  TodoUser? _userFromFireBaseUser(User? user) {
    return user != null ? TodoUser(uid: user.uid) : null;
  }

  Stream<TodoUser?> get user {
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }

  Future signInAnon() async {
    try {
      final UserCredential result = await _auth.signInAnonymously();
      final User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
