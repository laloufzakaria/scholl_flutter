class Sessions {
  List<Session> items = new List();

  Sessions();

  Sessions.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList) {
      final timetable = new Session.fromJson(item);
      items.add(timetable);
    }
  }
}

class Session {
  int id;
  String session;
  String is_active;

  Session(
      {this.id,
        this.session,
        this.is_active});

  Session.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    session = json["session"];
    is_active = json["is_active"];
  }
}