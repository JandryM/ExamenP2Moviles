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
    apiKey: 'AIzaSyChWZA5fC3LkzXo2V0ejAOq_zXIGxrNoXo',
    appId: '1:663344266016:web:2224bf1881cdd4f37d7545',
    messagingSenderId: '663344266016',
    projectId: 'bdmoviles2-9b9f7',
    authDomain: 'bdmoviles2-9b9f7.firebaseapp.com',
    storageBucket: 'bdmoviles2-9b9f7.appspot.com',
    measurementId: 'G-R736MNSLZ2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDR21Z2560Ipz_NDMMZR4tlq_BAFHZy1Hk',
    appId: '1:663344266016:android:a6ec813f01dd69f97d7545',
    messagingSenderId: '663344266016',
    projectId: 'bdmoviles2-9b9f7',
    storageBucket: 'bdmoviles2-9b9f7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCScuZ8pxZr_SVvdBB9WknQibnHU_LhvQs',
    appId: '1:663344266016:ios:569153d72327458a7d7545',
    messagingSenderId: '663344266016',
    projectId: 'bdmoviles2-9b9f7',
    storageBucket: 'bdmoviles2-9b9f7.appspot.com',
    iosBundleId: 'com.example.examenp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCScuZ8pxZr_SVvdBB9WknQibnHU_LhvQs',
    appId: '1:663344266016:ios:569153d72327458a7d7545',
    messagingSenderId: '663344266016',
    projectId: 'bdmoviles2-9b9f7',
    storageBucket: 'bdmoviles2-9b9f7.appspot.com',
    iosBundleId: 'com.example.examenp2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyChWZA5fC3LkzXo2V0ejAOq_zXIGxrNoXo',
    appId: '1:663344266016:web:f9b2258b4a7284557d7545',
    messagingSenderId: '663344266016',
    projectId: 'bdmoviles2-9b9f7',
    authDomain: 'bdmoviles2-9b9f7.firebaseapp.com',
    storageBucket: 'bdmoviles2-9b9f7.appspot.com',
    measurementId: 'G-4G01N5YCST',
  );
}
