import 'package:flutter/material.dart';
import 'Color.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, "/home"),
        label: Text("Get Started"),
        backgroundColor: Colors.deepPurple,
        elevation: 12,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
              image: AssetImage("assets/img/bulet2.png"),
              fit: BoxFit.cover,
            ))),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 47, 0),
                    child: Image.asset(
                      "assets/img/logo.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 100,
                ),
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: 44,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: "Disscussing\nhas "),
                        TextSpan(
                            text: "never\n", style: TextStyle(color: never)),
                        TextSpan(text: "been easier "),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
