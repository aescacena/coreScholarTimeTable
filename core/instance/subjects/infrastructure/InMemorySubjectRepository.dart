import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import '../domain/Subject.dart';
import '../domain/SubjectId.dart';
import '../domain/SubjectRepository.dart';

class InMemorySubjectRepository extends SubjectRepository{
  Map<String, Subject> _departments = new Map();

  InMemorySubjectRepository._(this._departments);

  static empty(){
    return InMemorySubjectRepository._(new Map());
  }

  static create(List<Subject> subjects){
    Map<String, Subject> sujectsMap = new Map();
    for(var subject in subjects){
      sujectsMap.putIfAbsent(subject.id.value, () => subject);
    }
    return InMemorySubjectRepository._(sujectsMap);
  }

  static fromFile(File file){
    Map<String, Subject> subjects = new Map();
    String content = file.readAsStringSync();
    Map<String, dynamic> jsonData = jsonDecode(content);
    if(jsonData.containsKey("subjects")){
      List<dynamic> subjectsData = jsonData["subjects"];
      for(var subjectData in subjectsData){
        var subject = Subject.fromPrimitive(subjectData);
        subjects.putIfAbsent(subject.id.value, () => subject);
      }
    }
    return InMemorySubjectRepository._(subjects);
  }

  @override
  void delete(SubjectId id) {
    _departments.remove(id.value);
  }

  @override
  void save(Subject subject) {
    _departments.putIfAbsent(subject.id.value, () => subject);
  }

  @override
  List<Subject> searchAll() {
    return List<Subject>.from(_departments.values);
  }

  @override
  Subject? findById(SubjectId id) {
    return _departments.containsKey(id.value) ? _departments[id.value] : null;
  }
}