import 'Teacher.dart';

abstract class TeacherRepository{
  Future<Teacher?> findById(String id);
  Future<List<Teacher>> searchAll();
  void save(Teacher teacher);
  void delete(String id);
}