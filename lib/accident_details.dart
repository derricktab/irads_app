import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AccidentDetails extends StatefulWidget {
  final String video;
  final String image;
  final DateTime accidentDate;
  const AccidentDetails(
      {super.key,
      required this.video,
      required this.accidentDate,
      required this.image});

  @override
  State<AccidentDetails> createState() => _AccidentDetailsState();
}

class _AccidentDetailsState extends State<AccidentDetails> {
  @override
  Widget build(BuildContext context) {
    // var date = widget.accidentDate.day
    // var time =
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  const SizedBox(width: 40),
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
                            widget.accidentDate.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),

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
                            widget.accidentDate.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),

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
                            widget.accidentDate.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),

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

                      // ACTION BUTTONS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // RESOLVE ALERTS BUTTON
                          InkWell(
                            onTap: () {
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
                          const SizedBox(),

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
