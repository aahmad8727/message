// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCLxAQEIjyarMLzpTGamO8AegzQezxmphA',
    appId: '1:996389337982:web:5841b6002640cb10e8512f',
    messagingSenderId: '996389337982',
    projectId: 'message-e2996',
    authDomain: 'message-e2996.firebaseapp.com',
    storageBucket: 'message-e2996.firebasestorage.app',
    measurementId: 'G-EKD4NPLC9T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl9uOfrQ1P23PiorHkBZEsc1cNFPVJoAw',
    appId: '1:996389337982:android:f8654a75027b6033e8512f',
    messagingSenderId: '996389337982',
    projectId: 'message-e2996',
    storageBucket: 'message-e2996.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpPqrSXmnU4118ArK6aX6eUhEh2E5CY9c',
    appId: '1:996389337982:ios:105305fee31fa3ace8512f',
    messagingSenderId: '996389337982',
    projectId: 'message-e2996',
    storageBucket: 'message-e2996.firebasestorage.app',
    iosBundleId: 'com.example.messageboard',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpPqrSXmnU4118ArK6aX6eUhEh2E5CY9c',
    appId: '1:996389337982:ios:105305fee31fa3ace8512f',
    messagingSenderId: '996389337982',
    projectId: 'message-e2996',
    storageBucket: 'message-e2996.firebasestorage.app',
    iosBundleId: 'com.example.messageboard',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCLxAQEIjyarMLzpTGamO8AegzQezxmphA',
    appId: '1:996389337982:web:3ef3fa162d258a04e8512f',
    messagingSenderId: '996389337982',
    projectId: 'message-e2996',
    authDomain: 'message-e2996.firebaseapp.com',
    storageBucket: 'message-e2996.firebasestorage.app',
    measurementId: 'G-JXX6DJ2M6G',
  );

}