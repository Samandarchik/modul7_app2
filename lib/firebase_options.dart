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
    apiKey: 'AIzaSyARdn574FC6ak9x3sqFvN2qVrJ0AycwdvQ',
    appId: '1:1019489486029:web:2bdab85e26cec7eac69584',
    messagingSenderId: '1019489486029',
    projectId: 'food-a2a32',
    authDomain: 'food-a2a32.firebaseapp.com',
    storageBucket: 'food-a2a32.appspot.com',
    measurementId: 'G-YRM5TQWQ28',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9Q0DZE1ZeY966rjmOQj4pd6GoFkUFz5w',
    appId: '1:1019489486029:android:8bd2cfd480ac3b59c69584',
    messagingSenderId: '1019489486029',
    projectId: 'food-a2a32',
    storageBucket: 'food-a2a32.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCY0S4McEkSTmj6Oc5-fF2LOx8_kfAUJXY',
    appId: '1:1019489486029:ios:4ae45bb5105ac0c1c69584',
    messagingSenderId: '1019489486029',
    projectId: 'food-a2a32',
    storageBucket: 'food-a2a32.appspot.com',
    iosBundleId: 'com.example.modul7App2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCY0S4McEkSTmj6Oc5-fF2LOx8_kfAUJXY',
    appId: '1:1019489486029:ios:4ae45bb5105ac0c1c69584',
    messagingSenderId: '1019489486029',
    projectId: 'food-a2a32',
    storageBucket: 'food-a2a32.appspot.com',
    iosBundleId: 'com.example.modul7App2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyARdn574FC6ak9x3sqFvN2qVrJ0AycwdvQ',
    appId: '1:1019489486029:web:f13690948d68d9acc69584',
    messagingSenderId: '1019489486029',
    projectId: 'food-a2a32',
    authDomain: 'food-a2a32.firebaseapp.com',
    storageBucket: 'food-a2a32.appspot.com',
    measurementId: 'G-DQFY7Q7PW6',
  );

}