import 'package:flutter/material.dart';
import 'package:iaidyou/components/help_review_form.dart';
import 'package:iaidyou/screens/helper_profile.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';

class ElderlyRequestCard extends StatelessWidget {

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
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              "https://i.imgur.com/BoN9kdC.png")
                                      )
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


                    Text("WAITING DELIVERY", style: 
                            TextStyle( color: Colors.grey[800], 
                            fontWeight: FontWeight.bold, fontSize: 16 ),
                            textAlign: TextAlign.center,
                        ),


                    SizedBox(height: 16,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

              
                        MaterialButton(
                          onPressed: () {
                          
                          },
                          child: Text('Cancel', style: FontSizesElderly.text, ),
                          color: Colors.red[700],
                      
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),

                        SizedBox(width: 10,),

                        MaterialButton(
                          onPressed: () {
                            _reviewHelp(context);
                          },
                          child: Text('Finish', style: FontSizesElderly.text, ),
                          color: Colors.blue[500],
                      
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
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