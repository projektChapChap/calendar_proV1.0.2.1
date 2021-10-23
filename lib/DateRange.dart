import 'dart:async';
import 'dart:ui';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class DateRangeSelector extends StatefulWidget {
  @override
  __DateRangeSelectorState createState() => __DateRangeSelectorState();
}

class __DateRangeSelectorState extends State<DateRangeSelector> {
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

  Future<void> _selectDate2(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate2 = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              RaisedButton(
                onPressed: () => _selectDate(context),
                child: Text('Start date',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                    )),
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              RaisedButton(
                onPressed: () => _selectDate2(context),
                child: Text(
                  'End   date',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                  ),
                ),
              ),
              Text("${selectedDate2.toLocal()}".split(' ')[0],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                  )),
              SizedBox(
                height: 20.0,
              ),
            ]),
            Column(
              children: [
                Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: null,
                    child: Text("CALCULATE"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
