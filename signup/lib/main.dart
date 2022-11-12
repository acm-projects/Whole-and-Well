import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:signup/main_page.dart';
import 'package:signup/notes.dart';
import 'login_page.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Whole and Well';

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
      return MaterialApp(
        debugShowCheckedModeBanner: false,
     // home: MainPage(),
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  //    home: MainPage(),
>>>>>>> e8de866c53224f4882f4babbdc75ccba22ca7e5d
      home: NotesPage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}

//initial state = main page --> routes to home with nav bar and changing screens