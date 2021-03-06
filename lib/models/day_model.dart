class Day {
  String id;
  DateTime date;
  bool socialDistance;
  List<String> feelings;
  List<String> activities;
  String note;

  Day({this.id, this.date, this.socialDistance, this.feelings,this.activities,this.note});

  Day.fromMap(Map snapshot,String id) :
        id = id ?? '',
        date = snapshot['date'] ?? '', //TODO check how to put it in the correct timezone
        socialDistance = snapshot['socialDistance'] ?? '',
        feelings = snapshot['feelings'] ?? [''],
        activities = snapshot['activities'] ?? [''],
        note = snapshot['note'] ?? '';

  toJson() {
    return {
      "date": date.toUtc(),
      "socialDistance": socialDistance,
      "feelings": feelings,
      "activities": activities,
      "note": note
    };
  }


}