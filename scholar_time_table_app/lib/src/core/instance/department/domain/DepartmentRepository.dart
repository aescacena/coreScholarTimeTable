import 'Department.dart';

abstract class DepartmentRepository{
  Future<Department?> findById(String id);
  Future<List<Department>> searchAll();
  void save(Department department);
  void delete(String id);
}