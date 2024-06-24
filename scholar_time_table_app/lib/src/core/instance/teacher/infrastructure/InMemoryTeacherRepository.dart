import 'dart:convert';

import '../../../shared/domain/FileRepository.dart';
import '../domain/Teacher.dart';
import '../domain/TeacherRepository.dart';

class InMemoryTeacherRepository extends TeacherRepository{
  Map<String, Teacher> _teachers         = new Map();
  final String         _path             = 'Teachers';
  final FileRepository _fileRepository;

  InMemoryTeacherRepository._(this._teachers, this._fileRepository);

  static create(FileRepository fileRepository){
    return InMemoryTeacherRepository._(new Map(), fileRepository);
  }

  Future<List<Teacher>> _fromFile() async{
    List<Teacher> teachers = [];
    String content = await _fileRepository.readJson(_path);
    Map<String, dynamic> jsonData = jsonDecode(content);
    if(jsonData.containsKey("teachers")){
      List<dynamic> teachersData = jsonData["teachers"];
      for(var teacherDate in teachersData){
        teachers.add(Teacher.fromPrimitive(teacherDate));
      }
    }
    return teachers;
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
  Future<List<Teacher>> searchAll() async{
    return await _fromFile();
  }

  @override
  Future<Teacher?> findById(String id) async{
    var allTeachers = await searchAll();
    if(allTeachers.isEmpty){
      return null;
    }
    try{
      return allTeachers.firstWhere((element) => element.id == id);
    }catch(e){
      return null;
    }
  }
}