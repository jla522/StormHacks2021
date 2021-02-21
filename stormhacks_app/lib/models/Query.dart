import './Dish.dart';
import 'package:firebase_database/firebase_database.dart';

final dbRef = FirebaseDatabase.instance.reference();

Future<List<Dish>> getDishes(String weekday) async {
  DataSnapshot dataSnapshot =
      await dbRef.child("Schedule").child(weekday).child("Dishes").once();

  List<Dish> dishes = [];
  if (dataSnapshot.value != null) {
    for (var i = 0; i < dataSnapshot.value.length; i++) {
      Dish dish = createDish(dataSnapshot.value[i]);
      dishes.add(dish);
    }
  }
  return dishes;
}
