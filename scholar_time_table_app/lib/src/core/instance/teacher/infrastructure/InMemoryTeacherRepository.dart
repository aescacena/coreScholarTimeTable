import 'dart:convert';

import '../domain/Teacher.dart';
import '../domain/TeacherRepository.dart';
import 'dart:io';

class InMemoryTeacherRepository extends TeacherRepository{
  Map<String, Teacher> _teachers = new Map();


  InMemoryTeacherRepository._(this._teachers);

  static create(List<Teacher> teachers){
    Map<String, Teacher> teachersMap = new Map();
    for(var teacher in teachers){
      teachersMap.putIfAbsent(teacher.id, () => teacher);
    }
    return InMemoryTeacherRepository._(teachersMap);
  }
  static empty(){
    return InMemoryTeacherRepository._(new Map());
  }

  static fromFile(File file){
    Map<String, Teacher> teachers = new Map();
    String content = file.readAsStringSync();
    Map<String, dynamic> jsonData = jsonDecode(content);
    if(jsonData.containsKey("teachers")){
      List<dynamic> teachersData = jsonData["teachers"];
      for(var teacherDate in teachersData){
        var teacher = Teacher.fromPrimitive(teacherDate);
        teachers.putIfAbsent(teacher.id, () => teacher);
      }
    }
    return InMemoryTeacherRepository._(teachers);
  }

  @override
  void delete(String id) {
    _teachers.remove(id);
  }

  @override
  void save(Teacher teacher) {
    _teachers.putIfAbsent(teacher.id, () => teacher);
  }

  @override
  List<Teacher> searchAll() {
    return List<Teacher>.from(_teachers.values);
  }

  @override
  Teacher? findById(String id) {
    return _teachers.containsKey(id) ? _teachers[id] : null;
  }
}