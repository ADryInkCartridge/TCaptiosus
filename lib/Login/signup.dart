import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forum_test/Services/auth.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:email_validator/email_validator.dart';
import 'verification.dart';

void main() => runApp(MaterialApp(
      home: SignUp(),
    ));

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = '';
  String email = '';
  String password = '';
  String _value;
  bool status = true;
  final authService auth = authService();
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
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 155.0, 40.0, 0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/img/bg.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/img/logo.png",
                      ),
                      SizedBox(height: 40.0),
                      TextFormField(
                        // color: Colors.orange,
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                        cursorColor: HexColor("ef9c80"),
                        decoration: new InputDecoration(
                          labelText: "Name",
                          hintText: "Enter your name",
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
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                        // color: Colors.orange,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
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
                        decoration: new InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
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
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                      ),
                      SizedBox(height: 30.0),
                      // TextFormField(
                      //   // color: Colors.orange,
                      //   cursorColor: HexColor("ef9c80"),
                      //   decoration: new InputDecoration(
                      //     labelText: "Title",
                      //     hintText: "Enter your title",
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       borderSide: BorderSide(
                      //         color: HexColor("ef9c80"),
                      //       ),
                      //     ),
                      //     enabledBorder: new OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       borderSide: BorderSide(
                      //         color: HexColor("ef9c80"),
                      //         width: 2.0,
                      //       ),
                      //       // labelText: "Email,
                      //     ),
                      //   ),
                      //   textInputAction: TextInputAction.next,
                      //   onEditingComplete: () => node.nextFocus(),
                      // ),
                      Container(
                        child: DropdownButton<String>(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          items: [
                            DropdownMenuItem<String>(
                              child: Text(
                                "Dosen",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              value: 'one',
                            ),
                            DropdownMenuItem<String>(
                              child: Text(
                                "Mahasiswa",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              value: 'two',
                            ),
                          ],
                          onChanged: (String value) {
                            setState(() {
                              _value = value;
                              if (value == "two") {
                                status = true;
                              } else {
                                status = false;
                              }
                            });
                          },
                          hint: Text('Title'),
                          value: _value,
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
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              print(name);
                              print(email);
                              print(password);
                              print(status);
                              print(_value);
                              dynamic result = await auth.regEmailandPass(
                                  email, password, name, status);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Verification()),
                                  ModalRoute.withName('/'));
                            }
                          },
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
