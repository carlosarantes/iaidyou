import 'package:flutter/material.dart';
import 'package:iaidyou/model/user.dart';

class MainYounger extends StatefulWidget{

  final User user;
  MainYounger({ @required this.user });

  @override
  State<StatefulWidget> createState() {
    return _MainYoungerState();
  }
}

class _MainYoungerState extends State<MainYounger> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Save the day"),),
      body: Container(

      ),
    );
  }
}