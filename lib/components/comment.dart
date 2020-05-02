import 'package:flutter/material.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text("Mrs. Madeline Austin", textAlign: TextAlign.start, 
                                      style: TextStyle(fontWeight:  FontWeight.bold ).merge(FontSizesElderly.text),
                                      
                                 ),
                                Text('"This person helped me with Grocery Store"', 
                                textAlign: TextAlign.start, 
                                style:  TextStyle(fontWeight:  FontWeight.bold, color: Colors.grey[800], fontSize: 16 ), ),

                                Text('"Very trustful person and very lovely, he helped me a lot these last days I hope you guys like him."', 
                                      textAlign: TextAlign.start,
                                       style: TextStyle( fontStyle: FontStyle.italic, color: Colors.grey[700]  ).merge(FontSizesElderly.text),
                                      
                                      ),

                                Align(
                                   alignment: Alignment.bottomRight,
                                  child: Icon( Icons.thumb_up, color: Colors.grey[700], )  )

                              ],
                            ),
                          ),
                        );
  }
}