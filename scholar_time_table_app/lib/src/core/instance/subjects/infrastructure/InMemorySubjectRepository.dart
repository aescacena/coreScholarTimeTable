import 'dart:convert';

import '../../../shared/domain/FileRepository.dart';
import '../domain/Subject.dart';
import '../../../../../src/core/instance/subjects/domain/SubjectId.dart';
import '../domain/SubjectRepository.dart';

class InMemorySubjectRepository extends SubjectRepository{
  Map<String, Subject> _departments = new Map();
  final String         _name        = "Subjects";
  final FileRepository _fileRepository;

  InMemorySubjectRepository._(this._fileRepository);

  static create(FileRepository fileRepository){
    return InMemorySubjectRepository._(fileRepository);
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
  Future<List<Subject>> searchAll() async{
    var                  jsonSubjects = await _fileRepository.readJson(_name);
    List<Subject>        subjects     = [];
    Map<String, dynamic> jsonData     = jsonDecode(jsonSubjects);
    if(jsonData.containsKey("subjects")){
      List<dynamic> subjectsData = jsonData["subjects"];
      for(var subjectData in subjectsData){
        subjects.add(Subject.fromPrimitive(subjectData));
      }
    }
    return subjects;
  }

  @override
  Future<Subject?> findById(SubjectId id) async{
    var allSubjects = await searchAll();
    try{
      return allSubjects.firstWhere((element) => element.id == id);
    }catch(e){
      return null;
    }
  }
}