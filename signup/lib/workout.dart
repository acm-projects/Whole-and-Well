import 'package:flutter/material.dart';
import 'workout1.dart';
import 'notes.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
    home: Workout(),
),
);

class Workout extends StatelessWidget {
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Workout1())
              );
              //MaterialApp.router() route this to the next page in workout
            },
            child: const Text(
              "BEGIN \n WORKOUT",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
      ),
        ),

//route a new button to the notes page -->
          Container(
            /*margin: const EdgeInsets.all(30.0),
            child: const SizedBox(
                width: 300,
                height: 300,
                child: ColoredBox(color: Colors.black),*/
            child: ElevatedButton(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotesPage())
              );

    }, child: Text("Create Journal Entry!"),

    )

    ),
              ],
          ),
          //ElevatedButton(onPressed: onPressed(){}, child: Text("test")),
    );
  }
}


