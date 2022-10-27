import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: nameController.text.trim(),
        password: passwordController.text.trim(),
    );
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
                  'Register',
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
                  controller: confirmPasswordController,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    //   border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
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
                onTap: signUp,
                child: Container(
                  //   Container(
                  height: 43,
                  decoration: BoxDecoration(
                    color: Color(0xFF656CCA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  //    padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    child: const Text('Sign Up'),
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
                    onTap: widget.showLoginPage,
                    child: const Text(
                      'Login now',
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
