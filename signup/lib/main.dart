/*
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:hive/hive.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:signup/home_page.dart';
//import 'package:signup/main_page.dart';
//import 'package:signup/notes.dart';
//import 'login_page.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 // static const String _title = 'Whole and Well';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MainPage(),
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}

//initial state = main page --> routes to home with nav bar and changing screens
*/

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:signup/main_goal_page.dart';
//import 'package:signup/GoalsPage.dart';
import 'package:signup/short_goal_page.dart';
import 'long_goal_page.dart';
import 'workout.dart';
import 'profile.dart';
import 'lgoals.dart';
import 'sgoals.dart';
import 'package:signup/home_page.dart';
/*
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: navBar(),
  ),
  );
}*/

dynamic response ="{'key1': 'value', 'key2': 'value'}";
dynamic quote ="You are doing great! Keep going!";

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();

  dynamic box = await Hive.openBox('mybox');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: navBar(),
  ),
  );
}

class navBar extends StatefulWidget {
  @override
  navBarState createState() => navBarState();
}

class navBarState extends State<navBar> {

  int _currentIndex = 0;

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      MyHomePage(),
    //  ShortGoalsPage(),
      MainGoalPage(),
      Workout(),
      Profile(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.deepPurpleAccent,
          onTap: _onTapped,
          items: [
            BottomNavigationBarItem(
                label: 'Home', icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
                label: 'Goals', icon: Icon(Icons.radar_outlined)),
            BottomNavigationBarItem(
                label: 'Workout', icon: Icon(Icons.sports_gymnastics_outlined)),
            BottomNavigationBarItem(
                label: 'Profile', icon: Icon(Icons.account_circle_outlined)),
            /*BottomNavigationBarItem(
                label: 'Settings', icon: Icon(Icons.settings)),*/
          ]),
    );
  }
}
