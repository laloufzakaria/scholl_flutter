class Timetables {
  List<Timetable> items = new List();

  Timetables();

  Timetables.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList) {
      final timetable = new Timetable.fromJson(item);
      items.add(timetable);
    }
  }
}

class Timetable {
  int id;
  int teacher_subject_id;
  String day_no;
  String day_name;
  String start_time;
  String end_time;
  String room_no;
  String is_active;

  Timetable(
      {this.id,
        this.teacher_subject_id,
        this.day_no,
        this.day_name,
        this.start_time,
        this.end_time,
        this.room_no,
        this.is_active});

  Timetable.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    teacher_subject_id = json["teacher_subject_id"];
    day_no = json["day_no"];
    day_name = json["day_name"];
    start_time = json["start_time"];
    end_time = json["end_time"];
    room_no = json["room_no"];
    is_active = json["is_active"];
  }
}