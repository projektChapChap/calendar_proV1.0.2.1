import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// var todayDate = "2021-10-19";
DateTime todayDate = DateTime.now();

var currentDate = "${todayDate.toLocal()}".split(' ')[0];
Future<TodayDayDetails> fetchTodayDayDetails() async {
  final response = await http
      .get(Uri.parse('https://calender-pro.janja.tech/api/v1/$currentDate'));

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
  // final String tarehe;
  final int? id;
  final String? title;
  final String? details;
  final String? picha;
  TodayDayDetails(
      {required this.id,
      required this.title,
      required this.details,
      required this.picha});

  factory TodayDayDetails.fromJson(Map<String, dynamic> json) {
    return TodayDayDetails(
        id: json["data"]["id"],
        title: json["data"]["jina"].toString(),
        details: json["data"]["maelezo"].toString(),
        picha: json["data"]["picha"].toString());
  }
}

class DayDetails extends StatefulWidget {
  const DayDetails({Key? key}) : super(key: key);

  @override
  _DayDetailsState createState() => _DayDetailsState();
}

class _DayDetailsState extends State<DayDetails> {
  List<String> other = ['money', 'value'];

  late Future<TodayDayDetails> futureTodayDayDetails;
  @override
  void initState() {
    super.initState();
    futureTodayDayDetails = fetchTodayDayDetails();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('TODAY QUOTE!'),
    //     backgroundColor: Color.fromRGBO(128, 128, 128, 9.1),
    //   ),
    //   body:

    return Column(children: [
      Row(
        children: [
          Container(
            width: 411,
            height: 250,
            // color: Colors.black,
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
              color: Color.fromRGBO(128, 128, 128, 9.5),
              child: Container(
                alignment: Alignment(1, 0),
                child: Row(
                  children: [
                    Container(
                      width: 350,
                      height: 190,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FutureBuilder<TodayDayDetails>(
                          future: futureTodayDayDetails,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              //this is the one that return all the data from API
                              print(snapshot.data.toString());

                              //but this return null
                              return Image.network(
                                'https://calender-pro.janja.tech/' +
                                    snapshot.data!.picha.toString(),
                                fit: BoxFit.cover,
                                // height: 185,
                              );
                            } else if (snapshot.hasError) {
                              print(snapshot.error.toString());
                              return Text(
                                '${snapshot.error}',
                              );
                            } else {
                              // By default, show a loading spinner.
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Row(
            children: [
              Container(
                width: 411,
                height: 75,
                color: Color.fromRGBO(28, 228, 8, 3.1),
                padding: EdgeInsets.fromLTRB(4, 0, 0, 10),
                alignment: Alignment(1, -0.9),
                child: Row(
                  children: [
                    Container(
                      width: 400,
                      height: 75,
                      // padding: EdgeInsets.fromLTRB(02, 00, 00, 0),
                      child: Card(
                        color: Color.fromRGBO(28, 228, 8, 5.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FutureBuilder<TodayDayDetails>(
                          future: futureTodayDayDetails,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              //this is the one that return all the data from API
                              print(snapshot.data.toString());

                              //but this return null
                              return Text(snapshot.data!.title.toString());
                            } else if (snapshot.hasError) {
                              print(snapshot.error.toString());
                              return Text(
                                '${snapshot.error}',
                              );
                            } else {
                              // By default, show a loading spinner.
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      Column(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            FutureBuilder<TodayDayDetails>(
              future: futureTodayDayDetails,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //this is the one that return all the data from API
                  print(snapshot.data.toString());

                  //but this return null
                  return Text(snapshot.data!.details.toString(),
                      style: TextStyle(
                        fontSize: 16.7,
                      ));
                } else if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return Text(
                    '${snapshot.error}',
                  );
                } else {
                  // By default, show a loading spinner.
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ])
        ],
      ),

      // Row(
      //   children: [
      //     FutureBuilder<TodayDayDetails>(
      //       future: futureTodayDayDetails,
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           //this is the one that return all the data from API
      //           print(snapshot.data.toString());

      //           //but this return null
      //           return Text(snapshot.data!.title.toString());
      //         } else if (snapshot.hasError) {
      //           print(snapshot.error.toString());
      //           return Text(
      //             '${snapshot.error}',
      //           );
      //         } else {
      //           // By default, show a loading spinner.
      //           return Center(
      //             child: CircularProgressIndicator(),
      //           );
      //         }
      //       },
      //     ),
      //   ],
      // )
    ]);
    // );
  }
}
