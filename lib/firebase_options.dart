import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DefaultFirebaseOptions{








 static FirebaseOptions get currentPlatform {
  // Define FirebaseOptions for each platform
FirebaseOptions webOptions = FirebaseOptions(
  appId: '1:29769349823:android:658259999d6f6c1d2c240a',
  apiKey: 'AIzaSyDC2Ys9nTwDiW1GErwDwbnzeO5sXqubCzc',
  projectId: 'fantasy-expert-news',
  messagingSenderId: '683740647862'
);

FirebaseOptions androidOptions = FirebaseOptions(
  appId: '1:29769349823:android:658259999d6f6c1d2c240a',
  apiKey: 'AIzaSyDC2Ys9nTwDiW1GErwDwbnzeO5sXqubCzc',
  projectId: 'fantasy-expert-news',
   messagingSenderId: '683740647862',
);

FirebaseOptions iosOptions = const FirebaseOptions(
  appId: '1:29769349823:android:658259999d6f6c1d2c240a',
  apiKey: 'AIzaSyDC2Ys9nTwDiW1GErwDwbnzeO5sXqubCzc',
  messagingSenderId: '683740647862',
  projectId: 'fantasy-expert-news',
);

FirebaseOptions macosOptions = FirebaseOptions(
  appId: '1:29769349823:android:658259999d6f6c1d2c240a',
  apiKey: 'AIzaSyDC2Ys9nTwDiW1GErwDwbnzeO5sXqubCzc',
  projectId: 'fantasy-expert-news',
  messagingSenderId: '683740647862'
);


    if (kIsWeb) {
      return webOptions;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidOptions;
      case TargetPlatform.iOS:
        return iosOptions;
      case TargetPlatform.macOS:
        return macosOptions;
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
}