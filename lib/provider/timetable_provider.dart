import 'dart:async';
import 'dart:convert';

import 'package:emploi/model/classe_model.dart';
import 'package:emploi/model/session_model.dart';
import 'package:emploi/model/subject_model.dart';
import 'package:emploi/model/teacher_model.dart';
import 'package:emploi/model/teacher_subject_model.dart';
import 'package:http/http.dart' as http;
import 'package:emploi/helper/api.dart';
import 'package:emploi/model/timetable_model.dart';

class TimetablesProvider {

  String _url = Api.domain;
  bool _loading = false;
  int _currentPage = 1;
  int _pages = 1;
  List<Timetable> _timetable = List();
  final _timetableStream = StreamController<List<Timetable>>();

  Function(List<Timetable>) get timetableSink => _timetableStream.sink.add;
  Stream<List<Timetable>> get timetableStream => _timetableStream.stream;

  void dispose() {
    _timetableStream?.close();
  }
  
  Future<bool> index() async {
    try {
      if (_currentPage <= _pages) {
        _loading = !_loading;
        final resp = await http.get(_url + Api.timetable+ '?page=$_currentPage');

        if (resp.statusCode != 200) {
          _timetableStream.addError('Failed to load');
          throw Exception('Failed to load');
        }

        final data = json.decode(resp.body);
        final movies = Timetables.fromJsonList(data['data']);
        _pages = data['last_page'];
        _currentPage++;


        _timetable.addAll(movies.items);
        timetableSink(_timetable);
        _loading = !_loading;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _timetableStream.addError('Failed to load');
      throw Exception('Failed to load');
    }
  }

  Future<List<Teacher_subject>> Teacher_sub(String id) async {
    try {
      final resp = await http.get(_url + Api.teacher_subject + id);

      if (resp.statusCode != 200) {
        throw Exception('Failed to load');
      }

      final data = json.decode(resp.body);

      final teacher_subject = Teacher_subjects.fromJsonList(data);

      return teacher_subject.items;
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future<List<Session>> sessions(String id) async {
    try {
      final resp = await http.get(_url + Api.session + id);

      if (resp.statusCode != 200) {
        throw Exception('Failed to load');
      }

      final data = json.decode(resp.body);

      final session = Sessions.fromJsonList(data);

      return session.items;
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future<List<Classe>> classe(String id) async {
    try {
      final resp = await http.get(_url + Api.classe + id);

      if (resp.statusCode != 200) {
        throw Exception('Failed to load');
      }

      final data = json.decode(resp.body);

      final classe = Classes.fromJsonList(data);

      return classe.items;
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future<List<Subject>> subject(String id) async {
    try {
      final resp = await http.get(_url + Api.subject + id);

      if (resp.statusCode != 200) {
        throw Exception('Failed to load');
      }

      final data = json.decode(resp.body);

      final subject = Subjects.fromJsonList(data);

      return subject.items;
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

  Future<List<Teacher>> teacher(String id) async {
    try {
      final resp = await http.get(_url + Api.teacher + id);

      if (resp.statusCode != 200) {
        throw Exception('Failed to load');
      }

      final data = json.decode(resp.body);

      final teacher = Teachers.fromJsonList(data);

      return teacher.items;
    } catch (e) {
      throw Exception('Failed to load');
    }
  }

}