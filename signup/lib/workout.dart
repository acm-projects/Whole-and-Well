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
          //padding: EdgeInsets.all(20.0),

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 200),
                shape: const CircleBorder(),
                backgroundColor:Colors.deepPurpleAccent,
            ),

            onPressed: () {},
            child: const Text(
              "START \n WORKOUT",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
      ),
        ),

          Row( //designing nav bar using a row
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:<Widget>[
                Container(
                  child: IconButton(
                    onPressed:(){},
                    icon:Icon(Icons.mail),
                  )
                ),
                Container(
                    child: IconButton(
                      onPressed:(){},
                      icon:Icon(Icons.mail),
                    )
                ),
                Container(
                    child: IconButton(
                      onPressed:(){},
                      icon:Icon(Icons.mail),
                    )
                ),
                Container(
                    child: IconButton(
                      onPressed:(){},
                      icon:Icon(Icons.mail),
                    )
                ),
              ]


          ),

          //ElevatedButton(onPressed: onPressed(){}, child: Text("test")),
    ],

    ), //column
    );
  }
}


