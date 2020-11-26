import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forum_test/Card/CardCons.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userProfile =
      Firestore.instance.collection('users');
  final CollectionReference questionEntries =
      Firestore.instance.collection('questions');

  Future updateUserData(String name, bool status) async {
    return await userProfile
        .document(uid)
        .setData({'Name': name, 'Status': status});
  }

  List<Subjects> _subjectSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      print(doc.data.toString());
      return Subjects(
        nama: doc.data['name'] ?? ' ',
        jam: doc.data['jam'] ?? '',
        pelajaran: doc.data['pelajaran'] ?? ' ',
        materi: doc.data['materi'] ?? ' ',
      );
    }).toList();
  }

  Stream<List<Subjects>> get questions {
    return questionEntries.snapshots().map(_subjectSnapshots);
  }
}
