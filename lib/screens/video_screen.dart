import 'package:flutter/material.dart';
import 'package:kadina_siddete_hayir/service/videoService.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: Text("Kadına Şiddete Hayır"),


        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          children:<Widget> [
            Container(
              height: 250.0,
              width: 200.0,
              child: VideoService(
                  videoPlayerController: VideoPlayerController.asset('assets/video1.mp4'),
                  looping: true,
                  autoplay: true,
                ),
            ),
            VideoService(
              videoPlayerController: VideoPlayerController.asset('assets/video_2.mp4'),
              looping: false,
              autoplay: false,
            ),

          ],
        ),
      ),

    );

  }

}

