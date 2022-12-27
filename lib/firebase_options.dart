// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBfdmsu6hG7c4JndBYRm15PBQJmxEHLNb8',
    appId: '1:905209403991:web:c5fc113bd37cb994d4a112',
    messagingSenderId: '905209403991',
    projectId: 'irads-d7ce6',
    authDomain: 'irads-d7ce6.firebaseapp.com',
    storageBucket: 'irads-d7ce6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9zGhLxy0pez_Cdt5Nt4EeliU_6tzgd7g',
    appId: '1:905209403991:android:fb3ebff8cc954947d4a112',
    messagingSenderId: '905209403991',
    projectId: 'irads-d7ce6',
    storageBucket: 'irads-d7ce6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdIYqA4vGd7z_Q-teKoN3NRlh1GBELb2E',
    appId: '1:905209403991:ios:508c1562485d8520d4a112',
    messagingSenderId: '905209403991',
    projectId: 'irads-d7ce6',
    storageBucket: 'irads-d7ce6.appspot.com',
    iosClientId: '905209403991-8038vc35iq3mt5im5b0n13lmi78jk1sc.apps.googleusercontent.com',
    iosBundleId: 'com.example.iradsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdIYqA4vGd7z_Q-teKoN3NRlh1GBELb2E',
    appId: '1:905209403991:ios:508c1562485d8520d4a112',
    messagingSenderId: '905209403991',
    projectId: 'irads-d7ce6',
    storageBucket: 'irads-d7ce6.appspot.com',
    iosClientId: '905209403991-8038vc35iq3mt5im5b0n13lmi78jk1sc.apps.googleusercontent.com',
    iosBundleId: 'com.example.iradsApp',
  );
}
