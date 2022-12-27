import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

class FullLiveMonitoring extends StatefulWidget {
  const FullLiveMonitoring({super.key});

  @override
  State<FullLiveMonitoring> createState() => _FullLiveMonitoringState();
}

class _FullLiveMonitoringState extends State<FullLiveMonitoring> {
  var videoController =
      CachedVideoPlayerController.asset("assets/videos/vid1.mp4");

  @override
  void initState() {
    // TODO: implement initState
    videoController.initialize().then((value) {
      videoController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: Stack(
          children: [
            videoController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: CachedVideoPlayer(videoController),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Colors.orange,
                  )),
          ],
        ),
      ),
    );
  }
}
