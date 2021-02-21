import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({Key key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String username = "Jordan";
  int numTokens = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.fromLTRB(30, 70, 30, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserPrompt(),
          Text("Today's Meals", style: TextStyle(fontSize: 20)),
          _buildTodaysMeals()
        ],
      ),
    ));
  }

  Container _buildUserPrompt() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      width: 400,
      height: 100,
      color: Colors.amber[600],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hi Jordan",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "You have 12 tokens.",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Container _buildTodaysMeals() {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
        width: 400,
        height: 175,
        child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMeal(80.0, Colors.grey),
                _buildMeal(80.0, Colors.grey),
                _buildMeal(80.0, Colors.grey),
              ],
            )));
  }

  Container _buildMeal(double dimension, Color color) {
    return Container(height: dimension, width: dimension, color: color);
  }
}
