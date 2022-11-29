/*
import 'package:flutter/material.dart';
import 'package:signup/sgoals.dart';
import 'package:signup/home_page.dart';
import 'package:signup/goals_item.dart';
import 'package:signup/globalvar.dart' as globals;


void main() => runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ShortGoalsPage(),
),
);

class ShortGoalsPage extends StatefulWidget {
  ShortGoalsPage({Key? key}) : super(key: key);

  @override
  State<ShortGoalsPage> createState() => _ShortGoalsPageState();
}

class _ShortGoalsPageState extends State<ShortGoalsPage> {

  final _goalscontroller = TextEditingController();

  @override
  void initState() {
    globals.foundGoals = globals.goalList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       /* appBar: AppBar(
          backgroundColor: Colors.deepPurple[700],
          centerTitle:true,
          title: Text('Goals',
            style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'Inter',
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF000000)),
            onPressed: () { Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyHomePage())
            ); },),
        ),*/
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    searchBox(),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 50, bottom: 20),
                              child: const Text('Daily Goals',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                          ),
                          for (SGoals goal in globals.foundGoals.reversed)
                            GoalsItem(
                              goalw: goal,
                              onGoalsChanged: _handleGoalsChange,
                              onDeleteItem: _deleteGoalItem,
                            ), //goalw = goal widget in the goals_items.dart
                        ],
                      ),
                    )
                  ],
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          left: 10,
                        ),
                        child: ElevatedButton(
                            child: Icon(Icons.autorenew, size: 30),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  '/lgoals');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple[700],
                                minimumSize: Size(60, 60),
                                elevation: 10))),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const[
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                            controller: _goalscontroller,
                            decoration: InputDecoration(
                                hintText: 'Add a new goal',
                                border: InputBorder.none
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 10,
                      ),
                      child: ElevatedButton(
                        child: Text('+', style: TextStyle(fontSize: 40),),
                        onPressed: () {
                          _addGoalItem(_goalscontroller.text);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple[700],
                            minimumSize: Size(60, 60),
                            elevation: 10
                        ),
                      ),
                    )
                  ]),
            ),
          ],
        )
    );
  }

  void _handleGoalsChange(SGoals goals) {
    setState(() {
      goals.isDone = !goals.isDone;
      if (goals.isDone == true) {
        globals.checkcount++;
      }
      else {
        globals.checkcount--;
      }
      _score();
    });
  }

  void _deleteGoalItem(String id, SGoals goals) {
    setState(() {
      if (goals.isDone == true) {
        globals.checkcount--;
      }
      globals.goalList.removeWhere((item) => item.id == id);
    });
    globals.goalcount--;
    _score();
  }

  void _addGoalItem(String goal) {
    setState(() {
      globals.goalList.add(SGoals(id: DateTime
          .now()
          .millisecondsSinceEpoch
          .toString(), goalText: goal
      ));
    });
    _goalscontroller.clear();
    globals.goalcount++;
    _score();
  }

  void _score() {
    setState(() {
      globals.score1 = (100 * (globals.checkcount / globals.goalcount)).round();
    });
    return (globals.score1);
  }

  void _runFilter(String enteredKeyword) {
    List<SGoals> results = [];
    List<SGoals> tempGoalList = [];
    tempGoalList = globals.goalList;
    if (enteredKeyword.isEmpty) {
      results = globals.goalList;
    } else {
      results = tempGoalList.where((item) =>
          item.goalText!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }


    setState(() {
      globals.foundGoals = results;
    });
  }


  Container searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey)
        ),
      ),
    );
  }
}

 */
