import 'package:flutter/material.dart';

class FairTradeProgress extends StatelessWidget {
  FairTradeProgress({this.numMeals, this.showBorder});
  final int numMeals;
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 50),
        decoration: showBorder
            ? BoxDecoration(border: Border.all(color: Colors.black, width: 3))
            : BoxDecoration(),
        width: 500,
        height: 160,
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "$numMeals Fair Trade meals away from an extra token",
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
      valueColor: AlwaysStoppedAnimation(Colors.black),
      minHeight: 20,
      value: progressVal,
    );
  }
}
