import 'package:flutter/material.dart';
import 'package:irads_app/full_live_monitoring.dart';

class LiveMonitoring extends StatefulWidget {
  const LiveMonitoring({super.key});

  @override
  State<LiveMonitoring> createState() => _LiveMonitoringState();
}

class _LiveMonitoringState extends State<LiveMonitoring> {
  List videos = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGO
                Image.asset("assets/images/logo.png", height: 80),
                const SizedBox(width: 50),
                // Available Cameras
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "AVAILABLE CCTV CAMERAS",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PT_Serif"),
                  ),
                ),
              ],
            ),

            // GRID OF CAMERAS AVAILABLE
            Expanded(
              child: GridView.builder(
                itemCount: videos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: (() {
                      // GOING TO FULL VIEW OF THE SELECTED CAMERA
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return FullLiveMonitoring(
                              index: index + 1,
                              video: videos[index],
                            );
                          }),
                        ),
                      );
                    }),
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        // SHOWIGN THE CAMERA FEED
                        Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                              // color: Colors.orange,
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/cars.jpg",
                              fit: BoxFit.cover,
                            ),
                          ), // Displaying the video
                        ),

                        // TEXT TO SHOW THE CAMERA NUMBER
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            child: Text(
                              "CAMERA ${index + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
