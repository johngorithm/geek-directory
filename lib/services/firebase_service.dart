import 'package:firebase_auth/firebase_auth.dart';

/// A contract for interacting with this app's
/// Firebase service.
abstract class AbstractFirebaseService {
  Future<FirebaseUser> get currentUser;

  Future<FirebaseUser> registerUser(String email, String password);

  Future<FirebaseUser> authenticateUser(String email, String password);

  Future<void> signOut();
}



class FirebaseService implements AbstractFirebaseService {
  FirebaseAuth auth;

  FirebaseService({this.auth}) {
    auth ??= FirebaseAuth.instance;
  }

  @override
  Future<FirebaseUser> authenticateUser(String email, String password) async {
    var authResult = await auth.signInWithEmailAndPassword(
        email: email, password: password);
    /// This will be null if user is signed out or does not exist
    return authResult.user;
  }

  @override
  Future<FirebaseUser> get currentUser async {
    return auth.currentUser();
  }

  @override
  Future<FirebaseUser> registerUser(String email, String password) async {
    var authResult = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return authResult.user;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

}
