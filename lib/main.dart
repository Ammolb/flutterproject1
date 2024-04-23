
import 'package:flutter/material.dart';
import 'package:flutterproject/firebase_api.dart';
import 'package:flutterproject/firebase_options.dart';
import 'package:flutterproject/firebase_options.dart';
import 'package:flutterproject/splash.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';





void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(name: 'Test Noti', options: DefaultFirebaseOptions.currentPlatform  );

  await FirebaseApi().initNotification();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Color.fromRGBO(33, 40, 50, 1.0)),
        home: SplashScreen(),
        );
    }
}