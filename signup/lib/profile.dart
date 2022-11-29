import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'main_page.dart';
import 'login_page.dart';
import 'viewhistory.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Profile(),
),
);


class Profile extends StatefulWidget{
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Stack(
        children: [
          Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Icon(Icons.circle, size: 200,),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Container(child:
                  const Text("Welcome Back User!")
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  //alignment: FractionalOffset.bottomCenter,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      //height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: Color(0xFFA2A3BB),
                              ),
                            )
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            String url = "http://www.wholeandwell.com/";
                            var urllaunchable = await canLaunchUrlString(url);
                            if(urllaunchable){
                              await launchUrlString(url);
                            }else{
                              print("URL cannot be launched");
                            }
                          },
                          child:  const Text(
                            "Resources/Help",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF615FC8)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      //height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: Color(0xFFA2A3BB),
                              ),
                            )
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ViewHistory())
                            );
                            //MaterialApp.router() route this to the next page (Make a default screen that says Whole and Well that takes you to sign in page
                          },
                          child: const Text(
                            "View History",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF615FC8)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: SizedBox(
              height: 50,
              // height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9395D3),
                ),
                onPressed: () {

                  // _signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainPage())
                  );
                },

                child: const Text(
                  "LOG OUT",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color:Color(0xFF000000)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}