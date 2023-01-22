import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PreviewMode extends StatefulWidget {
  const PreviewMode({super.key});

  @override
  State<PreviewMode> createState() => _PreviewModeState();
}

class _PreviewModeState extends State<PreviewMode> {
  final videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

  initializeVideoController() async {
    await videoPlayerController.initialize();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeVideoController();
  }

  @override
  Widget build(BuildContext context) {
    ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: true,
      aspectRatio: MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height,
    );

    return Scaffold(
      // backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            color: Colors.black87,
            child: Chewie(
              controller: chewieController,
            ),
          ),

          Positioned(
            top: 30,
            left: 0,
            child: Container(
              margin: const EdgeInsets.only(top: 30, right: 30),
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(164, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.play_circle_fill,
                    color: Colors.green[600],
                  ),
                  const Text(
                    "Preview Mode",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
