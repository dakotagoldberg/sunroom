import 'package:flutter/material.dart';

class MoodCluster extends StatelessWidget {
  final List keywords;
  const MoodCluster({
    super.key,
    required this.keywords,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: keywords.map((keyword) {
        return Padding(
          padding: const EdgeInsets.all(6),
          child: SizedBox(
            height: 50,
            width: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFFFA1E3), Color(0xFFFF7F55)]),
                  // color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Center(
                child: Icon(
                  Icons.emoji_emotions_rounded,
                  color: Color(0xFFFFF3F6),
                  size: 32,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
