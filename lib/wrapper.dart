import 'package:firebase_login/auth.dart';
import 'package:firebase_login/page/home_page.dart';
import 'package:firebase_login/page/login_page.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChange,
      builder: (context, snapshot) {
        return snapshot.hasData ? const HomePage() : const LoginPage();
      },
    );
  }
}
