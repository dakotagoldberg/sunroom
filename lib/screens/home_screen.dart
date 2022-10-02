import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Object?>? sessions;

  Future<List<Object?>> fetchSessions() async {
    // FirebaseDatabase database = FirebaseDatabase.instance;
    // DatabaseReference ref = FirebaseDatabase.instance.ref();
    List<Object?> fetchedSessions = [];
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/anitej').get();

    if (snapshot.exists) {
      fetchedSessions.add(snapshot.value);
    } else {
      print('No data available.');
    }
    print(fetchedSessions.length);
    // setState(() {
    //   sessions = fetchedSessions;
    // });
    return fetchedSessions;
  }

  // Widget buildSessionList() {
  //   if (sessions != null) {
  //     return ListView(
  //       children: sessions!.map((session) {
  //         return Text('hey');
  //       }).toList(),
  //     );
  //   } else {
  //     return Text('hehe');
  //   }
  // }

  Future<User?> getCurrentUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return FirebaseAuth.instance.currentUser;
      // print(FirebaseAuth.instance.currentUser?.uid);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            width: (MediaQuery.of(context).size.width),
            height: 350,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFFADEE3),
                borderRadius: BorderRadius.all(Radius.circular(35)),
              ),
            ),
          )
        ],
      )),
    );
  }
}
