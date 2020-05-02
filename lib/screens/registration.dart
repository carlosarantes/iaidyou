import 'package:flutter/material.dart';
import 'package:iaidyou/model/user.dart';
import 'package:iaidyou/screens/main_elderly.dart';
import 'package:iaidyou/screens/main_younger.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';
import 'package:iaidyou/styles/font_sizes_younger.dart';

class Registration extends StatelessWidget {

  final User user;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Registration({ @required this.user });

  void _completeRegistration(BuildContext context){

    user.name    = _nameController.text;
    user.address = _addressController.text;

    if(user.userType == 'ELDER') {
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => MainElderly(user: user)  ) );
      // Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => MainElderly(user: user)  ) );
    } else {
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => MainYounger(user: user)  ) );
      // Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => MainYounger(user: user)  ) );
    }
  }


  TextStyle _titleStyle(){
    if(user.userType == 'ELDER'){
      return FontSizesElderly.title;
    } else {
      return FontSizesYounger.title;
    }
  }


  TextStyle _textInputSyle(){
    if(user.userType == 'ELDER'){
      return FontSizesElderly.textInput;
    } else {
      return FontSizesYounger.textInput;
    }
  }


  TextStyle _labelButtonStyle(){
    if(user.userType == 'ELDER'){
      return FontSizesElderly.labelButton;
    } else {
      return FontSizesYounger.labelButton;
    }
  }


  @override
  Widget build(BuildContext context) {


    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar( title: Text("Registration"),),
        body: Container(
           padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[



              Text("Please complete your registration", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ).merge(_titleStyle()), 
                    textAlign: TextAlign.center, ),

              TextField( 
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Name', labelText: 'Name',),
                maxLength: 50,
                style: _textInputSyle(),
              ),

              TextField( 
                controller: _addressController,
                decoration: InputDecoration(hintText: 'Address', labelText: 'Address',),
                 style: _textInputSyle(),
              ),

              FlatButton(
                onPressed: (){

                },
                child: Text("Find My Location", style: _labelButtonStyle(), ),
              ),




              SizedBox(height: 16,),



              MaterialButton(
                onPressed: () {
                  _completeRegistration(context);
                },
                child: Text('Complete', style: _labelButtonStyle(), ),
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