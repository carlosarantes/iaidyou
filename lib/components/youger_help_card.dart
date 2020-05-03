import 'package:flutter/material.dart';
import 'package:iaidyou/styles/font_sizes_younger.dart';
import 'package:url_launcher/url_launcher.dart';

class YoungerHelpCard extends StatelessWidget {

  final bool inProggress;
  YoungerHelpCard({ this.inProggress, @required this.status });

   String status;

    bool showMainButton(){
      switch (status) {
        case "PENDING":
          return true;
        break;
        case "IN_PROGRESS":
          return true;
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
          return false;
        break;
        case "IN_PROGRESS":
          return true;
        break;    
        case "FINISHED":
          return false;
        break;  
        default:
          return false;
        break;
      }
    }

    String statusLabel(){
      switch (status) {
        case "PENDING":
          return "Some elderly needs your help, save the day";
        break;
        case "IN_PROGRESS":
          return "Elderly is waiting you deliver";
        break;   
        case "FINISHED":
          return "The help has been finished, nice hero!!";
        break;  
        default:
          return "";
        break;
      }
    }

    String mainActionText(){
      switch (status) {
        case "PENDING":
          return "I want to help";
        break;
        case "IN_PROGRESS":
          return "Finish";
        break;  
        default:
          return "";
        break;
      }
    }



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

            Text('5 km away', 
                        style: TextStyle( fontWeight: FontWeight.bold, 
                                          color: Colors.grey[700])
                                          .merge( FontSizesYounger.text), ),

              SizedBox(height: 8,),                            
              Divider( height: 2, color: Colors.grey, ),
              SizedBox(height: 8,),     

              Text(statusLabel(), 
                style: TextStyle( fontWeight: FontWeight.bold, 
                                  color: Colors.grey[700])
                                  .merge( FontSizesYounger.text), ),




              SizedBox(height: 8,), 

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Visibility(
                    visible: showSecondaryButton(),
                    child: MaterialButton(
                              onPressed: () {
                                launch("tel:34992846594");
                              },
                              child: Text('Call', style: FontSizesYounger.text, ),
                              color: Colors.blue[500],
                          
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
                                
                              },
                              child: Text(mainActionText(), style: FontSizesYounger.text, ),
                              color: Colors.teal[500],
                          
                              padding: EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                              ),
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