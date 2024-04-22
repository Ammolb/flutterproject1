import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'student_registration_page.dart';
import 'strings_en.dart';
import 'strings_hi.dart';
import 'strings_mr.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Locale _locale = Locale('en');


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentRegistrationPage()),
        );
      }
    });
  }

  // Function to change language
  void _changeLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
    setState(() {
      _locale = Locale(languageCode);
    });
  }

  @override
  void initState() {
    _getSavedLanguage();
    super.initState();
  }

  // Function to retrieve saved language preference
  void _getSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode');
    if (languageCode != null) {
      setState(() {
        _locale = Locale(languageCode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: [
        const Locale('en'),
        const Locale('hi'),
        const Locale('mr'),
      ],
      localizationsDelegates: [

        DefaultMaterialLocalizations.delegate,

        DefaultCupertinoLocalizations.delegate,

        DefaultWidgetsLocalizations.delegate,
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Change Language - English'),
                  onTap: () {
                    _changeLanguage('en');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Change Language - Hindi'),
                  onTap: () {
                    _changeLanguage('hi');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Change Language - Marathi'),
                  onTap: () {
                    _changeLanguage('mr');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.blueGrey],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add',
              ),

            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}
