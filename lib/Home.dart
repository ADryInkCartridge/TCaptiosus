import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
            image: AssetImage("assets/img/bulet2 3.png"),
            fit: BoxFit.cover,
          ))),
          AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/img/logo.png",
                  width: 140,
                  height: 400,
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 75,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/img/mel.PNG"),
                  radius: 60,
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
