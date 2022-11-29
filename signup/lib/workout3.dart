import 'package:flutter/material.dart';
import 'workout.dart';
import 'main.dart';
import 'globalvar.dart' as globals;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Workout3(),
  ),
  );
}

class Workout3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:
      Container(
        color: const Color(0xFF656CCA),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              child: const Text(
                "GOOD JOB!\nHOW ARE YOU FEELING\nPOST WORKOUT?",
                textAlign: TextAlign.center,
                style: (

                    //add text color here,
                    TextStyle(fontSize: 32.0, color:Colors.white, fontWeight: FontWeight.bold )
                ),//style end
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MyStatefulWidget(
              ),
            ),
            Container(
              width: 292.0,
              height:85.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => navBar())
                  );},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(30.0),
                    ),
                  ),//shape
                ),
                //style: ElevatedButton.styleFrom(backgroundColor:Colors.white),
                child:const Text(
                  "DONE",
                  style: (
                      TextStyle(fontSize: 40, color:Colors.black, fontWeight:FontWeight.bold)
                  ),
                ),
              ),
            ),
          ],
        ),
      ), //column
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: globals.finalSliderValue,
      min:0,
      max: 100,
      divisions: 5,
      activeColor: Colors.white,
      inactiveColor: Colors.white,
      label: globals.finalSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          globals.finalSliderValue = value;
        });
      },
    );
  }
}