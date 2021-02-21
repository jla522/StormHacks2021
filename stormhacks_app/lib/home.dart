import 'package:flutter/material.dart';
import 'navBar.dart';
import './UIWidgets/FairTradeProgress.dart';

class home extends StatefulWidget {
  home({Key key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  String username = "Jordan";
  int numTokens = 12;
  int numMealsAway = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: navBar(),
        body: Container(
          margin: const EdgeInsets.fromLTRB(30, 70, 30, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserPrompt(username, numTokens),
              Text("Today's Meals", style: TextStyle(fontSize: 20)),
              _buildTodaysMeals(),
              Text("Fair Trade Progress", style: TextStyle(fontSize: 20)),
              FairTradeProgress(
                numMeals: 12,
                showBorder: true,
              ),
            ],
          ),
        ));
  }

  Container _buildUserPrompt(String name, int numTokens) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: 400,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hi $name", style: TextStyle(fontSize: 40)),
          _buildRemainingTokens(numTokens)
        ],
      ),
    );
  }

  RichText _buildRemainingTokens(int numTokens) {
    return RichText(
        text: TextSpan(
            text: "You have ",
            style: TextStyle(fontSize: 18, color: Colors.black),
            children: [
          TextSpan(
              text: "$numTokens",
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: " tokens.")
        ]));
  }

  Container _buildTodaysMeals() {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 40),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
        width: 400,
        height: 175,
        child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_buildMeals(), _buildViewAllMealsBtn()],
            )));
  }

  ElevatedButton _buildViewAllMealsBtn() {
    return ElevatedButton(
      child: Text("VIEW ALL"),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
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

  // Container _buildTradeProgess(int numMeals) {
  //   return Container(
  //       margin: const EdgeInsets.only(top: 10, bottom: 50),
  //       decoration:
  //           BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
  //       width: 400,
  //       height: 160,
  //       child: Container(
  //           margin: const EdgeInsets.all(20),
  //           child: Column(
  //             children: [
  //               Text(
  //                 "$numMeals Fair Trade meals away from an extra token",
  //                 style: TextStyle(fontSize: 18),
  //               ),
  //               _buildTokenRange(0, 5),
  //               _buildProgressBar()
  //             ],
  //           )));
  // }

  // Container _buildTokenRange(int start, int end) {
  //   return Container(
  //       margin: const EdgeInsets.only(top: 20, bottom: 10),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [Text(start.toString()), Text(end.toString())],
  //       ));
  // }

  // LinearProgressIndicator _buildProgressBar({double progressVal = 0.6}) {
  //   return LinearProgressIndicator(
  //     backgroundColor: Colors.grey,
  //     valueColor: AlwaysStoppedAnimation(Colors.black),
  //     minHeight: 20,
  //     value: progressVal,
  //   );
  // }
}
