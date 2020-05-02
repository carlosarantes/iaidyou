import 'package:flutter/material.dart';
import 'package:iaidyou/styles/font_sizes_younger.dart';

class YoungerHelpCard extends StatelessWidget {

  final bool inProggress;
  YoungerHelpCard({ this.inProggress });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Card(
      child: Container(
         width: width,
         padding: EdgeInsets.all(16),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text("Mrs. Madeline Austin", 
                  style: TextStyle( fontWeight: FontWeight.bold, )
                                  .merge( FontSizesYounger.text), ),

             Text('I need help with "Grocery Store"', 
                        style: TextStyle( fontWeight: FontWeight.bold, 
                                          color: Colors.grey[700])
                                          .merge( FontSizesYounger.text), ),

              SizedBox(height: 8,),                            
              Divider( height: 2, color: Colors.grey, ),
              SizedBox(height: 8,),     

              Text(  inProggress ? "ELDERLY WAITING DELIVERY" : "ELDERLY WAITING FOR HELP", 
                style: TextStyle( fontWeight: FontWeight.bold, 
                                  color: Colors.grey[700])
                                  .merge( FontSizesYounger.text), ),




              SizedBox(height: 8,), 

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                       
                    },
                    child: Text('Confirm', style: FontSizesYounger.text, ),
                    color: Colors.green[700],
                
                    padding: EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),



                  SizedBox(width: 10,),

                  MaterialButton(
                    onPressed: () {
                    
                    },
                    child: Text('Call', style: FontSizesYounger.text, ),
                    color: Colors.blue[700],
                
                    padding: EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),


                ],
              ),               




           ],
         )
      ),
    );
  }
  
}