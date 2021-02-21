import 'package:flutter/material.dart';
import '../auth/BasicAuth.dart';

class LogoutBtn extends StatelessWidget {
  void logout(context) {
    logoutBasic().then((value) => {
          print("User logged out"),
          Navigator.pushReplacementNamed(context, "/")
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          this.logout(context);
        },
        color: Colors.red,
        child: Text("Logout"));
  }
}
