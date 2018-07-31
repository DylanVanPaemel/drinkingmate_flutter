import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  FirebaseUser user;

  login(String email, String password) async {
    try {
      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
  }

  getUser() {
    return user;
  }
}
