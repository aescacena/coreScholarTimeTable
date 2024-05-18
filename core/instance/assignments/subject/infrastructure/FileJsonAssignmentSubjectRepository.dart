import 'dart:convert';
import 'dart:io';

import '../domain/AssignmentSubject.dart';
import '../domain/AssignmentSubjectRepository.dart';

class FileJsonAssignmentSubjectRepository implements AssignmentSubjectRepository{
  final String directory = Directory.current.path+'/core/resource/data/AssignmentSubject.json';

  void saveALl(List<AssignmentSubject> assignments) {
    var jsonList = assignments.map((assignment) => assignment.toPrimitives()).toList();
    var file = File(directory);
    file.writeAsString(jsonEncode(jsonList));
  }

  List<AssignmentSubject> searchAll() {
    return List.empty();
  }
    /*Map<String, AssignmentSubject> teachers = new Map();
    var file = File(directory);
    var content = file.readAsStringSync();
    Map<String, dynamic> jsonData = jsonDecode(content);
    if(jsonData.containsKey("teachers")){
      List<dynamic> teachersData = jsonData["teachers"];
      for(var teacherDate in teachersData){
        var teacher = Teacher.fromPrimitive(teacherDate);
        teachers.putIfAbsent(teacher.id, () => teacher);
      }
    }
    return InMemoryTeacherRepository._(teachers);
  }*/

}