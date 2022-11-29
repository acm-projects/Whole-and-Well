import 'package:flutter/material.dart';
import 'package:signup/long_goal_page.dart';
import 'package:signup/short_goal_page.dart';

class MainGoalPage extends StatelessWidget {
  const MainGoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[700],
          automaticallyImplyLeading : false,
          title:  Center(child: Text(
              'GOALS', style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              labelColor: Colors.deepPurple[700],
              indicatorColor: Colors.deepPurple[700],
              tabs: [
                Tab(
                  text: 'DAILY',
                ),
                Tab(
                  text: 'LONG TERM',
                ),
              ],
            ),

            Expanded(
              child: TabBarView(children: [
                ShortGoalsPage(),
                LongGoalsPage(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
