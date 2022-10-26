import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:
      //color: Colors.deepPurpleAccent,
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.deepPurple,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              child: const Text(
                "Insert inspirational quotes here!",
                textAlign: TextAlign.center,
                style: (

                    //add text color here,
                    TextStyle(fontSize: 25, color:Colors.white, fontWeight: FontWeight.bold )
                ),//style end
              ),
            ),

            SizedBox(
              width: 200.0,
              height:85.0,


              child: ElevatedButton(
                onPressed: (){},
                //color: Colors.white,
                child:const Text(
                  textAlign:TextAlign.center,
                  "END\nWORKOUT",
                  style: (
                      TextStyle(fontSize: 20, color:Colors.black)
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor:Colors.red),
              ),
            ),


          ],
        ),
      ), //column
    );
  }
}



