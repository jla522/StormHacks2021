import 'package:firebase_auth/firebase_auth.dart';
import '../models/User.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> register(String email, String password) async {
  AuthResult result = await _auth.createUserWithEmailAndPassword(
      email: email, password: password);

  if (result.user != null) {
    createUser(result.user.uid, "Jordan");
  }

  // Need to write some stuff to the database
  return result.user;
}

Future<FirebaseUser> signInWithBasic(String email, String password) async {
  AuthResult result =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  return result.user;
}

Future<FirebaseUser> getUser() async {
  FirebaseUser user = await _auth.currentUser();
  return user;
}

Future<void> logoutBasic() async {
  // Check if signed in
  final FirebaseUser user = await _auth.currentUser();

  // TODO: Add better error handling
  if (user == null) {
    return;
  } else {
    await _auth.signOut();
  }
}
