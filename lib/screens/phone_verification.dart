import 'package:flutter/material.dart';
import 'package:iaidyou/models/user.dart';
import 'package:iaidyou/screens/registration.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';
import 'package:iaidyou/styles/font_sizes_younger.dart';

class PhoneVerification extends StatelessWidget {

  final User user;
  final TextEditingController _phoneController = TextEditingController();
  final TextStyle textStyle;

  PhoneVerification({ @required this.user, this.textStyle });

  TextStyle _titleStyle(){
    if(user.type == 'ELDER'){
      return FontSizesElderly.title;
    } else {
      return FontSizesYounger.title;
    }
  }

  TextStyle _textInputSyle(){
    if(user.type == 'ELDER'){
      return FontSizesElderly.textInput;
    } else {
      return FontSizesYounger.textInput;
    }
  }

  TextStyle _labelButtonStyle(){
    if(user.type == 'ELDER'){
      return FontSizesElderly.labelButton;
    } else {
      return FontSizesYounger.labelButton;
    }
  }



  @override
  Widget build(BuildContext context) {


    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Phone Verification"), ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:  MainAxisAlignment.center,
          children: <Widget>[


            Text("Type your phone number", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ).merge(_titleStyle()), 
                    textAlign: TextAlign.center, ),

            
            SizedBox(height: 16,),
            
            TextField( 
              keyboardType: TextInputType.phone,
              controller: _phoneController,
              decoration: InputDecoration(hintText: 'Phone Number', labelText: 'Phone Number', ),
              style: _textInputSyle(),
            ),
            
            SizedBox(height: 32,),
            
            MaterialButton(
              onPressed: () {
                user.phoneNumber = _phoneController.text;
                Navigator.of(context).push(  MaterialPageRoute(builder: (context) => Registration(user: user,) )  );
              },
              child: Text('Proceed', style: _labelButtonStyle()  ,),
              color: Colors.green,
              minWidth: screenWidth,
              padding: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
              ),
            ),

            SizedBox(height: 48,),

          ],
        ),
      ),
    );
  }
}