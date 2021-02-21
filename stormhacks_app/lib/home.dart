import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'navBar.dart';
import './UIWidgets/FairTradeProgress.dart';
import './models/Dish.dart';
import './models/Query.dart';
import './models/User.dart';
import './auth/BasicAuth.dart';

DateTime now = new DateTime.now();
String dayOfWeek = DateFormat('EEEE').format(now);

class home extends StatefulWidget {
  home({Key key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<Dish> dishes = [];
  User user;
  String username = "Jordan";
  int numTokens = 12;
  int numMealsAway = 2;

  void loadDishes(String weekday) {
    getDishes(weekday).then((dishes) => {
          this.setState(() {
            this.dishes = dishes;
          })
        });
    getUser().then((user) {
      getUserInfo(user.uid).then((userInfo) {
        print("userInfo from home.dart");
        print(userInfo.firstName);
        print(userInfo.numTokensAway);
        this.setState(() {
          this.user = userInfo;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadDishes(dayOfWeek);
  }

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
                numMeals: numMealsAway,
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
        print("Pressed VIEW ALL button");
      },
    );
  }

  Row _buildMeals() {
    List<Container> todaysMeals = [];
    for (final dish in dishes) {
      todaysMeals.add(_buildMeal(dish.restaurant, dish.dishName));
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: todaysMeals);
  }

  Container _buildMeal(String restaurant, String dishName) {
    double dimension = 90.0;
    Color color = Colors.grey;
    return Container(
        height: dimension,
        width: dimension,
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(restaurant, style: TextStyle(fontSize: 14)),
            Text(dishName, style: TextStyle(fontSize: 12)),
          ],
        ));
  }
}