/*
import 'package:flutter/material.dart';
import 'package:signup/long_goal_page.dart';
import 'package:signup/sgoals.dart';
import 'package:signup/lgoals.dart';
import 'package:signup/home_page.dart';
import 'goals_item.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



class ShortGoalsPage extends StatefulWidget {
  ShortGoalsPage({Key? key}) : super(key: key);

  @override
  State<ShortGoalsPage> createState() => _ShortGoalsPageState();
}

class _ShortGoalsPageState extends State<ShortGoalsPage> {
  final goalList = SGoals.goalslist();
  List<SGoals> _foundGoal = [];
  final _goalscontroller = TextEditingController();

  @override
  void initState() {
    _foundGoal = goalList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     appBar: buildAppBar(),
        body: Stack(
          children: [
            Container(
              //color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    searchBox(),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 50, bottom: 20),
                              child: const Text('Daily Goals',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                          ),
                          for ( SGoals goal in _foundGoal.reversed)
                            GoalsItem(
                              goalw: goal,
                              onGoalsChanged: _handleGoalsChange,
                              onDeleteItem: _deleteGoalItem,
                            ), //goalw = goal widget in the goals_items.dart
                        ],
                      ),
                    )
                  ],
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const[
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                            ),],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                            controller: _goalscontroller,
                            decoration: InputDecoration(
                                hintText: 'Add a new goal',
                                border: InputBorder.none
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 10,
                      ),
                      child: ElevatedButton(
                        child: Text('+', style: TextStyle(fontSize: 40),),
                        onPressed: () {
                          _addGoalItem(_goalscontroller.text);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple[700],
                            minimumSize: Size(60, 60),
                            elevation: 10
                        ),
                      ),
                    )
                  ]),
            ),
          ],
        )
    );
  }
  int _checkcount = 0;
  int _goalcount = 4;
  int _score1 = 0;

  void _goalcounterup() {
    setState(() {
      _goalcount++;
    });
  }
  void _goalcounterdown() {
    setState(() {
      _goalcount--;
    });
  }


  void _handleGoalsChange(SGoals goals) {
    setState(() {
      goals.isDone = !goals.isDone;
      if (goals.isDone == true) {
        _checkcount++;
      }
      else {
        _checkcount--;
      }
      _score();
    });
  }

  void _deleteGoalItem(String id, SGoals goals) {
    setState(() {
      if (goals.isDone == true) {
        _checkcount--;
      }
      goalList.removeWhere((item) => item.id == id);
    });
    _goalcounterdown();
    _score();

  }

  Future<void> _addGoalItem(String goal) async {
    print(goal);
    setState(() {
      goalList.add(SGoals(id: DateTime
          .now()
          .millisecondsSinceEpoch
          .toString(), goalText: goal
      ));
    });
    _goalscontroller.clear();
    _goalcounterup();
    _score();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // Map<String, dynamic> data  = {"goal": "dummy"};
    // Firestore.instance.collection("dailygoals").add(goal);
    final entry = FirebaseFirestore.instance.collection("dailygoals").doc(goal.toString());
    final json = {
      'goal' : goal.toString()
    };
    await entry.set(json);

  }


  // DatabaseReference ref = FirebaseDatabase.instance.ref("dailygoals/123");
  // await ref.set({
  //   "goal": goal
  //
  // });



  int _score() {
    setState(() {
      _score1 = (100 * (_checkcount/_goalcount)).round();
    });
    return(_score1);
  }

  void _runFilter(String enteredKeyword) {
    List<SGoals> results = [];
    if (enteredKeyword.isEmpty) {
      results = goalList;
    } else {
      results = goalList.where((item) => item.goalText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundGoal = results;
    });
  }


  Container searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged:  (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey)
        ),
      ),
    );
  }
//  AppBar buildAppBar() => AppBar(backgroundColor: Colors.deepPurple[700], title: Center(child: Text('Goals', style: TextStyle(color: Colors.white, fontSize: 30)),),);
}

 */
import 'package:flutter/material.dart';
import 'package:signup/long_goal_page.dart';
import 'package:signup/sgoals.dart';
import 'package:signup/lgoals.dart';
import 'package:signup/home_page.dart';
import 'goals_item.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signup/globalvar.dart' as globals;

void main() => runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ShortGoalsPage(),
),
);

class ShortGoalsPage extends StatefulWidget {
  ShortGoalsPage({Key? key}) : super(key: key);

  @override
  State<ShortGoalsPage> createState() => _ShortGoalsPageState();
}

class _ShortGoalsPageState extends State<ShortGoalsPage> {

  final _goalscontroller = TextEditingController();

  @override
  void initState() {
    globals.foundGoals = globals.goalList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    searchBox(),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 50, bottom: 20),
                              child: const Text('Daily Goals',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                          ),
                          for (SGoals goal in globals.foundGoals.reversed)
                            GoalsItem(
                              goalw: goal,
                              onGoalsChanged: _handleGoalsChange,
                              onDeleteItem: _deleteGoalItem,
                            ), //goalw = goal widget in the goals_items.dart
                        ],
                      ),
                    )
                  ],
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                  children: [
                  /*  Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          left: 10,
                        ),
                        child: ElevatedButton(
                            child: Icon(Icons.autorenew, size: 30),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  '/lgoals');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple[700],
                                minimumSize: Size(60, 60),
                                elevation: 10))),*/
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const[
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                            controller: _goalscontroller,
                            decoration: InputDecoration(
                                hintText: 'Add a new goal',
                                border: InputBorder.none
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 10,
                      ),
                      child: ElevatedButton(
                        child: Text('+', style: TextStyle(fontSize: 40),),
                        onPressed: () {
                          _addGoalItem(_goalscontroller.text);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple[700],
                            minimumSize: Size(60, 60),
                            elevation: 10
                        ),
                      ),
                    )
                  ]),
            ),
          ],
        )
    );
  }

  void _handleGoalsChange(SGoals goals) {
    setState(() {
      goals.isDone = !goals.isDone;
      if (goals.isDone == true) {
        globals.checkcount++;
      }
      else {
        globals.checkcount--;
      }
      _score();
    });
  }

  void _deleteGoalItem(String id, SGoals goals) {
    setState(() {
      if (goals.isDone == true) {
        globals.checkcount--;
      }
      globals.goalList.removeWhere((item) => item.id == id);
    });
    globals.goalcount--;
    _score();
  }

  void _addGoalItem(String goal) {
    setState(() {
      globals.goalList.add(SGoals(id: DateTime
          .now()
          .millisecondsSinceEpoch
          .toString(), goalText: goal
      ));
    });
    _goalscontroller.clear();
    globals.goalcount++;
    _score();
  }

  void _score() {
    setState(() {
      globals.score1 = (100 * (globals.checkcount / globals.goalcount)).round();
    });
    return (globals.score1);
  }

  void _runFilter(String enteredKeyword) {
    List<SGoals> results = [];
    List<SGoals> tempGoalList = [];
    tempGoalList = globals.goalList;
    if (enteredKeyword.isEmpty) {
      results = globals.goalList;
    } else {
      results = tempGoalList.where((item) =>
          item.goalText!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }


    setState(() {
      globals.foundGoals = results;
    });
  }


  Container searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey)
        ),
      ),
    );
  }
}