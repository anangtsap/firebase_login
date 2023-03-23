import 'package:firebase_login/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _signOut() {
    return ElevatedButton(
      onPressed: () => Auth().signOut(),
      child: const Text('Sign Out'),
    );
  }

  User? user = Auth().currentUser;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text('Home page'),
            ),
            _signOut(),
            Text('login as : ${user!.email ?? 'Anonymous'}'),
            Text('User UID : ${user!.uid}'),
          ],
        ),
      ),
    );
  }
}
