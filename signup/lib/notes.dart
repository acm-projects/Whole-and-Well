import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:signup/database.dart';
import 'package:signup/dialog_box.dart';
import 'package:signup/workout.dart';
import 'journal_tile.dart';
import 'main.dart';
import 'package:hive/hive.dart';

/*
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NotesPage(),
  ),
  );
}
*/

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NotesPage(),
  ),
  );
}

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
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
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Journal'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.journalList.length,
        itemBuilder: (context, index) {
          return JournalTile(
            taskName: db.journalList[index][0],
        //    taskCompleted: db.journalList[index][1],
        //    onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
