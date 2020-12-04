import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'database.dart';

// ignore: camel_case_types
class Add_Answer extends StatefulWidget {
  final String questionId;
  Add_Answer({Key key, @required this.questionId}) : super(key: key);
  @override
  _Add_AnswerState createState() => _Add_AnswerState(questionId);
}

// ignore: camel_case_types
class _Add_AnswerState extends State<Add_Answer> {
  String deskripsi;
  String questionId;
  _Add_AnswerState(this.questionId);
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(35, 20, 35, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 48,
                    // padding: EdgeInsets.fromLTRB(35, 20, 35, 0),
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, -5, 10, -5),
                              filled: true,
                              fillColor: Colors.cyan[50],
                              labelText: 'Search',
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 450,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.red[700],
                          width: 2,
                        ),
                      ),
                      color: Colors.white,
                      child: Container(
                        // padding: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                                    child: TextField(
                                      onChanged: (val) {
                                        setState(() => deskripsi = val);
                                      },
                                      maxLines: null,
                                      decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                      onEditingComplete: () => node.nextFocus(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/img/attach.png',
                          fit: BoxFit.fill,
                          width: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          DatabaseService().addAnswer(questionId, deskripsi);
                        },
                        icon: Image.asset(
                          'assets/img/checklist.png',
                          fit: BoxFit.fill,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
