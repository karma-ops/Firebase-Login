import 'package:firebase_login/components/build_home.dart';
import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          TextButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Row(
              children: const [
                Text('Logout', style: TextStyle(color: Colors.white)),
                SizedBox(width: 10),
                Icon(Icons.logout_outlined, color: Colors.white),
              ],
            ),
          )
        ],
      ),
      body: const BuildHome(),
    );
  }
}
