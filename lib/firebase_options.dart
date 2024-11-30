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
    apiKey: 'AIzaSyC0A6wF1XVDLDGxQpg9ZTWGh1Dk2MTaiJY',
    appId: '1:680987730296:web:8b005a6c9c9e935774288d',
    messagingSenderId: '680987730296',
    projectId: 'innovaapp-c4c1a',
    authDomain: 'innovaapp-c4c1a.firebaseapp.com',
    storageBucket: 'innovaapp-c4c1a.firebasestorage.app',
    measurementId: 'G-CPX7YRMK7R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQiFN32qEr44WRvn7NXDeutdLYPjvvrm8',
    appId: '1:680987730296:android:e886575256346ddf74288d',
    messagingSenderId: '680987730296',
    projectId: 'innovaapp-c4c1a',
    storageBucket: 'innovaapp-c4c1a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHfbfej7BM6p01RoHeZknPXK8DGyKwEM4',
    appId: '1:680987730296:ios:97a082c28e13c22574288d',
    messagingSenderId: '680987730296',
    projectId: 'innovaapp-c4c1a',
    storageBucket: 'innovaapp-c4c1a.firebasestorage.app',
    iosBundleId: 'com.example.sprint1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHfbfej7BM6p01RoHeZknPXK8DGyKwEM4',
    appId: '1:680987730296:ios:97a082c28e13c22574288d',
    messagingSenderId: '680987730296',
    projectId: 'innovaapp-c4c1a',
    storageBucket: 'innovaapp-c4c1a.firebasestorage.app',
    iosBundleId: 'com.example.sprint1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC0A6wF1XVDLDGxQpg9ZTWGh1Dk2MTaiJY',
    appId: '1:680987730296:web:00d8ecfca88d2ea674288d',
    messagingSenderId: '680987730296',
    projectId: 'innovaapp-c4c1a',
    authDomain: 'innovaapp-c4c1a.firebaseapp.com',
    storageBucket: 'innovaapp-c4c1a.firebasestorage.app',
    measurementId: 'G-41BHM1N7Q8',
  );
}