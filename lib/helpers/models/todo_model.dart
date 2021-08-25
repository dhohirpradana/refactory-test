class TodoModel {
  final int id;
  final int uid;
  final String title;
  final String timeStart;
  final String timeEnd;
  final int isComplete;

  TodoModel(this.id, this.uid, this.title, this.timeStart, this.timeEnd,
      this.isComplete);

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "id": id,
      "uid": uid,
      "title": title,
      "start": timeStart,
      "end": timeStart,
      "is_complete": isComplete,
    };
  }
}
