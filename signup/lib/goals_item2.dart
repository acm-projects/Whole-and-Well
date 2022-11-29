import 'package:flutter/material.dart';
import 'package:signup/lgoals.dart';
import 'package:flutter/cupertino.dart';


class GoalsItem extends StatelessWidget {
  final LGoals goalw2;
  final onGoalsChanged2;
  final onDeleteItem2;

  const GoalsItem({Key? key, required this.goalw2, required this.onGoalsChanged2, required this.onDeleteItem2, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[200],
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),),
        margin: EdgeInsets.all(5),
        child: ListTile(
          onTap: () {
            onGoalsChanged2(goalw2);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.grey[200],
          leading: Icon(
            goalw2.isDone? Icons.check_box : Icons.check_box_outline_blank,
            color: goalw2.isDone? Colors.deepPurple[700] : Colors.deepPurple[200],),
          title: Text(goalw2.goalText!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: goalw2.isDone? TextDecoration.lineThrough : null,),
          ),
          trailing: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(vertical: 12),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.deepPurple[200],
                borderRadius: BorderRadius.circular(5),),
              child: IconButton(
                color: Colors.white,
                iconSize: 18,
                icon: Icon(CupertinoIcons.trash),
                onPressed: () {
                  onDeleteItem2(goalw2.id, goalw2);
                },
              )
          ),
        ),
      ),
    );
  }
}