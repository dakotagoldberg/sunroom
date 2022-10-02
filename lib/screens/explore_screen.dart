import 'package:flutter/material.dart';
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
            MoodKeywordSummary(),
            MoodKeywordSummary(),
            MoodKeywordSummary(),
          ],
        ),
      ),
    );
  }
}
