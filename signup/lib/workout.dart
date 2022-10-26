import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home(),
),
);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(250, 250),
                shape: const CircleBorder(),
                backgroundColor:Colors.deepPurpleAccent,
            ),

            onPressed: () {
              //MaterialApp.router() route this to the next page in workout
            },
            child: const Text(
              "BEGIN \n WORKOUT",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
      ),
        ),


          Container(
            margin: const EdgeInsets.all(30.0),
            child: const SizedBox(
              width: 300,
              height: 300,
              child: ColoredBox(color: Colors.black),
    ),
          ),
              ],
          ),
          //ElevatedButton(onPressed: onPressed(){}, child: Text("test")),
    );
  }
}


