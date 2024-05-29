import 'Teacher.dart';

abstract class TeacherRepository{
  Teacher? findById(String id);
  List<Teacher> searchAll();
  void save(Teacher teacher);
  void delete(String id);
}