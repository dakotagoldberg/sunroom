import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionTile extends StatelessWidget {
  final String startTime;
  final String endTime;
  const SessionTile({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Color(0xFFFADEE3),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 50,
                      width: 50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFFFFA1E3), Color(0xFFFF7F55)]),
                            // color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Center(
                          child: Icon(
                            Icons.emoji_emotions_rounded,
                            color: Color(0xFFFFF3F6),
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('MMMM d, yyyy')
                                .format(DateTime.parse(startTime)),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF524244),
                                fontSize: 22),
                          ),
                          Text(
                            DateFormat('jm').format(DateTime.parse(startTime)) +
                                ' - ' +
                                DateFormat('jm')
                                    .format(DateTime.parse(endTime)),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF9C8084),
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF524244),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
