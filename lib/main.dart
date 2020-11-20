import 'package:flutter/material.dart';
import 'package:forum_test/Landing.dart';
import 'Home.dart';
import 'Login/forgot.dart';
import 'Login/login.dart';
import 'Login/verification.dart';
import 'Login/signup.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Forum",
      home: LandingPage(),
      routes: <String, WidgetBuilder>{
        "/register": (BuildContext context) => SignUp(),
        "/forgot": (BuildContext context) => Forgot_Password(),
        "/verification": (BuildContext context) => Verification(),
        '/login': (BuildContext context) => new SignIn(),
        '/home': (BuildContext context) => new HomePage(),
      },
      initialRoute: '/',
    );
  }
}
