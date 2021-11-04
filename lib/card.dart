import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// var todayDate = "2021-10-19";
// DateTime

String todayDate = '2020 - 04 - 08';

// DateTime.now();

// var currentDate = "${todayDate.toLocal()}".split(' ')[0];

Future<TodayDayDetails> fetchTodayDayDetails() async {
  final response = await http.get(Uri.parse(
      'http://3.139.74.155//api/fetch_events_bydate.php?tarehe=2021-01-01'));

  if (response.statusCode == 200) {
    print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return TodayDayDetails.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load details');
  }
}

class TodayDayDetails {
  int? code;
  String? message;
  List<Data>? data;

  TodayDayDetails({this.code, this.message, this.data});

  TodayDayDetails.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? jina;
  String? tarehe;
  String? maelezo;
  String? aina;
  String? muda;
  String? picha;

  Data(
      {this.id,
      this.jina,
      this.tarehe,
      this.maelezo,
      this.aina,
      this.muda,
      this.picha});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jina = json['jina'];
    tarehe = json['tarehe'];
    maelezo = json['maelezo'];
    aina = json['aina'];
    muda = json['muda'];
    picha = json['picha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jina'] = this.jina;
    data['tarehe'] = this.tarehe;
    data['maelezo'] = this.maelezo;
    data['aina'] = this.aina;
    data['muda'] = this.muda;
    data['picha'] = this.picha;
    return data;
  }
}

class MyCardWidget extends StatefulWidget {
  MyCardWidget({Key? key}) : super(key: key);

  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  late Future<TodayDayDetails> futureTodayDayDetails;
  @override
  void initState() {
    super.initState();
    futureTodayDayDetails = fetchTodayDayDetails();
  }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: 150,
      padding: new EdgeInsets.fromLTRB(20.00, 2.00, 10.00, 6.00),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        color: Color.fromRGBO(128, 128, 128, 9.1),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(),
            FutureBuilder<TodayDayDetails>(
              future: futureTodayDayDetails,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //this is the one that return all the data from API
                  print(snapshot.data!.toString());

                  //but this return null
                  return Text(
                    '${snapshot.data!.data?.first.jina.toString()}',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                    ),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return Center(
                    child: Text(
                      'no internet',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                      ),
                    ),
                  );
                } else {
                  // By default, show a loading spinner.
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
