import 'package:flutter/material.dart';
import 'package:forum_test/Card/CardCons.dart';

class QuestionCard extends StatefulWidget {
  final Subjects questionDetails;
  QuestionCard({Key key, @required this.questionDetails}) : super(key: key);
  @override
  _QuestionCardState createState() => _QuestionCardState(questionDetails);
}

class _QuestionCardState extends State<QuestionCard> {
  Subjects questionDetails;
  final searchBar = TextEditingController();
  _QuestionCardState(this.questionDetails);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
            image: AssetImage("assets/img/bulet2 3.png"),
            fit: BoxFit.cover,
          ))),
          AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  //print(imageUrl);
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(0.0, 3)),
                      ]),
                  height: 30,
                  width: 100,
                  child: Center(
                    child: TextFormField(
                      style: TextStyle(fontFamily: "Poppins", fontSize: 14),
                      textAlign: TextAlign.center,
                      cursorColor: Colors.grey,
                      controller: searchBar,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.only(
                          bottom: 0,
                        ),
                        hintText: "Search",
                        hintStyle:
                            TextStyle(fontFamily: "Poppins", fontSize: 14),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(children: <Widget>[
              SizedBox(
                height: 250,
              ),
              Text(
                questionDetails.nama,
                style: TextStyle(
                  height: 1.8,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                questionDetails.pelajaran,
                style: TextStyle(
                  height: 1.8,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                questionDetails.materi,
                style: TextStyle(
                  height: 1.8,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                questionDetails.jam,
                style: TextStyle(
                  height: 1.8,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                questionDetails.deskripsi,
                style: TextStyle(
                  height: 1.8,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ]),
          )
        ])));
  }
}
