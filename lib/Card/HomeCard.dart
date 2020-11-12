import 'CardCons.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return subjectList(context);
  }
}

Widget subjectList(BuildContext context) {
  List<Subjects> items = [
    Subjects(
        nama: "Aji Rindra FPF",
        materi: "Teknik Terbuka Secant",
        pelajaran: "Komputasi Numerik",
        jam: 23),
    Subjects(
        nama: "Melanchton Bonaficio",
        materi: "Read Only Memory",
        pelajaran: "Organisasi Komputer",
        jam: 15),
    Subjects(
        nama: "Gerald Elroy Van Ryan",
        materi: "Inheritance",
        pelajaran: "Pemograman Basis Objek",
        jam: 2),
    Subjects(
        nama: "Gerald Elroy Van Ryan",
        materi: "Inheritance",
        pelajaran: "Pemograman Basis Objek",
        jam: 2),
    Subjects(
        nama: "Gerald Elroy Van Ryan",
        materi: "Inheritance",
        pelajaran: "Pemograman Basis Objek",
        jam: 2),
  ];

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        margin: EdgeInsets.fromLTRB(30, 15, 20, 15),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: new InkWell(
          onTap: () => print("tapped"),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          items[index].pelajaran,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Materi : ${items[index].materi}",
                          style: TextStyle(
                            height: 1.8,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          items[index].nama,
                          style: TextStyle(
                            height: 1.8,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Post",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          items[index].jam.toStringAsFixed(2),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
    },
  );
}
