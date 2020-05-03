import 'package:flutter/material.dart';
import 'package:iaidyou/components/youger_help_card.dart';
import 'package:iaidyou/model/user.dart';
import 'package:iaidyou/screens/younger_settings.dart';
import 'package:iaidyou/styles/font_sizes_younger.dart';

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

    final double screenWidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      appBar: AppBar(title: 
                      Text("Save the day"),
                      actions: <Widget>[
                        IconButton(
                          icon: Icon( Icons.settings ),
                          onPressed: (){
                            Navigator.of(context).push( MaterialPageRoute(builder: (context) => YoungerSettings(), ), );
                          },
                        )
                      ],  
                    ),
      body: Container(
            padding: EdgeInsets.all(16) ,
            width: screenWidth,
            child: SingleChildScrollView(
              child: Column(
                      children: <Widget>[
                           SizedBox(height: 8,),
                          Text("Helps in progress", style: TextStyle( fontWeight: FontWeight.bold ).merge(FontSizesYounger.title), ),
                           SizedBox(height: 8,),
                          YoungerHelpCard(inProggress: true,),
                          YoungerHelpCard(inProggress: true,),
                          SizedBox(height: 56,),

                          Text("Elderly who need help", style: TextStyle( fontWeight: FontWeight.bold ).merge(FontSizesYounger.title), ),
                          SizedBox(height: 8,),
                          YoungerHelpCard(inProggress: false,),
                          YoungerHelpCard(inProggress: false,),
                          YoungerHelpCard(inProggress: false,),
                          YoungerHelpCard(inProggress: false,),
                          YoungerHelpCard(inProggress: false,),
                          YoungerHelpCard(inProggress: false,),

                      ],
                    ),
            ),

      ),
    );
  }
}