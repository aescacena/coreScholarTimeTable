import '../domain/Teacher.dart';
import '../domain/TeacherRepository.dart';

class InMemoryCourseRepository extends TeacherRepository{
  Map<int, Teacher> _teachers = new Map();

  @override
  void delete(int id) {
    _teachers.remove(id);
  }

  @override
  void save(Teacher teacher) {
    _teachers.putIfAbsent(teacher.id, () => teacher);
  }

  @override
  List<Teacher> searchAll() {
    return List<Teacher>.from(_teachers.values);
  }

  @override
  Teacher? findById(int id) {
    return _teachers.containsKey(id) ? _teachers[id] : null;
  }
}