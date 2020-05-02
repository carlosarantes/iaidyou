import 'package:flutter/material.dart';
import 'package:iaidyou/screens/login.dart';

void main() => runApp(IAidYou());

class IAidYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "iAidYou",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionColor: Colors.blue[300],
        cursorColor: Colors.blue[500],
        canvasColor: Colors.grey[50],
        primaryColorLight: Colors.blue[100],
        primaryColor: Colors.blue[500],
        primaryColorDark: Colors.blue[700],
        accentColor: Colors.blueAccent[200], 
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[200],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Login(),
    );
  }
}