import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  // Login with existing Email Method
  Future<void> signInEmail(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // Register new Email Method
  Future<void> createUserEmail(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // Anonymous Sign in method
  Future<User?> signInAnon() async {
    var result = await _firebaseAuth.signInAnonymously();
    User? users = result.user;
    return users;
  }

  // Google Sign In
  Future<UserCredential> signInGoogle() async {
    //Begin interactive sign in proses
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication? gAuth = await gUser?.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken, idToken: gAuth?.idToken);

    // finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Sign out Method
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
