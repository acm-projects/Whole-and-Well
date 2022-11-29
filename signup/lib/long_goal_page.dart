/*
import 'package:flutter/material.dart';
import 'package:signup/lgoals.dart';
import 'package:signup/short_goal_page.dart';
import 'goals_item2.dart';
import 'package:signup/home_page.dart';

class LongGoalsPage extends StatefulWidget {
  LongGoalsPage({Key? key}) : super(key: key);

  @override
  State<LongGoalsPage> createState() => _LongGoalsPageState();
}

class _LongGoalsPageState extends State<LongGoalsPage> {
  final goalList2 = LGoals.goalslist2();
  List<LGoals> _foundGoal2 = [];
  final _goalscontroller = TextEditingController();

  @override
  void initState() {
    _foundGoal2 = goalList2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  //      appBar: buildAppBar(),
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
                              child: const Text('Long Term Goals',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                          ),
                          for (LGoals goal2 in _foundGoal2.reversed)
                            GoalsItem(
                              goalw2: goal2,
                              onGoalsChanged2: _handleGoalsChange,
                              onDeleteItem2: _deleteGoalItem,
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
                        right: 20,
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
  int _checkcount2 = 0;
  int _goalcount2 = 1;

  void _goalcounterup() {
    setState(() {
      _goalcount2++;
    });
  }
  void _goalcounterdown() {
    setState(() {
      _goalcount2--;
    });
  }


  void _handleGoalsChange(LGoals goals) {
    setState(() {
      goals.isDone = !goals.isDone;
      if (goals.isDone == true) {
        _checkcount2++;
      }
      else {
        _checkcount2--;
      }
    });
  }

  void _deleteGoalItem(String id, LGoals goals) {
    setState(() {
      if (goals.isDone == true) {
        _checkcount2--;
      }
      goalList2.removeWhere((item) => item.id == id);
    });
    _goalcounterdown();

  }

  void _addGoalItem(String goal) {
    setState(() {
      goalList2.add(LGoals(id: DateTime.now().millisecondsSinceEpoch.toString(), goalText: goal
      ));
    });
    _goalscontroller.clear();
    _goalcounterup();
  }

  void _runFilter(String enteredKeyword) {
    List<LGoals> results = [];
    if (enteredKeyword.isEmpty) {
      results = goalList2;
    } else {
      results = goalList2.where((item) => item.goalText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundGoal2 = results;
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
import 'package:signup/lgoals.dart';
import 'package:signup/short_goal_page.dart';
import 'goals_item2.dart';
import 'package:signup/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class LongGoalsPage extends StatefulWidget {
  LongGoalsPage({Key? key}) : super(key: key);

  @override
  State<LongGoalsPage> createState() => _LongGoalsPageState();
}

class _LongGoalsPageState extends State<LongGoalsPage> {
  final goalList2 = LGoals.goalslist2();
  List<LGoals> _foundGoal2 = [];
  final _goalscontroller = TextEditingController();

  @override
  void initState() {
    _foundGoal2 = goalList2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //      appBar: buildAppBar(),
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
                              child: const Text('Long Term Goals',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                          ),
                          for (LGoals goal2 in _foundGoal2.reversed)
                            GoalsItem(
                              goalw2: goal2,
                              onGoalsChanged2: _handleGoalsChange,
                              onDeleteItem2: _deleteGoalItem,
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
                        right: 20,
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
  int _checkcount2 = 0;
  int _goalcount2 = 1;

  void _goalcounterup() {
    setState(() {
      _goalcount2++;
    });
  }
  void _goalcounterdown() {
    setState(() {
      _goalcount2--;
    });
  }


  void _handleGoalsChange(LGoals goals) {
    setState(() {
      goals.isDone = !goals.isDone;
      if (goals.isDone == true) {
        _checkcount2++;
      }
      else {
        _checkcount2--;
      }
    });
  }

  void _deleteGoalItem(String id, LGoals goals) {
    setState(() {
      if (goals.isDone == true) {
        _checkcount2--;
      }
      goalList2.removeWhere((item) => item.id == id);
    });
    _goalcounterdown();

  }

  Future<void> _addGoalItem(String goal) async {
    setState(() {
      goalList2.add(LGoals(id: DateTime.now().millisecondsSinceEpoch.toString(), goalText: goal
      ));
    });
    _goalscontroller.clear();
    _goalcounterup();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // Map<String, dynamic> data  = {"goal": "dummy"};
    // Firestore.instance.collection("dailygoals").add(goal);
    final entry = FirebaseFirestore.instance.collection("longtermGoals").doc(goal.toString());
    final json = {
      'goal' : goal.toString()
    };
    await entry.set(json);
  }

  void _runFilter(String enteredKeyword) {
    List<LGoals> results = [];
    if (enteredKeyword.isEmpty) {
      results = goalList2;
    } else {
      results = goalList2.where((item) => item.goalText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundGoal2 = results;
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