import 'package:flutter/material.dart';
import 'package:forum_test/Landing.dart';
import 'Login.dart';
import 'Home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Forum",
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new LandingPage(),
        '/login': (BuildContext context) => new LoginPage(),
        '/home': (BuildContext context) => new HomePage(),
      },
      initialRoute: '/',
    );
  }
}
