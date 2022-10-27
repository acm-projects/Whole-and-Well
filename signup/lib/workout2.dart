import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'workout3.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Workout2(),
  ),
  );
}

class Workout2 extends StatelessWidget {
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
              child: QuotesWidget()
            ),
            SizedBox(
              width: 200.0,
              height:85.0,


              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Workout3())
                  );
                  //MaterialApp.router() route this to the next page in workout
                },
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



//class for API:

class QuotesWidget extends StatefulWidget {
  const QuotesWidget({super.key});

  @override
  State<QuotesWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<QuotesWidget> {
  String quote="";
  bool working = false;


  @override
  void initState() {
    super.initState();
    quote = "";
    getQuote();
  }

  // get a random Quote from the API
  getQuote() async {
    try {
      setState(() {
        working = true;
        quote = "";
      });
      var response = await http.post(
          Uri.parse('https://rapidapi.com'),
          body: {"method": "getQuote", "format": "json", "lang": "en"}
          );
      setState(() {
        try {
          var res = jsonDecode(response.body);
          quote = res["quoteText"];//.replaceAll("â", " ");
        } catch (e) {
          getQuote();
        }
      });
    } catch (e) {
      offline();
    }
  }

  // if it is offline, show a fixed Quote
  offline() {
    setState(() {
      quote = "Keep going! You are doing great!";
      working = false;
    });

  }

  // Main build function
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment:Alignment.center,
        child: InkWell(
          onTap: !working ? getQuote: null,

          child: Text(
            quote,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
          ),
        ),

      ),
    );
  }
}




