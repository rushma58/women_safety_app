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
    apiKey: 'AIzaSyALLR4arJ5MkPWUXg5sWsmtPhkxRT8AAqM',
    appId: '1:189485602796:web:4dffa015c6bbbbfa4d12c9',
    messagingSenderId: '189485602796',
    projectId: 'women-safety-app-a1c92',
    authDomain: 'women-safety-app-a1c92.firebaseapp.com',
    storageBucket: 'women-safety-app-a1c92.firebasestorage.app',
    measurementId: 'G-X06LNC40HW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3YmkEgVRoTa0DcyhI_gdga5Tx46011uc',
    appId: '1:189485602796:android:5922f98477ee16864d12c9',
    messagingSenderId: '189485602796',
    projectId: 'women-safety-app-a1c92',
    storageBucket: 'women-safety-app-a1c92.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9dDYfXthswgpA1GY2Lw5HsCm5zG8i9LA',
    appId: '1:189485602796:ios:7a59dd748d839a8d4d12c9',
    messagingSenderId: '189485602796',
    projectId: 'women-safety-app-a1c92',
    storageBucket: 'women-safety-app-a1c92.firebasestorage.app',
    iosClientId: '189485602796-u4paljidou6l2fd697tm18i7nv57rvuj.apps.googleusercontent.com',
    iosBundleId: 'com.example.womenSafetyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9dDYfXthswgpA1GY2Lw5HsCm5zG8i9LA',
    appId: '1:189485602796:ios:7a59dd748d839a8d4d12c9',
    messagingSenderId: '189485602796',
    projectId: 'women-safety-app-a1c92',
    storageBucket: 'women-safety-app-a1c92.firebasestorage.app',
    iosClientId: '189485602796-u4paljidou6l2fd697tm18i7nv57rvuj.apps.googleusercontent.com',
    iosBundleId: 'com.example.womenSafetyApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyALLR4arJ5MkPWUXg5sWsmtPhkxRT8AAqM',
    appId: '1:189485602796:web:7493b7180ed9e4374d12c9',
    messagingSenderId: '189485602796',
    projectId: 'women-safety-app-a1c92',
    authDomain: 'women-safety-app-a1c92.firebaseapp.com',
    storageBucket: 'women-safety-app-a1c92.firebasestorage.app',
    measurementId: 'G-7CY60G431V',
  );

}