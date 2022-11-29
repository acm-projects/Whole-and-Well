/*
import 'package:flutter/material.dart';
import 'workout1.dart';
import 'notes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:signup/database.dart';
import 'package:signup/dialog_box.dart';
//import 'package:signup/workout.dart';
import 'journal_tile.dart';
//import 'main.dart';
import 'package:hive/hive.dart';
/*
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Workout(),
),
);
*/
void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();

  dynamic box = await Hive.openBox('mybox');
  // await Hive.openBox('mybox');

  // runApp(const MyApp());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Workout(),
  ),
  );
}

class Workout extends StatelessWidget {

  void deleteTask(int index) {
  /*  setState(() {
      db.journalList.removeAt(index);
    });
    db.updateDataBase();*/
  }

  @override

 // List journals = JournalDataBase().journalList;
  List journals = JournalDataBase().journalList;
  JournalDataBase db = JournalDataBase();


  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 250),
                  shape: const CircleBorder(),
                  backgroundColor:Colors.deepPurple[700],
                ),

                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Workout1())
                  );
                  //MaterialApp.router() route this to the next page in workout
                },
                child: const Text(
                  "BEGIN \n WORKOUT",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),

//route a new button to the notes page -->
            Container(
              margin: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: 250,
                height: 150,
                child: ButtonTheme(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NotesPage())
                    );},

                    child: Text(
                        "Add Journal Entry",
                    ),
                   // child: Text(journals.last),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.grey,
                        padding: const EdgeInsets.all(20.0),
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ),
              ),
            ),
/*
            Container(
              child: journals.length == 0
                  ? Text(
                  "No Records Found",
                style: TextStyle(color: Colors.black),
              )
             /*     : ListView.builder(
                  itemCount: journals?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return journals[index];
                  }),*/
              : Text(journals[journals.length - 1], style: TextStyle(color: Colors.black),)

            ),*/
            Flexible(
              child: ListView.builder(
         //       shrinkWrap: true,
            //    itemCount: db.journalList.length,
                itemCount: 3,
                itemBuilder: (context, index) {
                     return Text(db.journalList[index][0]);
              /*    return ListTile(
                    title: Text(db.journalList[index][0]),
                  );*/
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
*/


import 'package:flutter/material.dart';
import 'workout1.dart';
import 'notes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:signup/database.dart';
import 'package:signup/dialog_box.dart';
//import 'package:signup/workout.dart';
import 'journal_tile.dart';
//import 'main.dart';
import 'package:hive/hive.dart';
/*
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Workout(),
),
);
*/
void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();

  dynamic box = await Hive.openBox('mybox');
  // await Hive.openBox('mybox');

  // runApp(const MyApp());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Workout(),
  ),
  );
}

/*
class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _myBox = Hive.box('mybox');
  JournalDataBase db = JournalDataBase();
*/

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  final _myBox = Hive.box('mybox');
  JournalDataBase db = JournalDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.journalList[index][1] = !db.journalList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      db.journalList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.journalList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 250),
                  shape: const CircleBorder(),
                  backgroundColor:Colors.deepPurple[700],
                ),

                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Workout1())
                  );
                  //MaterialApp.router() route this to the next page in workout
                },
                child: const Text(
                  "BEGIN \n WORKOUT",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),

//route a new button to the notes page -->
         /*   Container(
              margin: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: 250,
                height: 150,
                child: ButtonTheme(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NotesPage())
                    );},

                    child: Text(
                      "Add Journal Entry",
                    ),
                    // child: Text(journals.last),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.grey,
                        padding: const EdgeInsets.all(20.0),
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ),
              ),
            ),*/
/*
            Container(
              child: journals.length == 0
                  ? Text(
                  "No Records Found",
                style: TextStyle(color: Colors.black),
              )
             /*     : ListView.builder(
                  itemCount: journals?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return journals[index];
                  }),*/
              : Text(journals[journals.length - 1], style: TextStyle(color: Colors.black),)

            ),*/
           /* Flexible(
              child: Center(
              child: ListView.builder(
                       shrinkWrap: true,
                    itemCount: db.journalList.length,
                itemBuilder: (context, index) {
               //   return Text(db.journalList[index][0]);
                      return ListTile(
                    title: Text(db.journalList[index][0]),
                  );
                },
              ),
              ),
            ),*/

        //    Container(
        //      margin: const EdgeInsets.all(50.0),
            Container(
              child: SizedBox(
                height: 50,
                child: const DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.white
                  ),
                ),
              ),
            ),

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

            Container(
            //  margin: const EdgeInsets.all(30.0),
              margin: const EdgeInsets.only(
                left: 30,
                top: 0,
                right: 30,
                bottom: 30,
              ),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ButtonTheme(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NotesPage())
                    );},

                    child: Text(
                      "+ Add Journal Entry",
                    ),
                    // child: Text(journals.last),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.grey,
                        padding: const EdgeInsets.all(10.0),
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
