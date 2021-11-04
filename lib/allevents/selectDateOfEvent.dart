import 'dart:async';
import 'package:flutter/material.dart';

class CurrentDateForEvent extends StatefulWidget {
  @override
  __CurrentDateForEventState createState() => __CurrentDateForEventState();
}

class __CurrentDateForEventState extends State<CurrentDateForEvent> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.blue, // Button color
                    child: InkWell(
                      // splashColor: Colors.red, // Splash color
                      onTap: () => _selectDate(context),
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.calendar_today)),
                    ),
                  ),
                ),
                Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ]),
        ],
      ),
    );
  }
}
