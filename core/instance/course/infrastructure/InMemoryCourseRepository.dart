import '../domain/Course.dart';
import '../domain/CourseRepository.dart';

class InMemoryCourseRepository extends CourseRepository{
  Map<String, Course> _courses = new Map();

  @override
  void delete(String id) {
    _courses.remove(id);
  }

  @override
  void save(Course course) {
    _courses.putIfAbsent(course.id, () => course);
  }

  @override
  List<Course> searchAll() {
    return List<Course>.from(_courses.values);
  }

  @override
  Course? findById(String id) {
    return _courses.containsKey(id) ? _courses[id] : null;
  }
}