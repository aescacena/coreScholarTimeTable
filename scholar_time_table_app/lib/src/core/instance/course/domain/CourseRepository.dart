import 'Course.dart';

abstract class CourseRepository{
  Course? findById(String id);
  Future<List<Course>> searchAll();
  void save(Course course);
  void delete(String id);
}