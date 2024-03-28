import 'Course.dart';

abstract class CourseRepository{
  Course? findById(String id);
  List<Course> searchAll();
  void save(Course course);
  void delete(String id);
}