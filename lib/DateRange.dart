import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class DateRangeSelector extends StatefulWidget {
  @override
  __DateRangeSelectorState createState() => __DateRangeSelectorState();
}

class __DateRangeSelectorState extends State<DateRangeSelector> {
  DateTime selectedDate = DateTime.now();

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Select date'),
        backgroundColor: Color.fromRGBO(128, 128, 128, 9.1),
      ),
      body: Center(
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
                onPressed: () => _selectDate(context),
                child: Text(
                  'End   date',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                  ),
                ),
              ),
              Text("${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                  )),
              SizedBox(
                height: 20.0,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
