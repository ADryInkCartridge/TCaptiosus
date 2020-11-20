import 'package:flutter/material.dart';
import 'package:forum_test/Landing.dart';
import 'Login.dart';
import 'Home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Forum",
      routes: <String, WidgetBuilder>{
        '/login2': (BuildContext context) => new LoginPage(),
        '/': (BuildContext context) => new LandingPage(),
        '/login': (BuildContext context) => new LoginPage(),
        '/home': (BuildContext context) => new HomePage(),
      },
      initialRoute: '/',
    );
  }
}
