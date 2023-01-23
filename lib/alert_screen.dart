import 'package:auto_size_text/auto_size_text.dart';
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:irads_app/accident_details.dart';

class AlertScreen extends StatefulWidget {
  final int? index;
  final String? image;
  final DateTime timer;

  const AlertScreen(
      {required this.index,
      required this.image,
      required this.timer,
      super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  DateTime current = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Stream<DateTime> timer =
        Stream.periodic(const Duration(milliseconds: 1), (i) {
      current = current.add(const Duration(milliseconds: 1));
      return current;
    });

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            // BACKGROUND IMAGE
            Image.asset(
              widget.image.toString(),
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
                      Icon(Icons.warning_amber, color: Colors.orange, size: 50),
                      SizedBox(width: 20),
                      // AutoSizeText(
                      //   "ALERT",
                      //   maxLines: 1,
                      //   style: TextStyle(
                      //     fontSize: 35,
                      //     overflow: TextOverflow.ellipsis,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.red,
                      //   ),
                      // )
                      BlinkText(
                        'ALERT',
                        style: TextStyle(fontSize: 35, color: Colors.redAccent),
                        beginColor: Colors.yellow,
                        endColor: Colors.red,
                        // times: 10,
                        duration: Duration(seconds: 1),
                      ),
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
                child: Text(
                  widget.timer.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
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
            ),

            // ALERT BOX
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TOP CONTAINER
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(
                        width: 6,
                        color: Colors.red,
                        // strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: const Text(
                      "ROAD ACCIDENT DETECTED",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),

                  // BOTTOM CONTAINER
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Colors.red,
                        // strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ACCIDENT DETAILS BUTTON
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return AccidentDetails(
                          image: widget.image!,
                          video: widget.image!,
                          accidentDate: widget.timer,
                          location: "CAMERA${widget.index}",
                        );
                      }),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(vertical: 35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                    border: Border.all(
                      width: 2,
                      color: Colors.red,
                      // strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                  child: const Text(
                    "View Accident Details",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
