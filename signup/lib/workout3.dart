import 'package:flutter/material.dart';

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
        color: Colors.deepPurple,
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
                    TextStyle(fontSize: 25, color:Colors.white, fontWeight: FontWeight.bold )
                ),//style end
              ),
            ),
            Container(
                child: MyStatefulWidget(

                )
            ),

            SizedBox(
              width: 200.0,
              height:85.0,

              child: ElevatedButton(
                onPressed: (){},
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