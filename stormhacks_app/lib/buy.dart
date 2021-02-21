import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';

import 'navBar.dart';

// Getting the date
DateTime now = new DateTime.now();
String date = DateFormat('EEEE LLL d').format(now);
String dayOfWeek = DateFormat('EEEE').format(now);

class buy extends StatefulWidget {
  buy({Key key}) : super(key: key);

  @override
  _buyState createState() => _buyState();
}

class _buyState extends State<buy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              date,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              //photo,
              children: <Widget>[
                Column(
                  //Title of place
                  children: <Widget>[
                    Row(
                        // Tital of dish
                        //Button
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: navBar(),
    );
  }
}
