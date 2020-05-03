import 'package:flutter/material.dart';
import 'package:iaidyou/components/comment.dart';
import 'package:iaidyou/components/video_player_item.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperProfile extends StatelessWidget {


  /*void _playPresentationVideo(BuildContext context){

    AlertDialog videoDialog = AlertDialog(
              title: Text("Vídeo"),
              contentPadding: EdgeInsets.all(0),
              content: VideoPlayerItem(
                videoPlayer: VideoPlayerController.asset('assets/videos/butterfly.mp4'),
                looping: true,
              ),
            );

    showDialog(context: context, 
               builder: (context) => videoDialog,
               barrierDismissible: true,
             );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
            appBar: AppBar(title: Text("Carl Johnson"),),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(

                  children: <Widget>[
                        
                        SizedBox(height: 16,),

                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://i.imgur.com/BoN9kdC.png")
                              ),
                              boxShadow: [
                                BoxShadow( color: Colors.black54,  blurRadius: 6, spreadRadius: 1 )
                              ]
                          ),
                        ),

                        SizedBox(height: 16,),

                        Text("Carl Johnson", style: 
                            TextStyle( fontWeight: FontWeight.bold ).merge(  FontSizesElderly.title  ),
                        ),

                        Text("Phone Number: +1 232 566 987", style: 
                            TextStyle( fontWeight: FontWeight.bold, color: Colors.grey[700] ).merge(  FontSizesElderly.text  ),
                        ),

                        SizedBox(height: 8,),

                        Text("98% Approvals", style: 
                            TextStyle( fontWeight: FontWeight.bold, color: Colors.grey[600] ),
                        ),

                        SizedBox(height: 16,),

                        Divider(height: 4,  color: Colors.grey, ),
                        SizedBox(height: 16,),

                        Text("Presentation Video", style: 
                            TextStyle( fontWeight: FontWeight.bold, color: Colors.grey[600], fontSize: 16 ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: VideoPlayerItem(
                                  videoPlayer: VideoPlayerController.asset('assets/videos/butterfly.mp4'),
                                  looping: true,
                                ),
                        ),

                        

                        SizedBox(height: 16,),

                        Comment(),
                        Comment(),
                        Comment(),
                        Comment(),

                  ],

              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed: (){
              launch("tel:34992846594");
            }, 
            child: Icon( Icons.phone, size: 32, ),),
    );
  }
}