class Subjects {
  List<Subject> items = new List();

  Subjects();

  Subjects.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList) {
      final timetable = new Subject.fromJson(item);
      items.add(timetable);
    }
  }
}

class Subject {
  int id;
  String name;
  String code;
  String is_active;

  Subject(
      {this.id,
        this.name,
        this.code,
        this.is_active});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    code = json["code"];
    is_active = json["is_active"];
  }
}