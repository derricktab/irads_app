import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:irads_app/alert_screen.dart';
import 'package:irads_app/firebase_options.dart';
import 'package:irads_app/homepage.dart';
import 'package:irads_app/live_monitoring.dart';
import 'package:irads_app/login.dart';
import 'package:irads_app/preview_mode.dart';

void main() async {

  // ENSURING THAT FIREBASE IS INITIALIZED
  WidgetsFlutterBinding.ensureInitialized();

  // INITIALIZING FIREBASE
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // RUNNING THE APP
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "login":(context) => const Login(),
        "home":(context) => const HomePage(),
        "live_monitoring":(context) => const LiveMonitoring(),
        "preview_mode":(context) => const PreviewMode(),
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
