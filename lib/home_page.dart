import 'package:flutter/material.dart';
import 'loginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.blueGrey],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/Group 2.png'),
                      height: 80,
                      width: 170,
                    ),
                    SizedBox(width: 35),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image(
                          image: AssetImage('assets/images/Rectangle 6.png'),
                          height: 65,
                          width: 85,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Tasks',
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {

                      },
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
