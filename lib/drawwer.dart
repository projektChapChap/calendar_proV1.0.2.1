import 'package:calendar_pro/Body.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'DateRange.dart';
import 'DayDetails/Details.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  var activePage = Today();
  bool buttonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(128, 128, 128, 9.1),
      ),
      body: (buttonClicked) ? activePage : Today(),
      bottomNavigationBar: ConvexAppBar(
        activeColor: Colors.black.withOpacity(0.5),
        color: Colors.white,
        backgroundColor: Colors.grey,
        items: [
          TabItem(icon: Icons.calculate),
          TabItem(icon: Icons.sports_soccer),
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.event_available),
          TabItem(icon: Icons.calendar_today_sharp),
        ],
        initialActiveIndex: 2, //optional, default as 0
        onTap: (int i) => {
          if (i == 0)
            {
              buttonClicked = true,
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DateRangeSelector()),
              )
            }
          else if (i == 1)
            {}
          else if (i == 3)
            {}
          else if (i == 4)
            {
              buttonClicked = true,
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DayDetails()),
              )
            }
          else
            {}
        },
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(128, 128, 128, 8),
              ),
              child: Text('Welcome'),
            ),
            ListTile(
              title: const Text('Rate us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Download other apps'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
