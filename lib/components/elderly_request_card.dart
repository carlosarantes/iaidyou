import 'package:flutter/material.dart';
import 'package:iaidyou/components/help_review_form.dart';
import 'package:iaidyou/screens/helper_profile.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';

class ElderlyRequestCard extends StatelessWidget {

  String status;

  ElderlyRequestCard({ @required this.status });
  
  bool showMainButton(){
    switch (status) {
      case "PENDING":
        return false;
      break;
      case "HELP_OFFERED":
        return true;
      break;
      case "IN_PROGRESS":
        return true;
      break;
      case "CANCELED":
        return false;
      break;      
      case "FINISHED":
        return false;
      break;  
      default:
        return false;
      break;
    }
  }

  bool showSecondaryButton() {
    switch (status) {
      case "PENDING":
        return true;
      break;
      case "HELP_OFFERED":
        return true;
      break;
      case "IN_PROGRESS":
        return false;
      break;
      case "CANCELED":
        return true;
      break;      
      case "FINISHED":
        return true;
      break;  
      default:
        return false;
      break;
    }
  }

  String statusLabel(){
    switch (status) {
      case "PENDING":
        return "Waiting for someone...";
      break;
      case "HELP_OFFERED":
        return "Someone is offering help";
      break;
      case "IN_PROGRESS":
        return "In Progress, please wait...";
      break;
      case "CANCELED":
        return "Help Request Canceled";
      break;      
      case "FINISHED":
        return "The help has been finished";
      break;  
      default:
        return "";
      break;
    }
  }


  String seccondaryActionText(){
    switch (status) {
      case "PENDING":
        return "I dont't need anymore";
      break;
      case "HELP_OFFERED":
        return "Deny";
      break;
      case "IN_PROGRESS":
        return "";
      break;
      case "CANCELED":
        return "Delete";
      break;      
      case "FINISHED":
        return "Delete";
      break;  
      default:
        return "";
      break;
    }
  }


  String mainActionText(){
    switch (status) {
      case "PENDING":
        return "Finish";
      break;
      case "HELP_OFFERED":
        return "Accept";
      break;
      case "IN_PROGRESS":
        return "Finish";
      break;
      case "CANCELED":
        return "";
      break;      
      case "FINISHED":
        return "Review";
      break;  
      default:
        return "";
      break;
    }
  }



  void _reviewHelp(BuildContext context){
    AlertDialog reviewDialog = AlertDialog(
      title: Text("Please rate and review the help"),
      content: HelpReviewForm(),
    );

    showDialog(context: context,
               builder: (context) {

                 return StatefulBuilder(
                   builder: (context, setState) {
                     return reviewDialog;
                   }
                 );
               },
               //=> reviewDialog,
               barrierDismissible: false,
              );
  }

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                    Text("I need help with 'Grocery Store'", 
                          style: TextStyle( fontWeight: FontWeight.bold).merge(FontSizesElderly.text) ,),
                    SizedBox(height: 4,),
                    Text("Created at 02/05/2020 11:12:33", style: 
                            TextStyle( color: Colors.grey[800], fontWeight: FontWeight.bold ),
                        ),

                    SizedBox(height: 8,),
                    Divider(height: 2, color: Colors.grey, ),
                    SizedBox(height: 8,),
                    Text("Helper:", style: 
                            TextStyle( color: Colors.grey[800], fontWeight: FontWeight.bold ),
                        ),

                    SizedBox(height: 8,),

                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(  MaterialPageRoute(builder: (context) => HelperProfile() ) );
                        },
                        child: 
                            Row(
                              children: <Widget>[

                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration:  BoxDecoration(
                                      shape: BoxShape.circle,
                                      image:  DecorationImage(
                                          fit: BoxFit.fill,
                                          image:  NetworkImage(
                                              "https://i.imgur.com/BoN9kdC.png")
                                      ),

                                      boxShadow: [
                                        BoxShadow( color: Colors.black54,  blurRadius: 4, spreadRadius: 1 )
                                      ]



                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Carl Johnson", style: TextStyle( fontWeight: FontWeight.bold ).merge(  FontSizesElderly.text ),   ),
                                            Text("Phone Number: +1 553 569 879", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.grey[800] ),),
                                          ],
                                        ),
                                ),
                              ],
                            ),
                  ),



                    SizedBox(height: 8,),
                    Divider(height: 2, color: Colors.grey, ),
                    SizedBox(height: 8,),


                    Text(statusLabel(), style: 
                            TextStyle( color: Colors.grey[800], 
                            fontWeight: FontWeight.bold, fontSize: 16 ),
                            textAlign: TextAlign.center,
                        ),


                    SizedBox(height: 16,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

              

                        Visibility(
                          visible: showSecondaryButton(),
                          child: MaterialButton(
                                    onPressed: () {
                                    
                                    },
                                    child: Text(seccondaryActionText(), style: FontSizesElderly.text, ),
                                    color: Colors.red[700],
                                
                                    padding: EdgeInsets.all(12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ), 
                        ), 

                        SizedBox(width: 10,),

                        Visibility(
                            visible: showMainButton(),
                            child: MaterialButton(
                                      onPressed: () {
                                        _reviewHelp(context);
                                      },
                                      child: Text(mainActionText(), style: FontSizesElderly.text, ),
                                      color: Colors.blue[500],
                                  
                                      padding: EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                      ),
                                    ),

                        ),
                        

                      ],
                    ),    

                ],
              ),

      ) 
      
      
      
    );
  }
}