import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

Future<TodayMatch> fetchTodayMatch() async {
  final response =
      await http.get(Uri.parse('http://3.139.74.155//api/fetch_football.php'));

  if (response.statusCode == 200) {
    print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return TodayMatch.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load details');
  }
}

class TodayMatch {
  int? code;
  String? message;
  List<Data>? data;

  TodayMatch({this.code, this.message, this.data});

  TodayMatch.fromJson(Map<String, dynamic> json) {
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
  String? homeTeam;
  String? homeTeamLogo;
  String? awayTeam;
  String? awayTeamLogo;
  String? muda;
  String? tarehe;
  String? aina;

  Data(
      {this.id,
      this.homeTeam,
      this.homeTeamLogo,
      this.awayTeam,
      this.awayTeamLogo,
      this.muda,
      this.tarehe,
      this.aina});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeTeam = json['home_team'];
    homeTeamLogo = json['home_team_logo'];
    awayTeam = json['away_team'];
    awayTeamLogo = json['away_team_logo'];
    muda = json['muda'];
    tarehe = json['tarehe'];
    aina = json['aina'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['home_team'] = this.homeTeam;
    data['home_team_logo'] = this.homeTeamLogo;
    data['away_team'] = this.awayTeam;
    data['away_team_logo'] = this.awayTeamLogo;
    data['muda'] = this.muda;
    data['tarehe'] = this.tarehe;
    data['aina'] = this.aina;
    return data;
  }
}

class FootballMatches extends StatefulWidget {
  const FootballMatches({Key? key}) : super(key: key);

  @override
  _FootballMatchesState createState() => _FootballMatchesState();
}

class _FootballMatchesState extends State<FootballMatches> {
  @override
  late Future<TodayMatch> futureTodayDayMatch;
  @override
  void initState() {
    super.initState();
    futureTodayDayMatch = fetchTodayMatch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.75,
                child: FutureBuilder<TodayMatch>(
                    future: futureTodayDayMatch,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        //this is the one that return all the data from API
                        print(snapshot.data);
                        //but this return null
                        return ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: snapshot.data?.data?.length,
                            itemBuilder: (context, i) {
                              return Row(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          /// Display date time picker widget.
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                00.0, 01.00, 50.00, 00),
                                            child: FutureBuilder<TodayMatch>(
                                              future: futureTodayDayMatch,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  //this is the one that return all the data from API
                                                  print(snapshot.data);
                                                  //but this return null
                                                  return Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 20.0,
                                                            backgroundImage:
                                                                NetworkImage(
                                                              'http://3.139.74.155//vHybfhb/uploads/' +
                                                                  '${snapshot.data?.data?[i].homeTeamLogo.toString()}',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      FutureBuilder<TodayMatch>(
                                                        future:
                                                            futureTodayDayMatch,
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                              .hasData) {
                                                            //this is the one that return all the data from API
                                                            print(snapshot.data!
                                                                .toString());

                                                            //but this return null
                                                            return Center(
                                                              child: Text(
                                                                  '${snapshot.data!.data?[i].homeTeam.toString()}'),
                                                            );
                                                          } else if (snapshot
                                                              .hasError) {
                                                            print(snapshot.error
                                                                .toString());
                                                            return Center(
                                                              child: Text(
                                                                'failed',
                                                              ),
                                                            );
                                                          } else {
                                                            // By default, show a loading spinner.
                                                            return Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                } else if (snapshot.hasError) {
                                                  print("${snapshot.error}");
                                                  return Center(
                                                    child: Text(
                                                      'failed',
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

                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                00.0, 50.00, 50.00, 05.00),
                                            child: FutureBuilder<TodayMatch>(
                                              future: futureTodayDayMatch,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  //this is the one that return all the data from API
                                                  print(snapshot.data!
                                                      .toString());

                                                  //but this return null
                                                  return Chip(
                                                    label: Text(
                                                        '${snapshot.data!.data?[i].muda.toString()}'),
                                                    shadowColor: Colors.blue,
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            128, 128, 128, 9.1),
                                                    elevation: 10,
                                                    autofocus: true,
                                                  );
                                                } else if (snapshot.hasError) {
                                                  print(snapshot.error
                                                      .toString());
                                                  return Center(
                                                    child: Text(
                                                      'no internet',
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

                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 01.00, 00.00, 01),
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: FutureBuilder<TodayMatch>(
                                                future: futureTodayDayMatch,
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    //this is the one that return all the data from API
                                                    print(snapshot.data);
                                                    //but this return null
                                                    return Column(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 20.0,
                                                          backgroundImage:
                                                              NetworkImage(
                                                            'http://3.139.74.155//vHybfhb/uploads/' +
                                                                '${snapshot.data?.data?[i].awayTeamLogo.toString()}',
                                                            // fit: BoxFit
                                                            //     .cover,
                                                            // height: 185,
                                                          ),
                                                        ),
                                                        FutureBuilder<
                                                            TodayMatch>(
                                                          future:
                                                              futureTodayDayMatch,
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              //this is the one that return all the data from API
                                                              print(snapshot
                                                                  .data!
                                                                  .toString());

                                                              //but this return null
                                                              return Center(
                                                                child: Text(
                                                                    '${snapshot.data!.data?[i].awayTeam.toString()}'),
                                                              );
                                                            } else if (snapshot
                                                                .hasError) {
                                                              print(snapshot
                                                                  .error
                                                                  .toString());
                                                              return Center(
                                                                child: Text(
                                                                  'failed',
                                                                ),
                                                              );
                                                            } else {
                                                              // By default, show a loading spinner.
                                                              return Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  } else if (snapshot
                                                      .hasError) {
                                                    print("${snapshot.error}");
                                                    return Center(
                                                      child: Text(
                                                        'failed',
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
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                                //   ),
                                // ],
                              );
                            });
                      } else if (snapshot.hasError) {
                        print("${snapshot.error}");
                        return Center(
                          child: Text(
                            'failed',
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
                    }),
              )
            ],
          ),
        ],
      ),
    );
    // );
  }
}
