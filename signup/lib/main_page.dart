/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signup/auth_page.dart';
import 'package:signup/login_page.dart';
import 'home_page.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // runApp(const MyApp());
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    ),
  );
}

class MainPage extends StatelessWidget {
  const MainPage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
           // return HomePage();
            return NavBar();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:signup/auth_page.dart';
import 'package:signup/main.dart';
import 'package:signup/login_page.dart';
import 'home_page.dart';
//import 'main.dart';

/*
void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(const MyApp());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ),
  );
}
*/

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();

  dynamic box = await Hive.openBox('mybox');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ),
  );
}


class MainPage extends StatelessWidget {
  const MainPage({ Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return navBar();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}