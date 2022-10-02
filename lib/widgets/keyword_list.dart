import 'package:flutter/material.dart';

class KeywordList extends StatelessWidget {
  final List keywords;
  const KeywordList({
    super.key,
    required this.keywords,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: keywords.map((keyword) {
        return Padding(
          padding: const EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              color: Color(0xFFFADEE3),
              child: Text(
                keyword,
                style: TextStyle(
                  color: Color(0xFFAF5E6D),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
