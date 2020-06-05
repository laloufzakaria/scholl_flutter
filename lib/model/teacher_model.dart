class Teachers {
  List<Teacher> items = new List();

  Teachers();

  Teachers.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList) {
      final timetable = new Teacher.fromJson(item);
      items.add(timetable);
    }
  }
}

class Teacher {
  int id;
  String firstname;
  String lastname;
  String is_active;

  Teacher(
      {this.id,
        this.firstname,
        this.lastname,
        this.is_active});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstname = json["firstname"];
    lastname = json["lastname"];
    is_active = json["is_active"];
  }
}