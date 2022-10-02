import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunroom/testing/sample_data.dart';
import 'package:sunroom/widgets/keyword_list.dart';
import 'package:sunroom/widgets/mood_cluster.dart';
import 'package:sunroom/widgets/session_list.dart';
import 'package:sunroom/widgets/site_tile.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SessionArguments;
    List session = example_session;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF524244)),
        title: Text(
          DateFormat('MMMM d, yyyy')
              .format(DateTime.parse(args.session.startTime)),
          style: TextStyle(
            color: Color(0xFF524244),
          ),
        ),
        backgroundColor: Color(0xFFFFF3F6),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          children: [
            Text(
              'Top Keywords',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF524244),
                  fontSize: 24),
            ),
            KeywordList(
                keywords: parseKeywords(args.session.sites).sublist(
                    0, min(5, parseKeywords(args.session.sites).length - 1))),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                'Mood Progression',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF524244),
                    fontSize: 24),
              ),
            ),
            MoodCluster(keywords: [
              'h',
              'd',
              'h',
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                'Content Path',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF524244),
                    fontSize: 24),
              ),
            ),
            Column(
              children: args.session.sites.map((site) {
                return SiteTile(siteData: site);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

List parseKeywords(sessions) {
  List keywords = [];
  sessions.forEach((session) {
    keywords.addAll(session['tags']);
  });
  return keywords;
}
