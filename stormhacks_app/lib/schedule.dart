import 'package:flutter/material.dart';
import 'navBar.dart';

class schedule extends StatefulWidget {
  schedule({Key key}) : super(key: key);

  @override
  _scheduleState createState() => _scheduleState();
}


//TODO::
//Query database for a day's restaurants & the restaurant's dishes/pictures
//printint restaurants and their pictures/dishes are currently hard coded and must be adjusted


class _scheduleState extends State<schedule> {
	@override
	Map days = {1: 'Monday', 2: 'Tuesday', 3: 'Wednesday', 4: 'Thursday', 5: 'Friday'}; 	


	String currentDay = "Monday (Today)";
	List<String> currentDayRestaurants = ["Gawon (MBC)", "Bubble Waffle (MBC)", "Subway (Mackenzie)"];
	List<String> currentDayDeals       = ["Bibimbap", "Bubble Waffle + BBT", "Tuna Salad (6-inch)"];
	List<String> daysOfWeek = ["Tuesday", "Wednesday", "Thursday", "Friday"];
	Widget build(BuildContext context) {
		//days.entries.forEach((e){
			//create a map with {day: [restaurant1, restaurant2, restaurant3], day2: [restaurant1, restaurant2]}
			//create a map with {restaurant1: dish1, restaurant2: dish2}
			//determine current day
		//});
		return Scaffold(
			bottomNavigationBar: navBar(),
			body: ListView(
				children: <Widget>[
					Container(
						margin: const EdgeInsets.fromLTRB(30, 70, 30, 30),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text("Schedule (MON-FRI)", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),	
								daySection(currentDay, currentDayRestaurants, currentDayDeals),//only prints currentDay, its restaurants, and the restaurant's deals (hard coded)
								for(int i = 0; i < daysOfWeek.length; i++) daySection(daysOfWeek[i], currentDayRestaurants/* this should be something like restaurants["Tuesday"] */, currentDayDeals/* should be like deals["Tuesday"]*/),
																											//where deals is a map of {restaurant: deal} 
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
	final List<String> _restaurants;
	final List<String> _deals;

	daySection(this._day, this._restaurants, this._deals);
	@override
	Widget build(BuildContext context){
		int restaurant_len = _restaurants.length;
		int deal_len = _deals.length;
		return Container(
			margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Text(_day, style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
					Divider(color: Colors.black),
					for(int i = 0; i < restaurant_len; i++)	foodDeal(_restaurants[i], _deals[i]),
					
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
		return Row(
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				Container(
					height: 60.0,
					width: 60.0,
					decoration: BoxDecoration( image: DecorationImage(image: AssetImage('assets/images/settings.png'), fit: BoxFit.fill)),
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
			], //children
		); //Column
	}//build
}
