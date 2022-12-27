import 'package:flutter/material.dart';

class FullLiveMonitoring extends StatefulWidget {
  final int? index;
  final String? video;

  const FullLiveMonitoring(
      {required this.index, required this.video, super.key});

  @override
  State<FullLiveMonitoring> createState() => _FullLiveMonitoringState();
}

class _FullLiveMonitoringState extends State<FullLiveMonitoring> {
  @override
  Widget build(BuildContext context) {
    print("FULL SCREEN VIDEO LOADED");
    return Scaffold(
      body: Container(
        color: Colors.purple,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            // BACKGROUND IMAGE
            Expanded(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset("assets/images/cars.jpg"),
              ),
            ),

            // LIVE MONITORING
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: const [
                  Icon(Icons.circle, color: Colors.red, size: 20),
                  Text(
                    "Live Monitoring",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            // DATE AND TIME
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 20,
                width: 100,
                decoration: const BoxDecoration(
                  color: const Color.fromARGB(161, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: const Text(
                  "Tue 29-Sept-2022 06:32:43 PM",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // CAMERA NUMBER
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "CAMERA 0${widget.index.toString()}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
