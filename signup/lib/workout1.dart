import 'package:flutter/material.dart';
import 'workout2.dart';
import 'globalvar.dart' as globals;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Workout1(),
  ),
  );
}

class Workout1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:
      //color: Colors.deepPurpleAccent,
      Container(
        color: Color(0xFF656CCA),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              child: const Text(
                "BEFORE WE START TODAY,\nHOW HAS YOUR DAY\nBEEN SO FAR?",
                textAlign: TextAlign.center,
                style: (

                    //add text color here,
                    TextStyle(fontSize: 32, color:Colors.white, fontWeight: FontWeight.bold )
                ),//style end
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(50.0),
                child: MyStatefulWidget()
            ),

            Container(
              width: 292.0,
              height:85.0,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Workout2())
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
  //globals._currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: globals.currentSliderValue,
      min:0,
      max: 100,
      divisions: 5,
      activeColor: Colors.white,
      inactiveColor: Colors.white,
      label: globals.currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          globals.currentSliderValue = value;
        });
      },
    );
  }
}