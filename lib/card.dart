import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  MyCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
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
          ],
        ),
      ),
    );
  }
}
