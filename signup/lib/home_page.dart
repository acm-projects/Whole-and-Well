/*
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:signup/goals_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        automaticallyImplyLeading: false,
        title:  Center(child: Text(
            'Home', style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
      ),
      body: Column(children: <Widget>[
        Container(
          width: 10.0,
          height: 20.0,
        ), //Empty container to fill up space
        Center(
          child: CircularPercentIndicator(
              radius: 200,
              lineWidth: 20,
              percent: (.33),
              //Insert the variable here after
              progressColor: Colors.deepPurple[700],
              backgroundColor: Colors.deepPurple.shade100,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text('33%', style: TextStyle(
                fontSize: 50,
                color: Colors.deepPurple[700],)) //Insert variable value here after
          ),
        ),
        Container(
          width: 20,
          height: 80,
        ),
        Container(
          width: 300,
          height: 350,
          color: Colors.grey[300],
        ),
      ],
      ),
    );
  }
}

 */
/*
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:signup/short_goal_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        automaticallyImplyLeading : false,
        title:  Center(child: Text(
            'HOME', style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
      ),
      body: Column(children: <Widget>[
        Container(
          width: 10.0,
          height: 20.0,
        ), //Empty container to fill up space
        Center(
          child: CircularPercentIndicator(
              radius: 200,
              lineWidth: 20,
              percent: (.00),
              //Insert the variable here after
              progressColor: Colors.deepPurple[700],
              backgroundColor: Colors.deepPurple.shade100,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text('0%', style: TextStyle(
                fontSize: 50,
                color: Colors.deepPurple[700],)) //Insert variable value here after
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Text('Current Goals', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.deepPurple[700], ),),
          ),
        ),
        Container(
          width: 300,
          height: 350,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ListView(
            children: <Widget>[
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: const Center(
                        child: Text('Eat breakfast'))
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: const Center(
                        child: Text('Go walking today'))
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: const Center(
                        child: Text('Drink Water'))
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: const Center(
                        child: Text('Take medicine before I sleep'))
                ),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:signup/globalvar.dart' as globals;

void main() =>  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyHomePage(),
),
);

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  dynamic finalscore = globals.score1.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple[700],
        title:  Center(child: Text(
            'Home', style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
      ),
      body: Column(children: <Widget>[
        Container(
          width: 10.0,
          height: 20.0,
        ), //Empty container to fill up space
        Center(
          child: CircularPercentIndicator(
              radius: 200,
              lineWidth: 20,
              percent: (globals.score1/100), //Insert the variable here after
              progressColor: Colors.deepPurple[700],
              backgroundColor: Colors.deepPurple.shade100,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text('$finalscore%',
                  style: TextStyle( //Insert variable value here after
                    fontSize: 50,
                    color: Colors.deepPurple[700],
                  ))
          ),
        ),
        Container(
          height: 100,
          child: Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.bottomCenter,
            child: Text('Current Goals', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.deepPurple[700], ),),
          ),
        ),
      /*  Container(
          /*      margin: const EdgeInsets.only(
                left: 30,
                top: 30,
                right: 30,
                bottom: 0,
              ),
              child: SizedBox(*/
          width: 250,
          height: 250,
          color: Color(0xFFD9D9D9),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: db.journalList.length,
            itemBuilder: (context, index) {
              //   return Text(db.journalList[index][0]);
              return ListTile(
                //     tileColor: Colors.purple,
                leading: Text((index + 1).toString()),
                title: Text(
                  db.journalList[index][0],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                minLeadingWidth : 10,
              );
            },
            //),
          ),
        ),*/
        Container(
          width: 300,
          height: 350,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: globals.goalcount,
            itemBuilder: (context, index) {
              //   return Text(db.journalList[index][0]);
              return ListTile(
                //     tileColor: Colors.purple,
                leading: Text((index + 1).toString()),
                title: Text(
                  globals.goalList[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                minLeadingWidth : 10,
              );
            },
          ),
        ),
        /*
        Container(
          width: 300,
          height: 350,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ListView(
            children: <Widget>[
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: const Center(
                        child: Text('Eat breakfast'))
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: const Center(
                        child: Text('Go walking today'))
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: const Center(
                        child: Text('Drink Water'))
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: const Center(
                        child: Text('Take medicine before I sleep'))
                ),
              ),
            ],
          ),
        ),*/
      ],
      ),
    );
  }
}

 */

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:signup/globalvar.dart' as globals;

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List shortGoals = globals.goalList;
  List longGoals = globals.goalList2;

  dynamic finalscore = globals.score1.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple[700],
        title: Center(
          child:
              Text('Home', style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 10.0,
            height: 20.0,
          ), //Empty container to fill up space
          Center(
            child: CircularPercentIndicator(
                radius: 200,
                lineWidth: 20,
                percent: (globals.score1 / 100),
                //Insert the variable here after
                progressColor: Colors.deepPurple[700],
                backgroundColor: Colors.deepPurple.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text('$finalscore%',
                    style: TextStyle(
                      //Insert variable value here after
                      fontSize: 50,
                      color: Colors.deepPurple[700],
                    ))),
          ),
          Container(
            height: 100,
            child: Container(
              height: 175,
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Current Goals',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[700],
                ),
              ),
            ),
          ),
          /*
        Container(
        /*      margin: const EdgeInsets.only(
                left: 30,
                top: 30,
                right: 30,
                bottom: 0,
              ),
              child: SizedBox(*/
                width: 250,
                height: 250,
                color: Color(0xFFD9D9D9),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: db.journalList.length,
                  itemBuilder: (context, index) {
                    //   return Text(db.journalList[index][0]);
                    return ListTile(
                 //     tileColor: Colors.purple,
                      leading: Text((index + 1).toString()),
                      title: Text(
                          db.journalList[index][0],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      minLeadingWidth : 10,
                    );
                  },
                //),
              ),
            ),
         */
          Container(
            width: 300,
            height: 350,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: globals.goalcount,
              itemBuilder: (context, index) {
                //   return Text(db.journalList[index][0]);
                return ListTile(
                  //     tileColor: Colors.purple,
                  //   leading: Text(''),
                  title: Text(
                    shortGoals[index].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  minLeadingWidth: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
