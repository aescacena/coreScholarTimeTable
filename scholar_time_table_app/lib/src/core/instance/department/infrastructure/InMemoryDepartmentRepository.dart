import 'dart:convert';

import 'package:scholar_time_table_app/src/core/shared/domain/FileRepository.dart';

import '../domain/Department.dart';
import '../../../../../src/core/instance/department/domain/DepartmentRepository.dart';

class InMemoryDepartmentRepository extends DepartmentRepository{
  Map<String, Department> _departments = new Map();
  final String            _name        = "Departments";
  final FileRepository    _fileRepository;

  InMemoryDepartmentRepository._(this._fileRepository);

  static create(FileRepository fileRepository){
    return InMemoryDepartmentRepository._(fileRepository);
  }

  @override
  void delete(String id) {
    _departments.remove(id);
  }

  @override
  void save(Department department) {
    _departments.putIfAbsent(department.id, () => department);
  }

  @override
  Future<List<Department>> searchAll() async{
    List<Department>     departments    = [];
    var                  jsonDepartment = await _fileRepository.readJson(_name);
    Map<String, dynamic> jsonData       = jsonDecode(jsonDepartment);
    if(jsonData.containsKey("departments")){
      List<dynamic> subjectsData = jsonData["departments"];
      for(var subjectData in subjectsData){
        departments.add(Department.fromPrimitive(subjectData));
      }
    }
    return departments;
  }

  @override
  Future<Department?> findById(String id) async{
    var allDepartments = await searchAll();
    try{
      return allDepartments.firstWhere((element) => element.id == id);
    }catch(e){
      return null;
    }
  }
}