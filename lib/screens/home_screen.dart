import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunroom/testing/sample_data.dart';
import 'package:sunroom/widgets/session_list.dart';
import 'package:sunroom/widgets/session_tile.dart';

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

  final Stream<DocumentSnapshot> _sessionStream = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width),
              height: 400,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xFFFADEE3),
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 80, 25, 25),
                    child: StreamBuilder(
                      stream: _sessionStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("Loading");
                        }
                        Map<String, dynamic> data =
                            snapshot.data!.data()! as Map<String, dynamic>;
                        if (data['activeSessionId'].length != 0) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 50,
                                width: 50,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFFFA1E3),
                                            Color(0xFFFF7F55)
                                          ]),
                                      // color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Center(
                                    child: Icon(
                                      Icons.bolt_rounded,
                                      color: Color(0xFFFFF3F6),
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ),
                              const TimeTracker(),
                              const Text(
                                'Current Session',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF524244),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'End Session',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFFAF5E6D),
                                  ),
                                ),
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFFF3C3CC)),
                                  overlayColor: MaterialStateProperty.all(
                                      Color.fromARGB(50, 255, 255, 255)),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Text('No Current Session',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF524244),
                                  fontSize: 24));
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 8, left: 26),
                child: Text(
                  'Past Sessions',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF524244),
                      fontSize: 24),
                ),
              ),
            ),
            SessionList(sessions: sample_sessions)
          ],
        ),
      ),
    );
  }
}

class TimeTracker extends StatefulWidget {
  const TimeTracker({super.key});

  @override
  State<TimeTracker> createState() => _TimeTrackerState();
}

class _TimeTrackerState extends State<TimeTracker> {
  Timer? timer;
  DateTime now = DateTime.now();

  void initTimer() {
    if (timer != null && timer!.isActive) return;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //job
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void initState() {
    initTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}",
          style: TextStyle(
            fontSize: 80,
            color: Color(0xFF524244),
          ),
        ),
      ),
    );
  }
}
