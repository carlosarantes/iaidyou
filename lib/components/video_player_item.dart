import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {

  final VideoPlayerController videoPlayer;
  final bool looping;

  VideoPlayerItem({
    @required this.videoPlayer,
    this.looping,
    Key key
  }) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerItem> {
  
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayer,
      aspectRatio: 16/9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage){
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle( color: Colors.white ),
          ),
        );
      }

    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Chewie(
          controller: _chewieController,
        ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayer.dispose();
    _chewieController.dispose();
  }
}