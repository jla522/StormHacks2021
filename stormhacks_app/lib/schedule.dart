import 'dart:developer';
import 'package:flutter/material.dart';
import 'navBar.dart';
import './models/Dish.dart';
import './models/Query.dart';
class schedule extends StatefulWidget {
  schedule({Key key}) : super(key: key);

  @override
  _scheduleState createState() => _scheduleState();
}


	
List<String> daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
//TODO::
//Query database for a day's restaurants & the restaurant's dishes/pictures
//printint restaurants and their pictures/dishes are currently hard coded and must be adjusted


class _scheduleState extends State<schedule> {
	List<Dish> dishes = [];	
	void loadDishes(String weekday) {
		getDishes(weekday).then((dishes) => {
			this.setState(() {
				this.dishes = dishes;
			})
		});
	}
	@override
	void initState() {
		super.initState();
		daysOfWeek.forEach((String day) {
			loadDishes(day);
		});
	}
	
	List<String> currentDayRestaurants = ["Gawon (MBC)", "Bubble Waffle (MBC)", "Subway (Mackenzie)"];
	List<String> currentDayDeals       = ["Bibimbap", "Bubble Waffle + BBT", "Tuna Salad (6-inch)"];
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: navBar(),
			body: ListView(
				children: <Widget>[
					Container(
						margin: const EdgeInsets.fromLTRB(30, 70, 30, 30),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text("Schedule", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),	
								for(int i = 0; i < daysOfWeek.length; i++) daySection(daysOfWeek[i], dishes),
							],//children
						),//column
					),//container	
				],//children
			),//listview
		);//scaffold
	}//Widget Build
}//class

class daySection extends StatelessWidget{ 
//daySection creates the day string (i.e. Tuesday), and passes in a list of restaurants and their deals for that given day to class:foodDeal
	final String _day;
	final List<Dish> _dishes; 
	daySection(this._day, this._dishes);
	@override
	Widget build(BuildContext context){
		return Container(
			margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Text(_day, style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
					Divider(color: Colors.black),
					for(final dish in _dishes) foodDeal(dish.restaurant, dish.dishName),
					
				],//children
			),//Column
		);
	}//widget
}//daySection

class foodDeal extends StatelessWidget {
//foodDeal prints out a picture of the restaurant, the restaurant string, and their deal.
	final String _restaurant;
	final String _deal;
	
	foodDeal(this._restaurant, this._deal);
	@override
	Widget build(BuildContext context){
		String imageString = "assets/images/"+_restaurant+".png";
		return Row(
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				Container(
					height: 60.0,
					width: 60.0,
					decoration: BoxDecoration( image: DecorationImage(image: AssetImage(imageString), fit: BoxFit.fill)),
				),
				Container(
					margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text(_restaurant, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
							Text(_deal, style: TextStyle(fontSize: 12) ),
						],//children
					), //column
				),//container
				//Container(
				//	margin: const EdgeInsets.only(right: 30),
				//	height: 40.0,
				//	width: 40.0,
				//	decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/settings.png'), fit: BoxFit.fill)),
				//),//container
			], //children
		); //Column
	}//build
}
