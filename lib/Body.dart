import 'package:calendar_pro/card.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Today extends StatelessWidget {
  const Today({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MyCardWidget(),
          ],
        ),
        Container(
          color: Colors.white70,
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
        )
      ],
    );
  }
}
