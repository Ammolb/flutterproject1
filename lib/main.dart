import 'package:flutter/material.dart';
import 'package:flutterproject/splash.dart';

void main() {
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