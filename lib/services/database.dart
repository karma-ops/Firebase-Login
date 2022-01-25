import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/models/user_info.dart';

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
        // ignore: avoid_print
        .then((value) => print("User Updated"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to update user: $error"));
  }

  List<UserInfo> _userInfoFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((data) {
      return UserInfo(
        name: data['name'] ?? '',
        age: data['age'] ?? 18,
        address: data['address'] ?? '',
      );
    }).toList();
  }

  Stream<List<UserInfo>> get info {
    return userInfo.snapshots().map((_userInfoFromSnapshot));
  }
}
