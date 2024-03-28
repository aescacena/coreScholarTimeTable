import '../domain/Department.dart';
import '../domain/DepartmentRepository.dart';

class InMemoryDepartmentRepository extends DepartmentRepository{
  Map<String, Department> _departments = new Map();

  @override
  void delete(String id) {
    _departments.remove(id);
  }

  @override
  void save(Department department) {
    _departments.putIfAbsent(department.id, () => department);
  }

  @override
  List<Department> searchAll() {
    return List<Department>.from(_departments.values);
  }

  @override
  Department? findById(String id) {
    return _departments.containsKey(id) ? _departments[id] : null;
  }
}