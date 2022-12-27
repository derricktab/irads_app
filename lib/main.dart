import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:irads_app/firebase_options.dart';
import 'package:irads_app/homepage.dart';
import 'package:irads_app/login.dart';

void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "login":(context) => const Login(),
        "hpme":(context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'I-RADS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // ADDING A SPLASH SCREEN
      home: AnimatedSplashScreen(
        splashIconSize: 250,
        splash: "assets/images/logo.png",
        nextScreen: const HomePage(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
