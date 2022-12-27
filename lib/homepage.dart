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
    print("USER IS LOGGED IN, ID $currentUserId");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}
