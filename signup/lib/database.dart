import 'package:hive_flutter/hive_flutter.dart';

class JournalDataBase {
  List journalList = [
  ];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    journalList = [
      ["I worked out and completed my goals today", false],
      ["Hit new PR of 135 lbs", false]
    ];
  }

  void loadData() {
    journalList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", journalList);
  }
}