import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Profile(),
),
);

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          const Expanded(
            //flex:1,
            //add styling here, use sizedbox and add text colors, ignore change profile picture aspect of it
            child: Text("Welcome Back User!"),
          ),
          Expanded(
            //flex:1,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                //alignment: FractionalOffset.bottomCenter,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                          border:Border(
                            bottom: BorderSide(
                              width:2,
                              color:Colors.grey,
                            ),
                          )
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.white,
                        ),
                        onPressed: () {
                          //MaterialApp.router() route this to the next page (Make a default screen that says Whole and Well that takes you to sign in page
                        },
                        child: const Text(
                          "Resources / Help",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color:Colors.purple),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:50,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                          border:Border(
                            bottom: BorderSide(
                              width:2,
                              color:Colors.grey,
                            ),
                          )
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.white,
                        ),
                        onPressed: () {
                          //MaterialApp.router() route this to the next page (Make a default screen that says Whole and Well that takes you to sign in page
                        },
                        child: const Text(
                          "View History",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color:Colors.purple),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:50,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                          border:Border(
                            bottom: BorderSide(
                              width:2,
                              color:Colors.grey,
                            ),
                          )
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.white,
                        ),
                        onPressed: () {
                          //MaterialApp.router() route this to the next page (Make a default screen that says Whole and Well that takes you to sign in page
                        },
                        child: const Text(
                          "Change daily notification time",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color:Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: const BoxDecoration(
                          border:Border(
                            bottom: BorderSide(
                              width:2,
                              color:Colors.grey,
                            ),
                          )
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.white,
                        ),
                        onPressed: () {
                          //MaterialApp.router() route this to the next page (Make a default screen that says Whole and Well that takes you to sign in page
                        },
                        child: const Text(
                          "Edit Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color:Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.deepPurpleAccent,
                      ),
                      onPressed: () {
                      },

                      child: const Text(
                        "LOG OUT",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //ElevatedButton(onPressed: onPressed(){}, child: Text("test")),
    );
  }
}