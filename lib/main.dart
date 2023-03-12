import 'package:firebase_login/firebase_options.dart';
import 'package:firebase_login/home_page.dart';
import 'package:firebase_login/login_page.dart';
import 'package:firebase_login/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/wrapper',
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/wrapper': (context) => const Wrapper(),
      },
    );
  }
}
