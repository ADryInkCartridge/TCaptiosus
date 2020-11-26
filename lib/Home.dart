import 'package:flutter/material.dart';
import 'package:forum_test/Card/CardCons.dart';
import 'package:forum_test/Card/HomeCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:forum_test/Services/auth.dart';
import 'package:forum_test/Services/database.dart';
import 'package:forum_test/wrapper.dart';
import 'package:provider/provider.dart';

Text status(bool id) {
  if (id == true)
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
  final searchBar = TextEditingController();
  final authService auth = authService();
  final FirebaseAuth user = FirebaseAuth.instance;
  String name = '';
  bool id;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  void getUserData() async {
    final FirebaseUser data = await user.currentUser();
    final String uid = data.uid;
    print(uid);
    // ignore: unused_local_variable
    DocumentSnapshot userData =
        await Firestore.instance.collection('users').document(uid).get()
            // ignore: missing_return
            .then((DocumentSnapshot value) {
      if (value.data["Name"].toString() != name)
        setState(() {
          name = value.data["Name"].toString();
          id = value.data["Status"];
        });
    });
  }

  final databaseReference = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Subjects>>.value(
      value: DatabaseService().questions,
      child: new Scaffold(
          resizeToAvoidBottomInset: false,
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
                      onPressed: () {
                        print(DatabaseService().questions.length);
                        // auth.signOut();
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => Wrapper()),
                        //     ModalRoute.withName('/wrapper'));
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
                            style:
                                TextStyle(fontFamily: "Poppins", fontSize: 14),
                            textAlign: TextAlign.center,
                            cursorColor: Colors.grey,
                            controller: searchBar,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(
                                bottom: 0,
                              ),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                  fontFamily: "Poppins", fontSize: 14),
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
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, '/'),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/img/mel.PNG"),
                          radius: 60,
                        ),
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
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Questions",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
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
          )),
    );
  }
}
