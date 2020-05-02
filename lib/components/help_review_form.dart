import 'package:flutter/material.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';

class HelpReviewForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HelpReviewFormState();
  }
}

class _HelpReviewFormState extends State<HelpReviewForm> {

  int approval;

  @override
  void initState() {
    super.initState();
    approval = 1;
  }

  void _setApproval(int approval){
    setState(() {
      approval = approval;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final height = MediaQuery.of(context).size.height;  
    return Container(
      height: height * 0.4,
      child: Column(
        children: <Widget>[

            RadioListTile(
              value: 1, 
              groupValue: approval, 
              onChanged: (val){
                _setApproval(val);
              },
              // activeColor,
              title: Text("I liked the help")
            ),

            RadioListTile(
              value: 2, 
              groupValue: approval, 
              onChanged: (val){
                _setApproval(val);
              },
              // activeColor,
              title: Text("I didn't like the help")
            ),


            TextField( 
              decoration: InputDecoration(hintText: 'Leave Your Comment', labelText: 'Leave Your Comment', ),
              minLines: 1,
              maxLines: 6,
              style: FontSizesElderly.textInput,
            ),

            SizedBox(height: 24,),

            MaterialButton(
                onPressed: () {
                   Navigator.of(context).pop();
                },
                child: Text('Review', style: FontSizesElderly.text, ),
                minWidth: 170,
                color: Colors.blue[700],
          
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