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
    apiKey: 'AIzaSyDxiAXjJRfgczbYGIav8Vzz4oRLztGR664',
    appId: '1:518287074406:web:501ca2dcfce9ff8398b9a7',
    messagingSenderId: '518287074406',
    projectId: 'push-notificaton-d9134',
    authDomain: 'push-notificaton-d9134.firebaseapp.com',
    storageBucket: 'push-notificaton-d9134.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6_kbEPGcyc9xoYJAtWNEB2iIPnTcQot8',
    appId: '1:518287074406:android:2274c49dab17c64d98b9a7',
    messagingSenderId: '518287074406',
    projectId: 'push-notificaton-d9134',
    storageBucket: 'push-notificaton-d9134.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJ1PyihSQFXkdXxCsg4TAgFgjEHEEtLgs',
    appId: '1:518287074406:ios:8f2ae8d2ca59ace898b9a7',
    messagingSenderId: '518287074406',
    projectId: 'push-notificaton-d9134',
    storageBucket: 'push-notificaton-d9134.appspot.com',
    iosClientId:
        '518287074406-agpq7mofqt0vuar362ikue0mt8m2fpgj.apps.googleusercontent.com',
    iosBundleId: 'com.example.ccfApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJ1PyihSQFXkdXxCsg4TAgFgjEHEEtLgs',
    appId: '1:518287074406:ios:8f2ae8d2ca59ace898b9a7',
    messagingSenderId: '518287074406',
    projectId: 'push-notificaton-d9134',
    storageBucket: 'push-notificaton-d9134.appspot.com',
    iosClientId:
        '518287074406-agpq7mofqt0vuar362ikue0mt8m2fpgj.apps.googleusercontent.com',
    iosBundleId: 'com.example.ccfApp',
  );
}
