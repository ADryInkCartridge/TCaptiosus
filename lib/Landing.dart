import 'package:flutter/material.dart';
import 'Color.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 47),
        child: SizedBox(
          height: 34,
          width: 171,
          child: FloatingActionButton.extended(
            elevation: 0,
            onPressed: () => Navigator.pushNamed(context, "/login"),
            label: Text(
              "Get Started",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            backgroundColor: getstarted,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
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
                      "assets/img/logo gede.png",
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
                        height: 1.1,
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
