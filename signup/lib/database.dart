import 'package:hive_flutter/hive_flutter.dart';

class JournalDataBase {
  List journalList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    journalList = [
//      ["Make Tutorial", false],
 //     ["Do Exercise", false],
    ];
  }

  void loadData() {
    journalList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", journalList);
  }
}