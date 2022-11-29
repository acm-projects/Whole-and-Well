class LGoals {
  String? id;
  String? goalText;
  bool isDone;

  @override toString() => '$goalText';

  LGoals(
      {
        required this.id,
        required this.goalText,
        this.isDone = false,
      }
  );

  static List<LGoals> goalslist2() {
    return [
      LGoals(id: '01', goalText: 'Walk three miles a day', isDone: false),
    ];
  }
}