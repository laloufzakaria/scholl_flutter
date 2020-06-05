class Classes {
  List<Classe> items = new List();

  Classes();

  Classes.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList) {
      final timetable = new Classe.fromJson(item);
      items.add(timetable);
    }
  }
}

class Classe {
  int id;
  String classe;
  String is_active;

  Classe(
      {this.id,
        this.classe,
        this.is_active});

  Classe.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    classe = json["class"];
    is_active = json["is_active"];
  }
}