import 'package:flutter/material.dart';
import 'package:iaidyou/model/user.dart';
import 'package:iaidyou/screens/ask_help.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';

class MainElderly extends StatefulWidget{

  final User user;
  MainElderly({ @required this.user });

  @override
  State<StatefulWidget> createState() {
    return _MainElderly();
  }
}

class _MainElderly extends State<MainElderly> {



  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      appBar: AppBar(title: Text("Main"),),
      body: Container(
            padding: EdgeInsets.all(16) ,
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[


                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(   MaterialPageRoute(builder: (context) => AskHelp() ) );
                  },
                  child: Text('Ask For Help', style: FontSizesElderly.labelButton, ),
                  color: Colors.blue[700],
                  minWidth: screenWidth-64,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                

              ],
            ),

      ),
    );
  }
}