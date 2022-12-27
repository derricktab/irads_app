import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentUserId;
  // METHOD TO GET THE CURRENTLY LOGGED IN USER
  getCurrentUser() {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      // Redirect the user to the login page
      Navigator.pushReplacementNamed(context, "login");
    } else {
      setState(() {
        currentUserId = currentUser.uid;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Image.asset(
          "assets/images/cameras.png",
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SELECT VIEW MODE TEXT
                  const Text(
                    "SELECT VIEW MODE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PT_Serif"),
                  ),

                  const SizedBox(width: 30),
                  Image.asset("assets/images/camera.png", width: 350),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    
                    // IF THE CONTAINER IS CLICKED
                    onTap: () {
                      print("THE USER IS GOING IN LIVE VIEW MODE");
                    },

                    // LIVE MONITORING
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 170,
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.settings_input_antenna_outlined,
                            size: 30,
                            color: Colors.red,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "LIVE MONITORING",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: "PT_Serif"),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  GestureDetector(
                    onTap: () {
                      print("THE USER IS GOING IN PREVIEW MODE");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 170,
                      width: 380,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.play_circle_outline,
                                size: 40,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.pause_circle_outline_outlined,
                                size: 40,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.stop_circle_rounded,
                                size: 40,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.fast_rewind_outlined,
                                size: 40,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "PREVIEW MODE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: "PT_Serif"),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
