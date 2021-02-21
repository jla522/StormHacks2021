import './Dish.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/User.dart';

final dbRef = FirebaseDatabase.instance.reference();
final db = FirebaseDatabase.instance;

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

Future<User> getUserInfo(String uid) async {
  DataSnapshot dataSnapshot =
      await dbRef.child("Users").orderByChild("userid").equalTo(uid).once();

  if (dataSnapshot.value != null) {
    print("from Query.dart");
    print(dataSnapshot.value);
  }
  return User.fromSnapshot(dataSnapshot);
}

DatabaseReference saveUser(User user) {
  var id = dbRef.child("Users/").push();
  id.set(user.toJson());
  return id;
}
