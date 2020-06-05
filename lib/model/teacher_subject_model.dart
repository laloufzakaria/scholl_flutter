class Teacher_subjects {
  List<Teacher_subject> items = new List();

  Teacher_subjects();

  Teacher_subjects.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList) {
      final timetable = new Teacher_subject.fromJson(item);
      items.add(timetable);
    }
  }
}

class Teacher_subject {
  int id;
  int session_id;
  int class_id;
  int subject_id;
  int teacher_id;
  String description;
  String is_active;

  Teacher_subject(
      {this.id,
        this.session_id,
        this.class_id,
        this.subject_id,
        this.teacher_id,
        this.description,
        this.is_active});

  Teacher_subject.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    session_id = json["session_id"];
    class_id = json["class_id"];
    subject_id = json["subject_id"];
    teacher_id = json["teacher_id"];
    description = json["description"];
    is_active = json["is_active"];
  }
}