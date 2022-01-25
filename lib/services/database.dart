import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection reference

  final CollectionReference userInfo =
      FirebaseFirestore.instance.collection('info');

  Future updateUserData(String name, int age, String address) async {
    return await userInfo
        .doc(uid)
        .set({
          'name': name,
          'age': age,
          'address': address,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Stream<QuerySnapshot> get info {
    return userInfo.snapshots();
  }
}
