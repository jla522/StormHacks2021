import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './auth/BasicAuth.dart';
import './auth/GoogleAuth.dart';

class login extends StatefulWidget {
  login({Key key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> with SingleTickerProviderStateMixin {
  FirebaseUser user;
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void googleSignIn() {
    signInWithGoogle().then((value) =>
        {this.user = user, Navigator.pushReplacementNamed(context, '/home')});
  }

  void basicRegister(String email, String password) {
    register(email, password).then((value) => {
          {this.user = user, Navigator.pushReplacementNamed(context, '/home')}
        });
  }

  void basicSignIn(String email, String password) {
    signInWithBasic(email, password).then((value) => {
          {this.user = user, Navigator.pushReplacementNamed(context, '/home')}
        });
  }

  Widget googleLoginButton() {
    return MaterialButton(
        onPressed: this.googleSignIn,
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                      image: AssetImage('assets/images/google_logo.png'),
                      height: 35),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Login with Google"))
                ])));
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image: new AssetImage("assets/images/cool.jpeg"),
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // new FlutterLogo(
              //   size: _iconAnimation.value * 100,
              // ),
              Image(
                image: new AssetImage("assets/images/coffee.png"),
                height: 200,
              ),
              // Image.asset("assets/images/coffee.png"),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.green,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.white, fontSize: 20.0))),
                  child: new Container(
                    padding: const EdgeInsets.all(30.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          controller: emailController,
                          decoration: new InputDecoration(
                            labelText: "Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          controller: passwordController,
                          decoration: new InputDecoration(
                            hintText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                        ),
                        new MaterialButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          child: new Text("Login"),
                          onPressed: () => {
                            basicSignIn(
                                emailController.text, passwordController.text)
                            // basicRegister(
                            //     emailController.text, passwordController.text)
                            // Navigator.pushReplacementNamed(context, '/home')
                          },
                          splashColor: Colors.greenAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              googleLoginButton(),
            ],
          )
        ],
      ),
    );
  }
}
