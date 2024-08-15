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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDxxu27d1EipM-vvgA3UGzAPUXr0jOC4Ts',
    appId: '1:80147762781:web:875dadbd7ed9642682c7b4',
    messagingSenderId: '80147762781',
    projectId: 'practice-85888',
    authDomain: 'practice-85888.firebaseapp.com',
    storageBucket: 'practice-85888.appspot.com',
    measurementId: 'G-CW0GFZ0N77',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTcfztqhyxSj4fCNcxJPMc9mkVMr4w5h8',
    appId: '1:80147762781:android:9d03f3be454c8f2582c7b4',
    messagingSenderId: '80147762781',
    projectId: 'practice-85888',
    storageBucket: 'practice-85888.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQuZMqo_ol15p9NMHduibt3-r-SKR69hU',
    appId: '1:80147762781:ios:64f871941d07621f82c7b4',
    messagingSenderId: '80147762781',
    projectId: 'practice-85888',
    storageBucket: 'practice-85888.appspot.com',
    iosBundleId: 'com.example.practice',
  );
}
