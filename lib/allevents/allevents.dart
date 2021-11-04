import 'package:calendar_pro/allevents/detailsOfevent.dart';
import 'package:calendar_pro/allevents/selectDateOfEvent.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

// var todayDate = "2021-10-19";
// DateTime

String todayDate = '2020 - 04 - 08';

// DateTime.now();

// var currentDate = "${todayDate.toLocal()}".split(' ')[0];

Future<TodayDayDetails> fetchTodayDayDetails() async {
  final response =
      await http.get(Uri.parse('http://3.139.74.155//api/fetch_events.php'));

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

class AllEvents extends StatefulWidget {
  @override
  _AllEventsState createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  late Future<TodayDayDetails> futureTodayDayDetails;
  @override
  void initState() {
    super.initState();
    futureTodayDayDetails = fetchTodayDayDetails();
  }

  Widget build(BuildContext context) {
    return new Container(
      child: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: FutureBuilder<TodayDayDetails>(
                future: futureTodayDayDetails,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //this is the one that return all the data from API
                    print(snapshot.data);
                    //but this return null
                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
                      itemCount: snapshot.data?.data?.length,
                      itemBuilder: (context, i) {
                        return Container(
                          height: 130,
                          child: Card(
                            //                color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 10,
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    /// Display date time picker widget.
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetailsState(
                                                      selected: i,
                                                      heading: snapshot
                                                          .data?.data?[i].jina,
                                                      image: snapshot
                                                          .data?.data?[i].picha,
                                                      maelezo: snapshot.data
                                                          ?.data?[i].maelezo,
                                                    )),
                                          );
                                        },
                                        child: FutureBuilder<TodayDayDetails>(
                                          future: futureTodayDayDetails,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              //this is the one that return all the data from API
                                              print(snapshot.data);
                                              //but this return null
                                              return CircleAvatar(
                                                radius: 50,
                                                backgroundImage: NetworkImage(
                                                  'http://3.139.74.155//vHybfhb/uploads/' +
                                                      '${snapshot.data!.data?[i].picha.toString()}',
                                                  // fit: BoxFit.cover,
                                                  // height: 185,
                                                ),
                                              );
                                            } else if (snapshot.hasError) {
                                              print("${snapshot.error}");
                                              return Center(
                                                child: Text(
                                                  'no network',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              // By default, show a loading spinner.
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.blue,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.fromLTRB(
                                            05.0, 0.00, 30.00, 70.00),
                                        child: Chip(
                                          label: FutureBuilder<TodayDayDetails>(
                                            future: futureTodayDayDetails,
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                //this is the one that return all the data from API
                                                print(
                                                    snapshot.data!.toString());

                                                //but this return null
                                                return Text(
                                                    '${snapshot.data!.data?[i].jina.toString()}');
                                              } else if (snapshot.hasError) {
                                                print(
                                                    snapshot.error.toString());
                                                return Text(
                                                  'no network',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 15,
                                                  ),
                                                );
                                              } else {
                                                // By default, show a loading spinner.
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.blue,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          shadowColor: Colors.blue,
                                          backgroundColor: Color.fromRGBO(
                                              128, 128, 128, 9.1),
                                          elevation: 10,
                                          autofocus: true,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    print("${snapshot.error}");
                    return Center(
                      child: Text(
                        'no network',
                        style: TextStyle(
                          color: Colors.red,
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
            ),
          ),
          Container(
            alignment: Alignment(0, -1),
            child: CurrentDateForEvent(),
          )
        ],
      ),
    );
  }
}
