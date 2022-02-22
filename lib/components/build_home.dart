import 'package:firebase_login/models/user.dart';
import 'package:firebase_login/models/user_info.dart';
import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuildHome extends StatefulWidget {
  const BuildHome({Key? key}) : super(key: key);

  @override
  _BuildHomeState createState() => _BuildHomeState();
}

class _BuildHomeState extends State<BuildHome> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<List<UserInfo>?>(context, listen: false);
    print(userInfo);

    return Column(
      children: [
        Container(
          height: 200,
          color: const Color(0XFF233b5e),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: TextButton(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  child: Row(
                    children: [
                      Text('Logout',
                          style: GoogleFonts.caveat(
                              color: Colors.white, fontSize: 25)),
                      const SizedBox(width: 10),
                      const Icon(Icons.logout_outlined,
                          color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
              const Center(
                  child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(Linecons.user, color: Color(0XFF233b5e), size: 50),
              ))
            ],
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            ListTile(
              title: Text('Name', style: GoogleFonts.kalam(fontSize: 24)),
              subtitle: Text(userInfo!.first.name!,
                  style: GoogleFonts.kalam(fontSize: 16)),
            ),
            const Divider(
              color: Colors.black26,
              height: 10,
            ),
            ListTile(
              title: Text('Username', style: GoogleFonts.kalam(fontSize: 24)),
              subtitle: Text(userInfo.first.username!,
                  style: GoogleFonts.kalam(fontSize: 16)),
            ),
            const Divider(
              color: Colors.black26,
              height: 10,
            ),
            ListTile(
              title: Text('Email', style: GoogleFonts.kalam(fontSize: 24)),
              subtitle: Text(userInfo.first.email!,
                  style: GoogleFonts.kalam(fontSize: 16)),
            ),
          ],
        )
      ],
    );
  }
}
