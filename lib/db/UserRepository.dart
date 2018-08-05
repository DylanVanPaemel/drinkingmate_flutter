import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  FirebaseUser user;

  void login(String email, String password) async {
    try {
      FirebaseUser currentUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setUser(currentUser);
    } catch (e) {}
  }

  getUser() {
    return user;
  }

  void setUser(FirebaseUser currentUser) {
    this.user = currentUser;
  }
}
