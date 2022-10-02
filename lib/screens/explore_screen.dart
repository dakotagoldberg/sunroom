import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:sunroom/testing/sample_data.dart';
import 'package:sunroom/widgets/keyword_list.dart';
import 'package:sunroom/widgets/mood_keyword_summary.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            MoodKeywordSummary(
              emotion: Bx.bxs_happy_beaming,
              keywords: ['No Keywords'],
            ),
            MoodKeywordSummary(
              emotion: Bx.bxs_happy,
              keywords: parseKeywords(sample_sessions).sublist(
                  0, min(5, parseKeywords(sample_sessions).length - 1)),
            ),
            MoodKeywordSummary(
              emotion: Bx.bxs_sad,
              keywords: ['No Keywords'],
            ),
            MoodKeywordSummary(
              emotion: Bx.bxs_tired,
              keywords: ['No Keywords'],
            ),
          ],
        ),
      ),
    );
  }
}

List parseKeywords(sessions) {
  List keywords = [];
  sessions.forEach((session) {
    session.sites.forEach((site) {
      keywords.addAll(site['tags']);
    });
  });
  return keywords;
}
