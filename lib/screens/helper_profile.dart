import 'package:flutter/material.dart';
import 'package:iaidyou/components/comment.dart';
import 'package:iaidyou/components/video_player_item.dart';
import 'package:iaidyou/styles/font_sizes_elderly.dart';
import 'package:video_player/video_player.dart';

class HelperProfile extends StatelessWidget {


  void _playPresentationVideo(BuildContext context){

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
  }

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
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://i.imgur.com/BoN9kdC.png")
                              )
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

                       /* MaterialButton(
                          onPressed: () {
                            _playPresentationVideo(context);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon( Icons.play_arrow ),
                              Text('Play Presentation Video', style: FontSizesElderly.text, ),
                            ],
                          ),
                          
                          color: Colors.blue[700],
                      
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                          ),
                        ), */

                        Text("Presentation Video", style: 
                            TextStyle( fontWeight: FontWeight.bold, color: Colors.grey[600] ),
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
    );
  }
}