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
    apiKey: 'AIzaSyDx_xZZl0cOUc9ZU-4h5qICRzfNUBFMxRA',
    appId: '1:491882251056:web:ed57fb8a6ccb23f1127ef5',
    messagingSenderId: '491882251056',
    projectId: 'cool-mimo-project',
    authDomain: 'cool-mimo-project.firebaseapp.com',
    storageBucket: 'cool-mimo-project.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPoVId5o4DPJadcjTEi73mrJpySNtsuF4',
    appId: '1:491882251056:android:8e5558cbd94e5228127ef5',
    messagingSenderId: '491882251056',
    projectId: 'cool-mimo-project',
    storageBucket: 'cool-mimo-project.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAE8E-vJd0cfEl0obllM5SduULxnNc2R_Q',
    appId: '1:491882251056:ios:665dab9449961a30127ef5',
    messagingSenderId: '491882251056',
    projectId: 'cool-mimo-project',
    storageBucket: 'cool-mimo-project.firebasestorage.app',
    iosBundleId: 'com.example.mimo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAE8E-vJd0cfEl0obllM5SduULxnNc2R_Q',
    appId: '1:491882251056:ios:665dab9449961a30127ef5',
    messagingSenderId: '491882251056',
    projectId: 'cool-mimo-project',
    storageBucket: 'cool-mimo-project.firebasestorage.app',
    iosBundleId: 'com.example.mimo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDx_xZZl0cOUc9ZU-4h5qICRzfNUBFMxRA',
    appId: '1:491882251056:web:4de4c5ed087244b9127ef5',
    messagingSenderId: '491882251056',
    projectId: 'cool-mimo-project',
    authDomain: 'cool-mimo-project.firebaseapp.com',
    storageBucket: 'cool-mimo-project.firebasestorage.app',
  );
}
