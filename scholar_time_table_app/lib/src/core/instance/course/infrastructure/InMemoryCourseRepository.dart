
import 'dart:convert';

import '../../../shared/domain/FileRepository.dart';
import '../domain/Course.dart';
import '../../../../../src/core/instance/course/domain/CourseRepository.dart';
import '../../../../../src/core/instance/course/domain/CourseSubject.dart';

class InMemoryCourseRepository extends CourseRepository{
  Map<String, Course>  _courses         = new Map();
  final String         _name            = "Courses";
  final FileRepository _fileRepository;

  InMemoryCourseRepository._(this._fileRepository);

  static create(FileRepository fileRepository){
    return InMemoryCourseRepository._(fileRepository);
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
    List<Course>         courses   = [];
    var                  jsonFound = await _fileRepository.readJson(_name);
    Map<String, dynamic> jsonData  = jsonDecode(jsonFound);
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
          courses.add(Course.create(subCourse["id"], subCourse["name"], subjects));
        }
      }
    }
    return courses;
  }

  @override
  Future<Course?> findById(String id) async{
    var allCourses = await searchAll();
    try{
      return allCourses.firstWhere((element) => element.id == id);
    }catch(e){
      return null;
    }
  }

  static Future<Map<String, Course>> fromFile_(String content) async{
    Map<String, Course> coursesMap = new Map();
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