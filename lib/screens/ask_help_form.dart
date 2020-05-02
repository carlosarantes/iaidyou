import 'package:flutter/material.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';

class AskHelpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AskHelpFormState();
  }
}

class _AskHelpFormState extends State<AskHelpForm> {

  int helpCategory;

  @override
  void initState() {
    super.initState();
    helpCategory = 1;
  }

  void _setHelpCategory(int val) {
    setState(() {
      helpCategory = val;
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height*0.55,
      child: Column(
        children: <Widget>[

          RadioListTile(value: 1, 
                        groupValue: helpCategory, 
                        onChanged: (val){
                          _setHelpCategory(val);
                        },
                        title: Text("Grocery Store", style: FontSizesElderly.text, ),
                        // activeColor
                      ),

          RadioListTile(value: 2, 
                        groupValue: helpCategory, 
                        onChanged: (val){
                          _setHelpCategory(val);
                        },
                        title: Text("Drug Store", style: FontSizesElderly.text, ),
                        // activeColor
                      ),

          RadioListTile(value: 3, 
                        groupValue: helpCategory, 
                        onChanged: (val){
                          _setHelpCategory(val);
                        },
                        title: Text("Gas Station", style: FontSizesElderly.text, ),
                        // activeColor
                      ),

          RadioListTile(value: 4, 
                        groupValue: helpCategory, 
                        onChanged: (val){
                          _setHelpCategory(val);
                        },
                        title: Text("Butchery", style: FontSizesElderly.text, ),
                        // activeColor
                      ),

          RadioListTile(value: 5, 
                        groupValue: helpCategory, 
                        onChanged: (val){
                          _setHelpCategory(val);
                        },
                        title: Text("Other", style: FontSizesElderly.text, ),
                        // activeColor
                      ),

          SizedBox(height: 32,),

          MaterialButton(
              onPressed: () {
        
               
              },
              child: Text('Confirm', style: FontSizesElderly.labelButton, ),
              minWidth: 200,
              color: Colors.green,
             
              padding: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
              ),
            ),









        ],
      ),
    );
    
    
    
    


  }
}