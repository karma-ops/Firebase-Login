import 'package:cloud_firestore/cloud_firestore.dart';
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
    final userInfo = Provider.of<QuerySnapshot?>(context, listen: false);
    // print(userInfo.);
    return Container();
  }
}
