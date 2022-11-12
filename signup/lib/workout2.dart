/*import 'dart:convert';
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

//String Response = "You are doing great! Keep going!";
//Map mapResponse = Map();

class Workout2 extends StatefulWidget{
  @override
  _Workout2State createState() => _Workout2State();
}

class _Workout2State extends State<Workout2>{

  APIService apiService = APIService();
// You future
   late Future future;
   String response ="";


  @override
  void initState(){
   Future future = apiService.get(/*endpoint:"Motvation", query:{"key1": "value",
     "key2": "value"}*/);
    super.initState();
  }

  @override
  Widget build(BuildContext){
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

              child: Text(response.toString()),

              //Text(future.toString()),
              //child: QuotesWidget()
                //child: Text(mapresponse['key1'].toString())
              // mapResponse ==null? Text("You are doing great! Keep going!"):Text(mapResponse['key1'].toString())
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

class APIService {
  // API key
  static const _api_key = "4352a01714msha3097f2beff700dp19beacjsnd47fb445b4c6";
  // Base API url
  static const String _baseUrl = "https://api.quotable.io/random";
  // Base headers for Response url
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "motivational-quotes1.p.rapidapi.com",
    "x-rapidapi-key": _api_key,
  };

  // Base API request to get response
  Future<dynamic> get({
    required String endpoint,
    //@required
    required Map<String, String> query,
  }) async {
    //Future future;
    Uri uri = Uri.https(_baseUrl, endpoint, query);
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      print("success");
      // If server returns an OK response, parse the JSON.
      return json.decode(response.body);
    } else {
      print("failure");
      // If that response was not OK, throw an error.
      throw Exception('Failed to load json data');
    }
  }
}


/*
class Workout2 extends StatelessWidget {

  Future apicall() async {
    http.Response response;
    response = await http.post(
        Uri.parse("motivational-quotes1.p.rapidapi.com")); //get post or put
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
      });
    }
  }

  @override
  void initState(){
    apicall();
    super.initState();
  }

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
              //child: QuotesWidget()
              child: Text(stringResponse.toString())
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

/*class QuotesWidget extends StatefulWidget {
  const QuotesWidget({super.key});

  @override
  State<QuotesWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<QuotesWidget> {
  /*Future apicall() async {
    http.Response response;
    response = await http.post(
        Uri.parse("motivational-quotes1.p.rapidapi.com")); //get post or put
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
      });
    }
  }

  @override
  void initState(){
    apicall();
    super.initState();
  }
}
  String quote="";
  bool working = false;


  @override
  void initState() {
    super.initState();
    quote = "";
    getQuote();
  }

  // get a random Quote from the API
  Future getQuote() async {
    try {
      setState(() {
        working = true;
        quote = "";
      });
      var response = await http.post(
          Uri.parse('motivational-quotes1.p.rapidapi.com"'),
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
          onTap:  {!working ? getQuote: getQuote()}

          child: Text(
            quote.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
          ),
        ),

      ),
    );
  }
}*/