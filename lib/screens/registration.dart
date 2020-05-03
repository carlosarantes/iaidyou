import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iaidyou/http/webclients/user_webclient.dart';
import 'package:iaidyou/models/address.dart';
import 'package:iaidyou/models/user.dart';
import 'package:iaidyou/screens/main_elderly.dart';
import 'package:iaidyou/screens/main_younger.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';
import 'package:iaidyou/styles/font_sizes_younger.dart';
import 'package:geolocation/geolocation.dart';



class Registration extends StatefulWidget {

  final User user;

  Registration({ @required this.user });

  @override
  _RegistrationState createState() => _RegistrationState();
}



class _RegistrationState extends State<Registration> {

  User user;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  UserWebClient userWebClient = UserWebClient();

  
  @override
  void initState()  {
    super.initState();
    user = widget.user;
    getMyLocation();
  }

  Future<GeolocationResult> getPermission() async {
    final GeolocationResult result = await Geolocation.requestLocationPermission
    (
      permission: LocationPermission(
        android: LocationPermissionAndroid.fine,
        ios: LocationPermissionIOS.always
      ),
    );

    return result;
  }

  getMyLocation() async {

    return getPermission().then((result) async {
         
      StreamSubscription<LocationResult> subscription = Geolocation.currentLocation(accuracy: LocationAccuracy.best).listen((result) async {
        if(result.isSuccessful) {
          double latitude = result.location.latitude;
          double longitude = result.location.longitude;


          Address address = await userWebClient.getAddress(latitude, longitude);

          setState(() {
            user.address = address;
          });

          _addressController.text = user.address.address;
          _address2Controller.text = user.address.address2;
          _cityController.text = user.address.city;
        
        }
      });



    });
  }

  void _completeRegistration(BuildContext context){

    user.name    = _nameController.text;
    // user.address = _addressController.text;

    if(user.type == 'ELDER') {
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => MainElderly(user: user)  ) );
      // Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => MainElderly(user: user)  ) );
    } else {
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => MainYounger(user: user)  ) );
      // Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => MainYounger(user: user)  ) );
    }
  }


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


    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar( title: Text("Registration"),),
        body: SingleChildScrollView(
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
                decoration: InputDecoration(hintText: 'Address', labelText: 'Address',  ),
                 style: _textInputSyle(),
              ),

              TextField( 
                controller: _address2Controller,
                decoration: InputDecoration(hintText: 'Address 2', labelText: 'Address 2',),
                 style: _textInputSyle(),
              ),

              TextField( 
                
                controller: _cityController,
                decoration: InputDecoration(hintText: 'City', labelText: 'City',),
                 style: _textInputSyle(),
              ),








              FlatButton(
                onPressed: () async {
                  await getMyLocation();
                },
                child: Text("Update My Location", style: _labelButtonStyle(), ),
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