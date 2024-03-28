import 'Department.dart';

abstract class DepartmentRepository{
  Department? findById(String id);
  List<Department> searchAll();
  void save(Department department);
  void delete(String id);
}