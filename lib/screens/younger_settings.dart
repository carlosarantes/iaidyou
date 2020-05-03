import 'package:flutter/material.dart';
import 'package:iaidyou/styles/font_sizes_younger.dart';

class YoungerSettings extends StatefulWidget {
  @override
  _YoungerSettingsState createState() => _YoungerSettingsState();
}

class _YoungerSettingsState extends State<YoungerSettings> {
  
  double _maxKm = 1;

  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: 
                      Text("Settings"),
                    ),
      body: Container(
        padding: EdgeInsets.all(16) ,
        width: screenWidth,
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                
              SizedBox(height: 8,),
              Text("Settings", style: TextStyle( fontWeight: FontWeight.bold ).merge(FontSizesYounger.title), ),
              

              SizedBox(height: 32,),
              Text("Change profile photo", style: TextStyle( 
                                      fontWeight: FontWeight.bold, )
                                    .merge(FontSizesYounger.text) ,), 


              SizedBox(height: 8,),
              Container(
                width: 110.0,
                height: 110.0,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    image:  DecorationImage(
                        fit: BoxFit.fill,
                        image:  NetworkImage(
                            "https://i.imgur.com/BoN9kdC.png")
                    ),

                    boxShadow: [
                       BoxShadow( color: Colors.black54,  blurRadius: 6, spreadRadius: 1 )
                    ]
                ),
              ),






              SizedBox(height: 32,),
              Text("Upload presentation video", style: TextStyle( 
                                      fontWeight: FontWeight.bold, )
                                    .merge(FontSizesYounger.text) ,),

              Text("Upload a video talking about yourself so elderly can truet you.", 
                  style: FontSizesYounger.text , textAlign:  TextAlign.center,),

              SizedBox(height: 8,),
              MaterialButton(
                onPressed: () {
                
                },
                child: Text('Upload Presentation Video', style: FontSizesYounger.text, ),
                color: Colors.teal[500],
            
                padding: EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                ),
              ),                     



              SizedBox(height: 32,),
              Text("Change distance range", style: TextStyle( 
                                      fontWeight: FontWeight.bold, )
                                    .merge(FontSizesYounger.text) ,), 

              Slider(value: _maxKm, 
                    min: 1,
                    max: 90,
                    onChanged: (val){
                        setState(() {
                          _maxKm = val;
                        });
                    }),
              Text("${_maxKm.toInt() } Km", style: TextStyle( 
                                                    fontWeight: FontWeight.bold, )
                                                  .merge(FontSizesYounger.text) ,),


                SizedBox(height: 56,),
                MaterialButton(
                  onPressed: () {
                  
                  },
                  child: Text('Save Changes', style: FontSizesYounger.text, ),
                  color: Colors.blue[500],
                  minWidth: screenWidth,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                  ),
                ),                     



              ],
            ),
        ),
      ),              
    );
  }

}