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
    apiKey: 'AIzaSyAFLw5l_27Dhf3BaliUBxfAUQ-ug4BqGhg',
    appId: '1:801313995148:web:a82b9aa5cda8f19c76bea9',
    messagingSenderId: '801313995148',
    projectId: 'habeba',
    authDomain: 'habeba.firebaseapp.com',
    databaseURL: 'https://habeba-default-rtdb.firebaseio.com',
    storageBucket: 'habeba.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjVBvl8zruaYOPTJcGbUrt6h3EnpZuiAk',
    appId: '1:801313995148:android:0068d21014aecdfb76bea9',
    messagingSenderId: '801313995148',
    projectId: 'habeba',
    databaseURL: 'https://habeba-default-rtdb.firebaseio.com',
    storageBucket: 'habeba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDh--Wk_6JUzHbvXlr9MgakghxyQjZYBhE',
    appId: '1:801313995148:ios:4f8ad26b54968ef176bea9',
    messagingSenderId: '801313995148',
    projectId: 'habeba',
    databaseURL: 'https://habeba-default-rtdb.firebaseio.com',
    storageBucket: 'habeba.appspot.com',
    iosBundleId: 'com.example.phoneAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDh--Wk_6JUzHbvXlr9MgakghxyQjZYBhE',
    appId: '1:801313995148:ios:8c88cbbefeeeaa1076bea9',
    messagingSenderId: '801313995148',
    projectId: 'habeba',
    databaseURL: 'https://habeba-default-rtdb.firebaseio.com',
    storageBucket: 'habeba.appspot.com',
    iosBundleId: 'com.example.phoneAuth.RunnerTests',
  );
}
