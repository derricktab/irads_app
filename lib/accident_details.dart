import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:intl/intl.dart';

class AccidentDetails extends StatefulWidget {
  final String video;
  final String image;
  final DateTime accidentDate;
  final String location;
  const AccidentDetails(
      {super.key,
      required this.video,
      required this.accidentDate,
      required this.image,
      required this.location});

  @override
  State<AccidentDetails> createState() => _AccidentDetailsState();
}

class _AccidentDetailsState extends State<AccidentDetails> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset(
      "assets/videos/10.mp4",
    );
    _controller.setVolume(0);

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  // FORMAT THE ACCIDENT TIME IN APPROPRIATE FORMAT
  getAccidentTime() {
    print("THE HOUR OF THE ACCDIENT IS: ${widget.accidentDate}");
    var hour = widget.accidentDate.hour > 12
        ? widget.accidentDate.hour - 12
        : widget.accidentDate.hour == 0
            ? 12
            : widget.accidentDate.hour;
    var minutes = widget.accidentDate.minute;
    var seconds = widget.accidentDate.second;
    var meridian = widget.accidentDate.hour >= 12 ? "PM" : "AM";

    var time =
        "${hour.toString().padLeft(2, "0")}:$minutes:${seconds.toString().padLeft(2, "0")} $meridian";
    return time;
  }

  // FORMAT ACCIDENT DATE IN APPROPRIATE FORMAT
  getAccidentDate() {
    var day = widget.accidentDate.day;
    var month =
        DateFormat('MMMM').format(DateTime(0, widget.accidentDate.month));
    var year = widget.accidentDate.year;

    var date = "$day-$month-$year";
    return date;
  }

  @override
  Widget build(BuildContext context) {
    var date = getAccidentDate();
    var time = getAccidentTime();
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            widget.image,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(89, 244, 67, 54),
          ),

          // ACCIDENT DETAILS TEXT
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: const EdgeInsets.only(top: 70, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "ACCIDENT DETAILS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
          ),

          // MIDDLE ROW THAT CONTAINS THE DETAILS OF THE ACCIDENT
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SHORT VIDEO OF THE ACCIDENT
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 1,
                                color: Colors.red,
                              )),
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: VideoPlayer(_controller),
                            ),

                            // PLAY AND PAUSE ICON
                            Positioned(
                              bottom: 160,
                              left: 145,
                              child: IconButton(
                                onPressed: () {
                                  // Wrap the play or pause in a call to `setState`. This ensures the
                                  // correct icon is shown.
                                  setState(() {
                                    // If the video is playing, pause it.
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                    } else {
                                      // If the video is paused, play it.
                                      _controller.play();
                                    }
                                  });
                                },
                                icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_circle_fill_rounded,
                                  size: 50,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 30),

                  // RIGHT COLUMN FOR OTHER ACCIDENT DETAILS
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ACCIDENT DATE
                      Row(
                        children: [
                          const Text(
                            "DATE: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          AutoSizeText(
                            date.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // ACCIDENT TIME
                      Row(
                        children: [
                          const Text(
                            "TIME: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          AutoSizeText(
                            time,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // ACCIDENT LOCATION
                      Row(
                        children: [
                          const Text(
                            "LOCATION: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          AutoSizeText(
                            widget.location,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // ACCIDENT SEVERITY
                      Row(
                        children: const [
                          Text(
                            "SEVERITY: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          AutoSizeText(
                            "MODERATE",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // ACTION BUTTONS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // RESOLVE ALERTS BUTTON
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              
                              // ALERTS RESOLVED SNACKBAR
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 20,
                                  ),
                                  backgroundColor: Colors.green,
                                  content: const AutoSizeText(
                                    "ALERTS RESOLVED",
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    minFontSize: 15,
                                  ),
                                ),
                              );
                              print("RESOLVING ALERTS");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 35),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                  // strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                              child: const Text(
                                "RESOLVE ALERTS",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),

                          // BACK BUTTON
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              margin: const EdgeInsets.symmetric(vertical: 35),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                              ),
                              child: const Text(
                                "BACK",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
