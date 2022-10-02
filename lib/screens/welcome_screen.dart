import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sunroom/screens/log_in_screen.dart';
import 'package:sunroom/screens/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Future<String> getCurrentUser() async {
    String email = '';
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        email = user.email ?? '';
      }
    });
    return email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome To Sunroom',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF524244),
                    fontSize: 24)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogInScreen()));
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFFAF5E6D),
                  ),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFF3C3CC)),
                  overlayColor: MaterialStateProperty.all(
                      Color.fromARGB(50, 255, 255, 255)),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFFAF5E6D),
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Color(0xFFF3C3CC)),
                overlayColor: MaterialStateProperty.all(
                    Color.fromARGB(50, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
