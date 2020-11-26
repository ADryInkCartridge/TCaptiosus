import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:forum_test/Card/CardCons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:io';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userProfile =
      Firestore.instance.collection('users');
  final CollectionReference questionEntries =
      Firestore.instance.collection('questions');

  Future updateUserData(String name, bool status) async {
    String imageUrl =
        "https://firebasestorage.googleapis.com/v0/b/forum-app-6f8de.appspot.com/o/user%2Fimage_picker6226278620418888461.jpg?alt=media&token=d0d4eb9f-1847-422f-8bde-debf987d451c";
    return await userProfile
        .document(uid)
        .setData({'Name': name, 'Status': status, 'imageUrl': imageUrl});
  }

  Future addQuestion(String pelajaran, String materi, String deskripsi) async {
    final FirebaseAuth user = FirebaseAuth.instance;
    final FirebaseUser data = await user.currentUser();
    String jam = 'Test';
    String namaUser = await userProfile
        .document(data.uid)
        .get()
        .then((DocumentSnapshot value) {
      if (value.data["Name"] != null) {
        return value.data["Name"];
      } else {
        return '';
      }
    });
    return await questionEntries.add({
      "name": namaUser,
      "pelajaran": pelajaran,
      "materi": materi,
      "jam": jam,
      "deskripsi": deskripsi
    });
  }

  List<Subjects> _subjectSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data.toString());
      return Subjects(
        nama: doc.data['name'] ?? ' ',
        jam: doc.data['jam'] ?? '',
        pelajaran: doc.data['pelajaran'] ?? ' ',
        materi: doc.data['materi'] ?? ' ',
        deskripsi: doc.data['deskripsi'] ?? ' ',
      );
    }).toList();
  }

  Stream<List<Subjects>> get questions {
    return questionEntries.snapshots().map(_subjectSnapshots);
  }

  Future uploadPhoto(String uid) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      List<String> splitPath = image.path.split('/');
      String filename = splitPath[splitPath.length - 1];
      StorageReference ref =
          FirebaseStorage.instance.ref().child('user').child(filename);
      StorageUploadTask uploadTask = ref.putFile(image);
      await uploadTask.onComplete;
      print('File Uploaded');
      ref.getDownloadURL().then(
          (value) => userProfile.document(uid).updateData({'imageUrl': value}));
      return ref.getDownloadURL();
    }
  }
}
