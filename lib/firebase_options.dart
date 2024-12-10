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
    apiKey: 'AIzaSyCSyz3MHrwneBYrpO765YIY--RMW7RrsdY',
    appId: '1:891770106277:web:dd1732c266bee99e5c784c',
    messagingSenderId: '891770106277',
    projectId: 'accountmanegement',
    authDomain: 'accountmanegement.firebaseapp.com',
    storageBucket: 'accountmanegement.firebasestorage.app',
    measurementId: 'G-NRX7825MNZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgLdXLMzwCz_87iKCr44WWtCQBQIN8Rks',
    appId: '1:891770106277:android:6216c15d7ee030215c784c',
    messagingSenderId: '891770106277',
    projectId: 'accountmanegement',
    storageBucket: 'accountmanegement.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLpItMIw1M1LOunjEPUqzQUy_noTsC1UQ',
    appId: '1:891770106277:ios:1a63f59f90d0dcad5c784c',
    messagingSenderId: '891770106277',
    projectId: 'accountmanegement',
    storageBucket: 'accountmanegement.firebasestorage.app',
    iosBundleId: 'com.example.accountManagementApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLpItMIw1M1LOunjEPUqzQUy_noTsC1UQ',
    appId: '1:891770106277:ios:1a63f59f90d0dcad5c784c',
    messagingSenderId: '891770106277',
    projectId: 'accountmanegement',
    storageBucket: 'accountmanegement.firebasestorage.app',
    iosBundleId: 'com.example.accountManagementApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCSyz3MHrwneBYrpO765YIY--RMW7RrsdY',
    appId: '1:891770106277:web:a8ebb0af5533fb045c784c',
    messagingSenderId: '891770106277',
    projectId: 'accountmanegement',
    authDomain: 'accountmanegement.firebaseapp.com',
    storageBucket: 'accountmanegement.firebasestorage.app',
    measurementId: 'G-29P5H0VJQ2',
  );
}