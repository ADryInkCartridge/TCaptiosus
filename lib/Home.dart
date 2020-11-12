import 'package:flutter/material.dart';
import 'package:forum_test/Card/HomeCard.dart';

Text status(int id) {
  if (id == 1)
    return Text(
      "Mahasiswa",
      style: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    );
  else
    return Text(
      "Dosen",
      style: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int id = 1;
  String name = "Melanchton Bonaficio Butarbutar";
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
            children: <Widget>[
              SizedBox(
                height: 75,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/img/mel.PNG"),
                  radius: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: status(id),
              ),
              Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Center(
                  child: SubjectCard(),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
