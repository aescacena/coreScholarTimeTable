import '../domain/Course.dart';
import '../domain/CourseRepository.dart';

class InMemoryCourseRepository extends CourseRepository{
  Map<String, ClassRoom> _courses = new Map();

  @override
  void delete(String id) {
    _courses.remove(id);
  }

  @override
  void save(ClassRoom course) {
    _courses.putIfAbsent(course.id, () => course);
  }

  @override
  List<ClassRoom> searchAll() {
    return List<ClassRoom>.from(_courses.values);
  }

  @override
  ClassRoom? findById(String id) {
    return _courses.containsKey(id) ? _courses[id] : null;
  }
}