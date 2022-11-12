import 'package:flutter/material.dart';
import 'workout2.dart';

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
        color: Colors.deepPurple,
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
                TextStyle(fontSize: 25, color:Colors.white, fontWeight: FontWeight.bold )
                ),//style end
              ),
              ),
           Container(
             child: MyStatefulWidget()
           ),

           SizedBox(
             width: 200.0,
             height:85.0,

             child: ElevatedButton(
             onPressed: () {
    /*Navigator.push(context,
    MaterialPageRoute(builder: (context) => Workout2())
    );*/},
                 //color: Colors.white,
                  child:const Text(
                    "DONE",
               style: (
                 TextStyle(fontSize: 40, color:Colors.black)
               ),
             ),
               style: ElevatedButton.styleFrom(backgroundColor:Colors.white),
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
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min:0,
      max: 100,
      divisions: 5,
      activeColor: Colors.white,
      inactiveColor: Colors.white,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}