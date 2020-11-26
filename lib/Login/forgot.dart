import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:email_validator/email_validator.dart';

void main() => runApp(MaterialApp(
      home: Forgot_Password(),
    ));

// ignore: camel_case_types
class Forgot_Password extends StatefulWidget {
  @override
  _Forgot_PasswordState createState() => _Forgot_PasswordState();
}

// ignore: camel_case_types
class _Forgot_PasswordState extends State<Forgot_Password> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(40.0, 155.0, 40.0, 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/bg2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Forgot your Password",
                        style: TextStyle(fontSize: 24, fontFamily: 'Poppins'),
                      ),
                      Text(
                        "we here to help you",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 24),
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: Text(
                          "Email Address",
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        // color: Colors.orange,
                        cursorColor: HexColor("ef9c80"),
                        decoration: new InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
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
                        validator: (email) => EmailValidator.validate(email)
                            ? null
                            : "Invalid email address",
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
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
                          onPressed: () {},
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
