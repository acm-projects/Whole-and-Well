import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup/sgoals.dart';
import 'package:signup/home_page.dart';


class GoalsItem extends StatelessWidget {
  final SGoals goalw;
  final onGoalsChanged;
  final onDeleteItem;

  const GoalsItem({Key? key, required this.goalw, required this.onGoalsChanged, required this.onDeleteItem, }) : super(key: key);

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
            onGoalsChanged(goalw);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.grey[200],
          leading: Icon(
            goalw.isDone? Icons.check_box : Icons.check_box_outline_blank,
            color: goalw.isDone? Colors.deepPurple[700] : Colors.deepPurple[200],),
          title: Text(goalw.goalText!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: goalw.isDone? TextDecoration.lineThrough : null,),
          ),
          trailing: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(vertical: 6),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.deepPurple[200],
                borderRadius: BorderRadius.circular(5),),
              child: IconButton(
                color: Colors.white,
                //alignment: Alignment.center,
                iconSize: 20,
                icon: Icon(CupertinoIcons.trash),
                onPressed: () {
                  onDeleteItem(goalw.id, goalw);
                },
              )
          ),
        ),
      ),
    );
  }
}