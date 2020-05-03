import 'package:flutter/material.dart';
import 'package:iaidyou/components/elderly_request_card.dart';
import 'package:iaidyou/models/user.dart';
import 'package:iaidyou/screens/ask_help_form.dart';
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

  void _askForHelp(BuildContext context){

    AlertDialog requetHelpDialog = AlertDialog(
                                    title: Text("Ask For Help With..."),
                                    content: AskHelpForm(),
                                   ); 

    showDialog(context: context, 
               builder: (context) => requetHelpDialog,
               barrierDismissible: true,
             );

  }


  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      appBar: AppBar(title: Text("Main"),),
      body: Container(
            padding: EdgeInsets.all(16) ,
            width: screenWidth,
            child: Column(
               
              children: <Widget>[


                MaterialButton(
                  onPressed: () {
                    _askForHelp(context);
                    // Navigator.of(context).push(   MaterialPageRoute(builder: (context) => AskHelp() ) );
                  },
                  child: Text('Ask For Help', style: FontSizesElderly.labelButton, ),
                  color: Colors.teal[500],
                  minWidth: screenWidth-64,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                  ),
                ),


                SizedBox(height: 20,),

                Text("Request you've done", style: TextStyle( fontWeight: FontWeight.bold )
                                  .merge( FontSizesElderly.title),   
                                  textAlign: TextAlign.start,   ),

                SizedBox(height: 20,),

                Expanded(
                  flex: 1,
                  child: ListView(
                    children: <Widget>[

                      ElderlyRequestCard(),
                      ElderlyRequestCard(),
                      ElderlyRequestCard(),
                      ElderlyRequestCard(),
                      ElderlyRequestCard(),
                    ],
                  ),
                  
                  
                  
                 /*  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("You haven't asked for help yet...", 
                          style: TextStyle( 
                            color: Colors.grey[500] ).merge(FontSizesElderly.placeholder),
                          textAlign: TextAlign.center,
                      
                      )
                    ],
                  ),  */
                  
                  
                  
                  
                  ),




              ],
            ),

      ),
    );
  }
}