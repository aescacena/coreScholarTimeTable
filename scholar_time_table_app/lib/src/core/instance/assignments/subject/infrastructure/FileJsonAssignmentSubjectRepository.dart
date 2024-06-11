import 'dart:convert';
import 'dart:io';

import '../../../../../../src/core/instance/assignments/subject/domain/AssignmentSubject.dart';
import '../domain/AssignmentSubjectRepository.dart';

class FileJsonAssignmentSubjectRepository implements AssignmentSubjectRepository{
  final String directory;

  FileJsonAssignmentSubjectRepository._(this.directory);

  static FileJsonAssignmentSubjectRepository create(String directory){
    return FileJsonAssignmentSubjectRepository._(Directory.current.path + directory);
  }

  void saveALl(List<AssignmentSubject> assignments) {
    var jsonList = assignments.map((assignment) => assignment.toPrimitives()).toList();
    var file = File(directory);
    file.writeAsString(jsonEncode(jsonList));
  }

  List<AssignmentSubject> searchAll() {
    var file = File(directory);
    var content = file.readAsStringSync();
    List<dynamic> jsonData = jsonDecode(content);
    return jsonData.map((actual) => AssignmentSubject.fromPrimitives(actual)).toList();
  }
}