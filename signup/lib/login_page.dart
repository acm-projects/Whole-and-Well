import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key,required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: nameController.text.trim(),
        password: passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[

            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                    //color: Colors.blue,
                      color: Color(0xFF224957),
                      fontWeight: FontWeight.w500,
                      fontSize: 70),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Welcome to Whole and Well!',
                  style: TextStyle(
                      color: Color(0xFF224957),
                      fontSize: 20),
                )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 43,
                decoration: BoxDecoration(
                  color: Color(0xFF656CCA),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    //   border: OutlineInputBorder(),
                    labelText: 'User Name',
                    labelStyle: TextStyle(
                      color: Colors.white, //<-- SEE HERE
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              //padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 43,
                decoration: BoxDecoration(
                  color: Color(0xFF656CCA),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                //padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    //   border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.white, //<-- SEE HERE
                    ),
                  ),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: signIn,
                child: Container(
                  //   Container(
                  height: 43,
                  decoration: BoxDecoration(
                    color: Color(0xFF656CCA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  //    padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      print(nameController.text);
                      print(passwordController.text);
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const Text('Do not have account?'),
                TextButton(
                  child: GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text(
                      'Register now',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
