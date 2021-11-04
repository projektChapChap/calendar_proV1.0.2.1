import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
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
    return Column(children: [
      Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.3,
            // color: Colors.black,
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
              color: Color.fromRGBO(128, 128, 128, 9.5),
              child: Container(
                alignment: Alignment(1, 0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.25,
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
                              print(snapshot.data);
                              //but this return null
                              return Image.network(
                                'http://3.139.74.155//vHybfhb/uploads/' +
                                    '${snapshot.data!.data?.last.picha.toString()}',
                                fit: BoxFit.cover,
                                // height: 185,
                              );
                            } else if (snapshot.hasError) {
                              print(snapshot.error);
                              return Center(
                                child: Text(
                                  'no internet',
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
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.1,
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
                              print(snapshot.data!.toString());

                              //but this return null
                              return Center(
                                child: Text(
                                    '${snapshot.data!.data?.first.jina.toString()}'),
                              );
                            } else if (snapshot.hasError) {
                              print(snapshot.error.toString());
                              return Center(
                                child: Text(
                                  'no internet',
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
                  return Text(
                      '${snapshot.data!.data?.first.maelezo.toString()}',
                      style: TextStyle(
                        fontSize: 16.7,
                      ));
                } else if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return Center(
                    child: Text(
                      'no internet',
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
