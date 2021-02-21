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
          _buildTodaysMeals(),
          Text("Fair Trade Progress", style: TextStyle(fontSize: 20)),
          _buildTradeProgess(),
        ],
      ),
    ));
  }

  Container _buildUserPrompt() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      width: 400,
      height: 100,
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
        margin: const EdgeInsets.only(top: 10, bottom: 50),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
        width: 400,
        height: 175,
        child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_buildMeals(), _buildViewAllMeals()],
            )));
  }

  ElevatedButton _buildViewAllMeals() {
    return ElevatedButton(
      child: Text("VIEW ALL"),
      onPressed: () {
        print("view all button pressed");
      },
    );
  }

  Row _buildMeals() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMeal(80.0, Colors.grey),
        _buildMeal(80.0, Colors.grey),
        _buildMeal(80.0, Colors.grey),
      ],
    );
  }

  Container _buildMeal(double dimension, Color color) {
    return Container(height: dimension, width: dimension, color: color);
  }

  Container _buildTradeProgess() {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 50),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
        width: 400,
        height: 160,
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "2 Fair Trade meals away from an extra token",
                  style: TextStyle(fontSize: 18),
                ),
                _buildTokenRange(0, 5),
                _buildProgressBar()
              ],
            )));
  }

  Container _buildTokenRange(int start, int end) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(start.toString()), Text(end.toString())],
        ));
  }

  LinearProgressIndicator _buildProgressBar({double progressVal = 0.6}) {
    return LinearProgressIndicator(
      backgroundColor: Colors.grey,
      minHeight: 20,
      value: progressVal,
    );
  }
}
