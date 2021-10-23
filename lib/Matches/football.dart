import 'package:flutter/material.dart';

class FootballMatches extends StatefulWidget {
  const FootballMatches({Key? key}) : super(key: key);

  @override
  _FootballMatchesState createState() => _FootballMatchesState();
}

class _FootballMatchesState extends State<FootballMatches> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        width: 450,
        child: Card(
          color: Color.fromRGBO(128, 128, 128, 9.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 01,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 350,
                    height: 450,
                    child: Card(
                      color: Color.fromRGBO(228, 28, 210, 0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/barca.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("barcleona"),
                                ],
                              ),
                              Text("Vs"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/real.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("Real madrid"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/barca.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("barcleona"),
                                ],
                              ),
                              Text("Vs"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/real.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("Real madrid"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/barca.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("barcleona"),
                                ],
                              ),
                              Text("Vs"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/real.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("Real madrid"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/barca.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("barcleona"),
                                ],
                              ),
                              Text("Vs"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/real.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("Real madrid"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/barca.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("barcleona"),
                                ],
                              ),
                              Text("Vs"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/real.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("Real madrid"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/barca.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("barcleona"),
                                ],
                              ),
                              Text("Vs"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/real.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("Real madrid"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/barca.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("barcleona"),
                                ],
                              ),
                              Text("Vs"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/other/real.png",
                                    height: 28,
                                    width: 28,
                                  ),
                                  Text("Real madrid"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
