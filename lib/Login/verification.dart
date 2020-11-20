import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MaterialApp(
      home: Verification(),
    ));

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String nrp = '';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(40.0, 155.0, 40.0, 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/bg2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "We need to verify you",
                style: TextStyle(fontSize: 24, fontFamily: 'Poppins'),
              ),
              Text(
                "That you are TC ITS student",
                style: TextStyle(fontFamily: 'Poppins', fontSize: 24),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  "NRP",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                onChanged: (val) {
                  setState(() => nrp = val);
                },
                // color: Colors.orange,
                keyboardType: TextInputType.number,
                cursorColor: HexColor("ef9c80"),
                decoration: new InputDecoration(
                  labelText: "NRP",
                  hintText: "Enter your NRP",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: HexColor("ef9c80"),
                    ),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: HexColor("ef9c80"),
                      width: 2.0,
                    ),
                    // labelText: "Email,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: HexColor("8293c2"),
                    child: Text(
                      "Send",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                      }
                    }),
              ),
              SizedBox(height: 140.0),
              Image.asset(
                "assets/img/logo.png",
                width: 100,
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
