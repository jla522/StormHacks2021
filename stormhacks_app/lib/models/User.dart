import 'package:firebase_database/firebase_database.dart';
import 'package:stormhacks_app/models/Query.dart';

class User {
  String key;
  String userid;
  String firstName;
  int numTokensAway = 5;
  int numTokensMonth = 12;
  int numTokensUsed = 3;

  User(this.userid, this.firstName);

  User.fromSnapshot(DataSnapshot snapshot) {
    key = snapshot.key;
    userid = snapshot.value["userid"];
    firstName = snapshot.value["firstName"];
    numTokensMonth = snapshot.value["numTokensMonth"];
    numTokensAway = snapshot.value["numTokensAway"];
    numTokensUsed = snapshot.value["numTokensUsed"];
  }

  toJson() {
    return {
      "userid": userid,
      "firstName": firstName,
      "numTokensMonth": numTokensMonth,
      "numTokensAway": numTokensAway,
      "numTokensUsed": numTokensUsed,
    };
  }
}

User createUser(String uid, String firstName) {
  User user = new User(
    uid,
    firstName,
  );
  // Add to DB
  saveUser(user);
  return user;
}
