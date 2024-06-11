import 'TeacherSubjectPreference.dart';

abstract class TeacherSubjectPreferenceRepository{
  TeacherSubjectPreference? findByTeacherId(String teacherId);
  List<TeacherSubjectPreference> searchAll();
  void save(TeacherSubjectPreference preference);
  void delete(String teacherId);
}