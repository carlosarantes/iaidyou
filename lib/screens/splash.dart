import 'package:flutter/material.dart';
import 'package:iaidyou/screens/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin { // SingleTickerProviderStateMixin

AnimationController animController;
Animation<double> animation;  

Future<bool> _checkSession() async {

  await Future.delayed( Duration(milliseconds: 3500), (){});

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  
  return false;
}

void _navigateToLogin(BuildContext context){
  Navigator.pushReplacement(context,  MaterialPageRoute( builder: (context) => Login() ), );
}

void _navigateToHome(BuildContext context){
  Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => Login() ), );
}

@override
  void initState() {
    super.initState();

    animController = AnimationController(
      duration: Duration(milliseconds: 1100), vsync: this);

    final curvedAnimation = CurvedAnimation(parent: animController, 
                                             curve: Curves.linear, 
                                            );

    animation = Tween<double>(begin: 0, end: 1)
      .animate(curvedAnimation)
      ..addStatusListener((status) {
            if(status == AnimationStatus.completed){
              animController.forward( from: 0.0);
            }
      });
    animController.forward();

   _checkSession().then((status){
      if (status) {
        _navigateToHome(context);
      } else {
        _navigateToLogin(context);
      }      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                 Container(
                    decoration: BoxDecoration(
                       gradient: LinearGradient(
                         colors: [ 
                          Colors.blue[400].withOpacity(0.7),
                          Colors.blue[500].withOpacity(0.88),
                          Colors.blue[700].withOpacity(0.88),
                          Colors.blue[600].withOpacity(0.88),
                          Colors.blue[400]
                        ])
                    ),
                 ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     Expanded(
                       child: Container(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[

                             Text("iAidYou", style:TextStyle( 
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 56 ),),
                             
                             SizedBox(height: 8,),

                             RotationTransition(turns: animation, 
                                                child: Icon( Icons.refresh, 
                                                          color: Colors.white,
                                                          size: 28, ), 
                                               )
                           ],
                         ),
                       ),
                     ),
                 ],)
              ],
            ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
