import 'package:firebase_login/models/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildHome extends StatefulWidget {
  const BuildHome({Key? key}) : super(key: key);

  @override
  _BuildHomeState createState() => _BuildHomeState();
}

class _BuildHomeState extends State<BuildHome> {
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<List<UserInfo>>(context, listen: false);
    // print(userInfo!.docs);

    // for (var data in userInfo) {
    //   print(data.name);
    //   print(data.age);
    //   print(data.address);
    // }
    return Text('$userInfo');
  }
}
