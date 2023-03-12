import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:flutter/material.dart';

import 'package:firebase_login/auth.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerAge = TextEditingController();
  String? _errorMessage = '';
  bool _isLogin = true;

  // SignIn Email method with exception
  Future<void> _signInemail() async {
    try {
      await Auth().signInEmail(
          email: controllerName.text, password: controllerAge.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    }
  }

  // SignUp Email method with exception
  Future<void> _signUpEmail() async {
    try {
      await Auth().createUserEmail(
          email: controllerName.text, password: controllerAge.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    }
  }

  // SignIn anonymous method with exception
  Future<void> _signInAnonymous() async {
    try {
      await Auth().signInAnon();
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    }
  }

  // SignIn anonymous Button
  Widget _signInAnon() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 30,
        width: MediaQuery.of(context).size.width * 0.28,
        child: ElevatedButton(
            onPressed: _signInAnonymous, child: const Text('Anonymous')),
      ),
    );
  }

  // Error Notification
  Widget _errorNotification() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(_errorMessage == '' ? '' : '$_errorMessage'),
    );
  }

  // entry field for your email and password
  Widget _entryField(
      {String? title, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: title ?? ''),
    );
  }

  // Button Login or Register
  Widget _submitButton() {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.28,
      child: ElevatedButton(
          onPressed: () {
            _isLogin ? _signInemail() : _signUpEmail();
          },
          child: Text(_isLogin ? 'Login' : 'Register')),
    );
  }

  // you wanna login or register instead
  Widget _loginOrRegister() {
    return TextButton(
        onPressed: () {
          setState(() {
            _isLogin = !_isLogin;
          });
        },
        child: Text(_isLogin ? 'Register instead' : 'Login Instead'));
  }

  // SignIn with Google method with exception
  Future<void> _googleLogin() async {
    try {
      await Auth().signInGoogle();
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    }
  }

  // SignIn with Google
  Widget _gLogin() {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.28,
      child: ElevatedButton(
          onPressed: () => _googleLogin(), child: const Text('SignIn GOOGLE ')),
    );
  }

  // Future<void> _signInWithGoogle() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();

  //   try {
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //     final User? user =
  //         (await FirebaseAuth.instance.signInWithCredential(credential)).user;

  //     // setState(() {
  //     //   name = user!.displayName.toString();
  //     //   email = user.email.toString();
  //     //   image = user.photoURL.toString();
  //     // });

  //     if (kDebugMode) {
  //       print("Signed in as ${user?.displayName}");
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("Error signing in with Google: $e");
  //     }
  //   }
  // }

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _entryField(controller: controllerName, title: 'Name'),
            _entryField(controller: controllerAge, title: 'Age'),
            _errorNotification(),
            _submitButton(),
            _loginOrRegister(),
            _signInAnon(),
            _gLogin(),
          ],
        ),
      ),
    );
  }
}
