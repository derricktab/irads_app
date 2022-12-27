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
    );

    return Scaffold(
      body: Container(
        color: Colors.green,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
