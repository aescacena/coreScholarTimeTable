import 'Course.dart';

abstract class CourseRepository{
  ClassRoom? findById(String id);
  List<ClassRoom> searchAll();
  void save(ClassRoom course);
  void delete(String id);
}