import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'navBar.dart';

// Getting the date
DateTime now = new DateTime.now();
String date = DateFormat('EEEE LLL d').format(now);
String dayOfWeek = DateFormat('EEEE').format(now);

class buy extends StatefulWidget {
  buy({Key key}) : super(key: key);

  @override
  final dbRef = FirebaseDatabase.instance.reference();
  _buyState createState() => _buyState();
}

class _buyState extends State<buy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                date,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          _todaysEvents('Gawon (MBC)', 'Bibimbap'),
        ],
      ),
      bottomNavigationBar: navBar(),
    );
  }

  Container _todaysEvents(String restaurant, String dish) {
    // String image
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      //color: Colors.white, //remove

      padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 120, // add image
            width: 120,
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurant,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        dish,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      _claimButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _claimButton() {
    return Container(
        height: 40,
        width: 80,
        child: TextButton(
          child: Text('CLAIM'),
          style: TextButton.styleFrom(
            primary: Colors.black,
            backgroundColor: Color(0xFF21B7E6),
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          onPressed: () {},
        ));
  }
}
