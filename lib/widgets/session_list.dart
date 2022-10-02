import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunroom/testing/sample_data.dart';
import 'package:sunroom/widgets/session_tile.dart';

class SessionArguments {
  final Session session;

  SessionArguments({
    required this.session,
  });
}

class SessionList extends StatelessWidget {
  final List sessions;
  const SessionList({
    super.key,
    required this.sessions,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        children: sessions.map((session) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'session',
                  arguments: SessionArguments(session: session));
            },
            child: SessionTile(
              startTime: session.startTime,
              endTime: session.endTime,
            ),
          );
        }).toList(),
      ),
    );
  }
}
