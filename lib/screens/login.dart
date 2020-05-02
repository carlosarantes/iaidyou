import 'package:flutter/material.dart';
import 'package:iaidyou/model/user.dart';
import 'package:iaidyou/screens/phone_verification.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';

class Login extends StatelessWidget {

  final User user = User();

  void goToPhoneVerification(BuildContext context, String userType){
    user.userType = userType;
  

    Navigator.of(context).push(  MaterialPageRoute(builder: (context) => PhoneVerification(user: user,) ) );
  }

  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(

     body: 
      Container(
        width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/elder.png'),
                  fit: BoxFit.cover 
                ),
              ),


              child: Container(
                width: screenWidth,
                color: Colors.blue[700].withOpacity(0.7),
                child: 
                
                
                  SafeArea(
                    child: 
                  
                
                    Column(
                      children: <Widget>[
                        Container(
                          width: screenWidth * 0.65,
                          margin: EdgeInsets.only(top: 32),
                          child: Text('Stay home and take care of yourself and the people you love.',
                              textAlign: TextAlign.center,
                              style: TextStyle( 
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ).merge(FontSizesElderly.text),

                          ),
                        ),

                         
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Text('iAY', style: TextStyle( color: Colors.white, fontSize: 92 ),
                                textAlign: TextAlign.center,),
                              ],
                          ),
                        ),
                        





                        Text('How do you intend to use this app?',
                              textAlign: TextAlign.center,
                              style: TextStyle( 
                                color: Colors.white,
                              ).merge( FontSizesElderly.text ),
                          ),
                        SizedBox(height: 20,),

                        MaterialButton(
                          onPressed: () {
                            goToPhoneVerification(context, 'ELDER');
                            // Navigator.of(context).push(  MaterialPageRoute(builder: (context) => Registration() )  );
                          },
                          child: Text('I need help',
                                        style: FontSizesElderly.labelButton, ),
                          color: Colors.red,
                          minWidth: screenWidth-64,
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        
                        SizedBox(height: 16,),

                        MaterialButton(
                          onPressed: () {
                            goToPhoneVerification(context, 'YOUNGER');
                            // Navigator.of(context).push(  MaterialPageRoute(builder: (context) => Registration() )  );
                          },
                          child: Text('I want to help',
                                        style: FontSizesElderly.labelButton,),
                          color: Colors.green,
                          minWidth: screenWidth-64,
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),

                        SizedBox(height: 48,),


                      ],
                    ),


  ),













              ),
        
      ), 
      );
  }
}