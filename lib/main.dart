import 'package:flutter/material.dart';
import 'package:forum_test/Landing.dart';
import 'package:forum_test/Services/add_questions.dart';
import 'package:forum_test/Services/auth.dart';
import 'package:forum_test/Services/user.dart';
import 'package:forum_test/wrapper.dart';
import 'Home.dart';
import 'Login/forgot.dart';
import 'Login/login.dart';
import 'Login/verification.dart';
import 'Login/signup.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: authService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: <String, WidgetBuilder>{
          "/landing": (BuildContext context) => LandingPage(),
          "/register": (BuildContext context) => SignUp(),
          "/forgot": (BuildContext context) => Forgot_Password(),
          "/verification": (BuildContext context) => Verification(),
          '/login': (BuildContext context) => new SignIn(),
          '/home': (BuildContext context) => new HomePage(),
          '/add_question': (BuildContext context) => new Add_Question(),
        },
        initialRoute: '/',
      ),
    );
  }
}
