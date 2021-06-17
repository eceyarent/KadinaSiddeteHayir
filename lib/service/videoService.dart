
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoService extends StatefulWidget{
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  VideoService({
    @required this.videoPlayerController,
    this.looping,
    this.autoplay,
    Key key,
  }) : super(key: key);
  @override
  _VideoServiceState  createState() => _VideoServiceState();

}

class _VideoServiceState extends State<VideoService>{
  ChewieController _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16/9,
      autoInitialize: true,
      autoPlay: widget.autoplay,
      looping: widget.looping,
      errorBuilder: (context,errorMessage){
        return Center(
          child: Text(errorMessage,style: TextStyle(color: Colors.red) ,),
        );
      }
    );

  }



  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Chewie(
      controller: _chewieController,),
  );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }

}
