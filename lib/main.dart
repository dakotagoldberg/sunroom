import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sunroom/screens/home_screen.dart';
import 'package:sunroom/screens/session_screen.dart';
import 'firebase_options.dart';

import 'package:sunroom/screens/welcome_screen.dart';

import 'navigation/bottom_tabs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        setState(() {
          _isLoggedIn = false;
        });
      } else {
        print('User is signed in!');
        setState(() {
          _isLoggedIn = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunroom',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFFFF3F6),
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => _isLoggedIn
            ? BottomTabs(
                index: 1,
              )
            : WelcomeScreen(),
        'session': (context) => SessionScreen(),
      },
    );
  }
}
