import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'workout3.dart';

dynamic response ="{'key1': 'value', 'key2': 'value'}";
dynamic quote ="You are doing great! Keep going!";

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Workout2(),
),
);

class Workout2 extends StatefulWidget{
  @override
  Workout2State createState() => Workout2State();
}

class Workout2State extends State<Workout2> {

  @override
  void initState() {
    getQuote().then((quote) {
      setState(() {
        quote = quote;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF656CCA),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(quote ?? '', textAlign: TextAlign.center, style: const TextStyle(fontSize: 30.0,color: Colors.white)),
            ),
            Container(
              width: 292.0,
              height:85.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Workout3())
                  );//MaterialApp.router() route this to the next page in workout
                }, //color: Colors.white,
                child:const Text(
                  textAlign:TextAlign.center,
                  "END WORKOUT",
                  style: (
                      TextStyle(fontSize: 32, color:Colors.black, fontWeight:FontWeight.bold)
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF05050)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(40.0),
                    ),
                  ),//shape
                ),
              ),
            ),
          ],
        ),
      ),
      //ElevatedButton(onPressed: onPressed(){}, child: Text("test")),
    );
  }
}

Future getQuote() async{
  var url = Uri.https('motivational-quotes1.p.rapidapi.com','motivation');
  response = await http.post(url, headers: {
    'content-type': 'application/json',
    'X-RapidAPI-Key': '4352a01714msha3097f2beff700dp19beacjsnd47fb445b4c6',
    'X-RapidAPI-Host': 'motivational-quotes1.p.rapidapi.com'
  }, body: jsonEncode({'key1': 'value', 'key2': 'value'}));
  if(response.statusCode == 200) {
    quote = response.body;
  }else{
    quote = "null";
  }
  return quote;
}