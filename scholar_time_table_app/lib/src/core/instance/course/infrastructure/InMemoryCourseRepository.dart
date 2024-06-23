
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/Course.dart';
import '../../../../../src/core/instance/course/domain/CourseRepository.dart';
import '../../../../../src/core/instance/course/domain/CourseSubject.dart';

class InMemoryCourseRepository extends CourseRepository{
  Map<String, Course> _courses = new Map();
  
  InMemoryCourseRepository._(this._courses);

  static empty(){
    return InMemoryCourseRepository._(new Map());
  }
  
  static create(List<Course> courses){
    Map<String, Course> coursesMap = new Map();
    for(var course in courses){
      coursesMap.putIfAbsent(course.id, () => course);
    }
    return InMemoryCourseRepository._(coursesMap);
  }

  static InMemoryCourseRepository fromMemory(File file) {
    Map<String, Course> coursesMap = new Map();
    String content = file.readAsStringSync();
    Map<String, dynamic> jsonData = jsonDecode(content);
    if(jsonData.containsKey("courses")){
      List<dynamic> coursesData = jsonData["courses"];
      for(var courseData in coursesData){
        List<dynamic> subCourses = courseData["courses"];
        for(var subCourse in subCourses){
          List<CourseSubject> subjects = [];
          List<dynamic> subjectsData = subCourse["subjects"];
          for(var subjectData in subjectsData){
            subjects.add(CourseSubject.create(subjectData["subjectId"], subjectData["duration"]));
          }
          var course = Course.create(subCourse["id"], subCourse["name"], subjects);
          coursesMap.putIfAbsent(course.id, () => course);
        }
      }
    }
    return InMemoryCourseRepository._(coursesMap);
  }

  static fromFile(File file){
    Map<String, Course> coursesMap = new Map();
    String content = file.readAsStringSync();
    Map<String, dynamic> jsonData = jsonDecode(content);
    if(jsonData.containsKey("courses")){
      List<dynamic> coursesData = jsonData["courses"];
      for(var courseData in coursesData){
        List<dynamic> subCourses = courseData["courses"];
        for(var subCourse in subCourses){
          List<CourseSubject> subjects = [];
          List<dynamic> subjectsData = subCourse["subjects"];
          for(var subjectData in subjectsData){
            subjects.add(CourseSubject.create(subjectData["subjectId"], subjectData["duration"]));
          }
          var course = Course.create(subCourse["id"], subCourse["name"], subjects);
          coursesMap.putIfAbsent(course.id, () => course);
        }
      }
    }
    return InMemoryCourseRepository._(coursesMap);
  }

  @override
  void delete(String id) {
    _courses.remove(id);
  }

  @override
  void save(Course course) {
    _courses.putIfAbsent(course.id, () => course);
  }

  @override
  Future<List<Course>> searchAll() async{
    String jsonData = await rootBundle.loadString('lib/src/core/resource/data/Courses.json');
    var coursesss = await InMemoryCourseRepository.fromFile_(jsonData);
    return List<Course>.from(coursesss.values);
  }

  @override
  Course? findById(String id) {
    return _courses.containsKey(id) ? _courses[id] : null;
  }

  static Future<Map<String, Course>> fromFile_(String content) async{
    Map<String, Course> coursesMap = new Map();
    //String content = file.readAsStringSync();
    Map<String, dynamic> jsonData = jsonDecode(content);
    if(jsonData.containsKey("courses")){
      List<dynamic> coursesData = jsonData["courses"];
      for(var courseData in coursesData){
        List<dynamic> subCourses = courseData["courses"];
        for(var subCourse in subCourses){
          List<CourseSubject> subjects = [];
          List<dynamic> subjectsData = subCourse["subjects"];
          for(var subjectData in subjectsData){
            subjects.add(CourseSubject.create(subjectData["subjectId"], subjectData["duration"]));
          }
          var course = Course.create(subCourse["id"], subCourse["name"], subjects);
          coursesMap.putIfAbsent(course.id, () => course);
        }
      }
    }
    return coursesMap;
  }
}