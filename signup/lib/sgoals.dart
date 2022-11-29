class SGoals {
  String? id;
  String? goalText;
  bool isDone;

  @override toString() => '$goalText';

  SGoals({
    required this.id,
    required this.goalText,
    this.isDone = false,
  });

  static List<SGoals> goalslist() {
    return [
   /*   SGoals(id: '04', goalText: 'Take medicine before I sleep', isDone: false),
      SGoals(id: '01', goalText: 'Drink Water', isDone: false),
      SGoals(id: '03', goalText: 'Walk', isDone: false),
      SGoals(id: '02', goalText: 'Eat breakfast', isDone: false),*/
    ];
  }
}