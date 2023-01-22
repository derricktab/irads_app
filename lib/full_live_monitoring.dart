import 'package:flutter/material.dart';
import 'dart:async';

import 'package:irads_app/alert_screen.dart';

class FullLiveMonitoring extends StatefulWidget {
  final int? index;
  final String? video;

  const FullLiveMonitoring(
      {required this.index, required this.video, super.key});

  @override
  State<FullLiveMonitoring> createState() => _FullLiveMonitoringState();
}

class _FullLiveMonitoringState extends State<FullLiveMonitoring> {
  DateTime current = DateTime.now();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Stream<DateTime> timer =
        Stream.periodic(const Duration(milliseconds: 1), (i) {
      current = current.add(const Duration(milliseconds: 1));
      return current;
    });

    Timer(Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return AlertScreen(
            index: widget.index, image: widget.video, timer: current);
      })));
    });

    return Scaffold(
      body: Container(
        color: Colors.purple,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            // BACKGROUND IMAGE
            Image.asset(
              widget.video.toString(),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),

            // LIVE MONITORING
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(170, 0, 0, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.circle, color: Colors.red, size: 20),
                      SizedBox(width: 20),
                      Text(
                        "Live Monitoring",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),

            // DATE AND TIME
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 42,
                width: 300,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(161, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: StreamBuilder<DateTime>(
                    stream: timer,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }),
              ),
            ),

            // CAMERA NUMBER
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Text(
                  "CAMERA 0${widget.index.toString()}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
