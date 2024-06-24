import 'Course.dart';

abstract class CourseRepository{
  Future<Course?> findById(String id);
  Future<List<Course>> searchAll();
  void save(Course course);
  void delete(String id);
}