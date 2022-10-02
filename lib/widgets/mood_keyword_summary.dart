import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sunroom/widgets/keyword_list.dart';

class MoodKeywordSummary extends StatelessWidget {
  const MoodKeywordSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
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
              ),
              Text('Top Keywords',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF524244),
                      fontSize: 24)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: KeywordList(
                keywords: ['Keyword', 'Keyword', 'Keyword', 'Keyword']),
          )
        ],
      ),
    );
  }
}
