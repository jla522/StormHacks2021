import 'package:flutter/material.dart';
import 'navBar.dart';
import './UIWidgets/FairTradeProgress.dart';

class tokens extends StatefulWidget {
  tokens({Key key}) : super(key: key);

  @override
  _tokensState createState() => _tokensState();
}

class _tokensState extends State<tokens> {
  int remainingTokens = 12;
  int usedTokens = 0;
  int numMealsAway = 2;
  String currentMonth = "February";
  String nextMonth = "MARCH";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: navBar(),
        body: Container(
            margin: const EdgeInsets.fromLTRB(40, 70, 40, 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("$remainingTokens Tokens remaining for $currentMonth",
                  style: TextStyle(fontSize: 32)),
              _buildTokensUsed(usedTokens),
              FairTradeProgress(
                numMeals: numMealsAway,
                showBorder: true,
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_buildRequestMontlyPass(nextMonth)],
              ))
            ])));
  }

  Container _buildTokensUsed(int numTokens) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 60),
        child: RichText(
            text: TextSpan(
                text: "$numTokens",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: " token(s) used",
                  style: TextStyle(fontWeight: FontWeight.normal)),
            ])));
  }

  ElevatedButton _buildRequestMontlyPass(String month) {
    return ElevatedButton(
      child: Text("REQUEST $month PASS"),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
      onPressed: () {
        print("request monthly button pressed");
      },
    );
  }
}
