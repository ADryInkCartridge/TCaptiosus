import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:email_validator/email_validator.dart';
import 'signup.dart';
import "forgot.dart";
import 'package:forum_test/Home.dart';

void main() => runApp(MaterialApp(
      home: SignIn(),
    ));

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 155.0, 40.0, 0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        "assets/img/logo.png",
                      ),
                      SizedBox(height: 60.0),
                      Text(
                        "Sign In Now",
                        style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        // color: Colors.orange,
                        cursorColor: HexColor("ef9c80"),
                        decoration: new InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
                          // filled: true,
                          // fillColor: HexColor("ef9c80"),
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
                      SizedBox(height: 30.0),
                      TextFormField(
                        // color: Colors.orange,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        cursorColor: HexColor("ef9c80"),
                        obscureText: true,
                        decoration: new InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
                          // filled: true,
                          // fillColor: HexColor("ef9c80"),
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
                          ),
                        ),
                        validator: (password) {
                          Pattern pattern =
                              r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(password))
                            return 'Password must contain';
                          else
                            return null;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            text: "Forgot ",
                            style: TextStyle(
                              // color: Colors.blue[700],
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Password?",
                                style: TextStyle(
                                  color: HexColor("8293c2"),
                                  fontFamily: 'Poppins',
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Forgot_Password()));
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Center(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: HexColor("8293c2"),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              print(email);
                              print(password);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomePage()),
                                  ModalRoute.withName('/'));
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              // color: Colors.blue[700],
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: HexColor("8293c2"),
                                  fontFamily: 'Poppins',
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.pushNamed(context, "/register");
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                              ),
                            ],
                          ),
                        ),
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
