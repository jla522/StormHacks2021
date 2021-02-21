import 'package:flutter/material.dart';
import 'navBar.dart';

class schedule extends StatefulWidget {
  schedule({Key key}) : super(key: key);

  @override
  _scheduleState createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
	@override
	String currentDay = "Monday (Today)";
	List<String> currentDayRestaurants = ["Gawon (MBC)", "Bubble Waffle (MBC)", "Subway (Mackenzie)"];
	List<String> currentDayDeals       = ["Bibimbap", "Bubble Waffle + BBT", "Tuna Salad (6-inch)"];
	List<String> daysOfWeek = ["Tuesday", "Wednesday", "Thursday", "Friday"];
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: navBar(),
			body: Container(
				margin: const EdgeInsets.fromLTRB(30, 70, 30, 30),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Text("Schedule (MON-FRI)", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),	
						daySection(currentDay, currentDayRestaurants, currentDayDeals),
						for(int i = 0; i < daysOfWeek.length; i++) daySection(daysOfWeek[i], currentDayRestaurants, currentDayDeals),
					],
				), 
			),
		);
  }
}

class daySection extends StatelessWidget{
	final String _day;
	final List<String> _restaurants;
	final List<String> _deals;

	daySection(this._day, this._restaurants, this._deals);
	@override
	Widget build(BuildContext context){
		int restaurant_len = _restaurants.length;
		int deal_len = _deals.length;
		return Container(
			padding: const EdgeInsets.fromLTRB(10, 15, 30, 70),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Text(_day, style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
					Divider(color: Colors.black),
					for(int i = 0; i < restaurant_len; i++)	foodDeal(_restaurants[i], _deals[i]),
					
				],//children
			),//Column
		); //container
	}//widget
}//daySection

class foodDeal extends StatelessWidget {
	final String _restaurant;
	final String _deal;
	
	foodDeal(this._restaurant, this._deal);
	@override
	Widget build(BuildContext context){
		return Row(
			children: <Widget>[
				//i have no idea how to add a box
				Column(
					children: <Widget>[
						Text(_restaurant, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
						Text(_deal, style: TextStyle(fontSize: 24)),
					], //children
				), //Column
			],//children
		);//row
	}//build
}
