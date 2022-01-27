import 'package:firebase_login/models/user.dart';
import 'package:firebase_login/screens/authenticate.dart';
import 'package:firebase_login/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<CustomUser?>();
    //return home or authenticate
    if (user?.uid == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
