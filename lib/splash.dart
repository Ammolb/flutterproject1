import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'loginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 93.0,
              height: 63.0,
              margin: EdgeInsets.only(left: 21, top: 23.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/main_page_logo.png'),
                  )
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 360.0,
              width: 370.0,
              decoration: BoxDecoration(color: Colors.white),
              child: Image(image: AssetImage('assets/images/pana.png')),
            ),
            SizedBox(height: 10.0),
            Container(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Manage your Task with",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PilatExtended',
                      fontSize: 50.0,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "DayTask",
                    style: TextStyle(
                        color: Color.fromRGBO(254, 211, 106, 1.0),
                        fontWeight: FontWeight.w900,
                        fontFamily: 'PilatExtended',
                        fontSize: 50.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize:
                  MaterialStateProperty.all<Size>(Size(600, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(254, 211, 106, 1.0)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Let's Start",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
