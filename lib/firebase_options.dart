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
    apiKey: 'AIzaSyAB-ylu4Sp5vo5_Bg55g4opr7ZWw7q2K_o',
    appId: '1:413079772128:web:3fd013b2ff770fe9186985',
    messagingSenderId: '413079772128',
    projectId: 'chatapp-1fdc6',
    authDomain: 'chatapp-1fdc6.firebaseapp.com',
    storageBucket: 'chatapp-1fdc6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-lkiJyYllnnEREiZ5yfc_VpaO4afZ42o',
    appId: '1:413079772128:android:8c11670cc5478ee1186985',
    messagingSenderId: '413079772128',
    projectId: 'chatapp-1fdc6',
    storageBucket: 'chatapp-1fdc6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPVk19y777-FPebsaDSzpKz4NkkCVM7rQ',
    appId: '1:413079772128:ios:9c6965d6944b956f186985',
    messagingSenderId: '413079772128',
    projectId: 'chatapp-1fdc6',
    storageBucket: 'chatapp-1fdc6.appspot.com',
    iosBundleId: 'com.example.minimalChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPVk19y777-FPebsaDSzpKz4NkkCVM7rQ',
    appId: '1:413079772128:ios:9176e3ed0b9953ee186985',
    messagingSenderId: '413079772128',
    projectId: 'chatapp-1fdc6',
    storageBucket: 'chatapp-1fdc6.appspot.com',
    iosBundleId: 'com.example.minimalChatApp.RunnerTests',
  );
}
