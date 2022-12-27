import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

class LiveMonitoring extends StatefulWidget {
  const LiveMonitoring({super.key});

  @override
  State<LiveMonitoring> createState() => _LiveMonitoringState();
}

class _LiveMonitoringState extends State<LiveMonitoring> {
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
          itemCount: 15,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: ((context, index) {
            return Container(
              height: 100,
              color: Colors.orange,
            );
          }),
        ),
      ),
    );
  }
}
