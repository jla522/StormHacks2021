import 'package:flutter/material.dart';

class navBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFFC4C4C4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Image.asset('assets/images/home.png'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              }),
          IconButton(
              icon: Image.asset('assets/images/calendar.png'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/schedule');
              }),
          IconButton(
              icon: Image.asset('assets/images/fork.png'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/buy');
              }),
          IconButton(
              icon: Image.asset('assets/images/token.png'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/tokens');
              }),
          IconButton(
              icon: Image.asset('assets/images/settings.png'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/settings');
              }),
        ],
      ),
    );
  }
}
