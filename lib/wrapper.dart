import 'package:flutter/material.dart';
import 'package:forum_test/Home.dart';
import 'package:provider/provider.dart';
import 'package:forum_test/Landing.dart';
import 'package:forum_test/Services/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null)
      return LandingPage();
    else
      return HomePage();
  }
}
