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
  final searchBar = TextEditingController();
  int id = 1;

  String name = "Melanchton Bonaficio Butarbutar";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                  onPressed: () => Navigator.of(context).pop(),
                ),
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
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(context, '/'),
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
        ));
  }
}
