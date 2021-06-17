import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/service/videoService.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Kadına Şiddete Hayır"),
        centerTitle: true,
      ),
      body:ListView(
            children:<Widget> [
              Container(
                height: 300,
                child: VideoService(
                  videoPlayerController: VideoPlayerController.asset('assets/kadina-siddete-hayir-diyelim.mp4'),
                  looping: true,
                  autoplay: false,
                ),
              ),
              Container(
                height: 300,
                child: VideoService(
                  videoPlayerController: VideoPlayerController.asset('assets/video3.mp4'),
                  looping: false,
                  autoplay: false,
                ),
              ),
              Container(
                height: 300,
                child: VideoService(
                    videoPlayerController: VideoPlayerController.asset('assets/video1.mp4'),
                    looping: false,
                    autoplay: false,
                  ),
              ),
              Container(
                height: 300,
                child: VideoService(
                  videoPlayerController: VideoPlayerController.asset('assets/video_2.mp4'),
                  looping: false,
                  autoplay: false,

                ),
              ),
            ],
          ),
        );

  }

}

