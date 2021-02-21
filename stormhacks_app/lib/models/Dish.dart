import 'package:firebase_database/firebase_database.dart';

class Dish {
  String key;
  String restaurant;
  bool fairTrade;
  String dishName;

  Dish(this.restaurant, this.fairTrade, this.dishName);

  Dish.fromSnapshot(DataSnapshot snapshot) {
    key = snapshot.key;
    restaurant = snapshot.value["Restaurant"];
    fairTrade = snapshot.value["FairTrade"];
    dishName = snapshot.value["Dish"];
  }

  // Uploading back to Firebase
  toJson() {
    return {
      "Restaurant": restaurant,
      "FairTrade": fairTrade,
      "Dish": dishName,
    };
  }
}

Dish createDish(record) {
  Map<String, dynamic> attributes = {
    "Restaurant": "",
    "FairTrade": false,
    "Dish": "",
  };
  record.forEach((key, val) => {attributes[key] = val});
  bool fairTradeBool = attributes["FairTrade"] == "True" ? true : false;
  Dish dish =
      new Dish(attributes["Restaurant"], fairTradeBool, attributes["Dish"]);

  return dish;
}
