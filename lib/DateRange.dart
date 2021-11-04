import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
    bool isCalculated = false;
    var choosen;
    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }

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
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Number of days between are!'),
                        content: Container(
                          width: 30,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                              ]),
                          child: Center(
                            child: Text(
                                '${daysBetween(selectedDate.toLocal(), selectedDate2.toLocal())}'),
                          ),
                        ),
                        actions: <Widget>[
                          // TextButton(
                          //   onPressed: () => Navigator.pop(context, 'Cancel'),
                          //   child: const Text('Cancel'),
                          // ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text(
                              'Thanks',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
