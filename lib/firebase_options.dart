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
    apiKey: 'AIzaSyCW_Do2U1dEmk4pWAuVWpMKUFtehscArvk',
    appId: '1:331409317731:web:c4485fc5df46f98be07d56',
    messagingSenderId: '331409317731',
    projectId: 'pcic-97692',
    authDomain: 'pcic-97692.firebaseapp.com',
    databaseURL: 'https://pcic-97692-default-rtdb.firebaseio.com',
    storageBucket: 'pcic-97692.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMXBz35aNPP9HnJu-lYK7guCHgdV_LX1g',
    appId: '1:331409317731:android:b4d53e29050421d0e07d56',
    messagingSenderId: '331409317731',
    projectId: 'pcic-97692',
    databaseURL: 'https://pcic-97692-default-rtdb.firebaseio.com',
    storageBucket: 'pcic-97692.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsU0TmpoMhzRH6ASmNR4-Wxna9Gv8DRZo',
    appId: '1:331409317731:ios:980435caef9e7d53e07d56',
    messagingSenderId: '331409317731',
    projectId: 'pcic-97692',
    databaseURL: 'https://pcic-97692-default-rtdb.firebaseio.com',
    storageBucket: 'pcic-97692.appspot.com',
    iosBundleId: 'com.quanby.pcicApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsU0TmpoMhzRH6ASmNR4-Wxna9Gv8DRZo',
    appId: '1:331409317731:ios:8df83d32a4562ab8e07d56',
    messagingSenderId: '331409317731',
    projectId: 'pcic-97692',
    databaseURL: 'https://pcic-97692-default-rtdb.firebaseio.com',
    storageBucket: 'pcic-97692.appspot.com',
    iosBundleId: 'com.quanby.pcicApp.RunnerTests',
  );
}
