import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userProfile =
      Firestore.instance.collection('users');

  Future updateUserData(String name, bool status) async {
    return await userProfile
        .document(uid)
        .setData({'Name': name, 'Status': status});
  }

  Future getUserData() async {
    final CollectionReference userProfile =
        Firestore.instance.collection('users');
    return await userProfile
        .document(uid)
        .get()
        .then((DocumentSnapshot data) => print(data.data["name"]["status"]));
  }

  Future getUserData2() async {
    final CollectionReference userProfile =
        Firestore.instance.collection('users');
    return await userProfile
        .document("")
        .get()
        .then((DocumentSnapshot data) => print(data.data["Name"].toString()));
  }
}
