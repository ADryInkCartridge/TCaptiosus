import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'database.dart';

void main() => runApp(MaterialApp(
      home: Add_Question(),
    ));

class Add_Question extends StatefulWidget {
  Add_Question({Key key, this.url}) : super(key: key);
  final String url;
  @override
  _Add_QuestionState createState() => _Add_QuestionState();
}

class _Add_QuestionState extends State<Add_Question> {
  // Future<String> uploadImage(filename, url) async {
  //   var request = http.MultipartRequest('POST', Uri.parse(uri));
  //   request.files.add(await http.MultipartFile.FromPath('picture', filename));
  //   var res = await request.send();
  //   return res.reasonPhrase;
  // }
  // String state = "";
  String materi = '';
  String pelajaran = '';
  String deskripsi = '';
  String jam = '';
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
                    height: 48,
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() => pelajaran = val);
                      },
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, -5, 10, -5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Subject',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[500]),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 48,
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() => materi = val);
                      },
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, -5, 10, -5),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Subject Matter',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[500]),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 250,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.grey[500],
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
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: TextField(
                                      onChanged: (val) {
                                        setState(() => deskripsi = val);
                                      },
                                      maxLines: null,
                                      decoration: InputDecoration(
                                        labelText: 'Add your Question Here',
                                        labelStyle: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                        ),
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
                        onPressed: () async {
                          DatabaseService()
                              .addQuestion(pelajaran, materi, deskripsi);
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
