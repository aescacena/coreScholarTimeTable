import 'Teacher.dart';

abstract class TeacherRepository{
  Teacher? findById(int id);
  List<Teacher> searchAll();
  void save(Teacher teacher);
  void delete(int id);
}