import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sunroom/screens/sign_up_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<User?> getCurrentUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return FirebaseAuth.instance.currentUser;
      // print(FirebaseAuth.instance.currentUser?.uid);
    }
    return null;
  }

  void signOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!.displayName ?? '',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF524244),
                        fontSize: 24),
                  );
                }
                return const Text('');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => signOut(),
                child: Text(
                  'Sign Out',
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
            // ElevatedButton(
            //     onPressed: () => signOut(), child: const Text('Log Out')),
          ],
        ),
      ),
    );
  }
}
