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
    apiKey: 'AIzaSyABHx9wKM-eVLRnI5oGDzHfqP7vhS3nibw',
    appId: '1:327228382806:web:917d9c5af1ff85b288e5f7',
    messagingSenderId: '327228382806',
    projectId: 'fireabaseauthcrud',
    authDomain: 'fireabaseauthcrud.firebaseapp.com',
    storageBucket: 'fireabaseauthcrud.appspot.com',
    measurementId: 'G-CTEXZSKLJY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDY4BpxHm0cGFGDWEsZ40l8LkkRHezB-oc',
    appId: '1:327228382806:android:3cd6b56b2aa5021a88e5f7',
    messagingSenderId: '327228382806',
    projectId: 'fireabaseauthcrud',
    storageBucket: 'fireabaseauthcrud.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEvIUqq9aAJ2sWJHCDaOv-Vby1CE1dMDM',
    appId: '1:327228382806:ios:33d4482ffb68db3588e5f7',
    messagingSenderId: '327228382806',
    projectId: 'fireabaseauthcrud',
    storageBucket: 'fireabaseauthcrud.appspot.com',
    iosBundleId: 'com.example.firebaseAuthCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEvIUqq9aAJ2sWJHCDaOv-Vby1CE1dMDM',
    appId: '1:327228382806:ios:789d90dc1a9ac73388e5f7',
    messagingSenderId: '327228382806',
    projectId: 'fireabaseauthcrud',
    storageBucket: 'fireabaseauthcrud.appspot.com',
    iosBundleId: 'com.example.firebaseAuthCrud.RunnerTests',
  );
}