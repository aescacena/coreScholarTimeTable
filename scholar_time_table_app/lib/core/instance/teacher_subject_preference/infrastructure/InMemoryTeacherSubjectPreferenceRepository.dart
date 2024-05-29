import '../domain/TeacherSubjectPreference.dart';
import '../domain/TeacherSubjectPreferenceRepository.dart';

class InMemoryTeacherSubjectPreferenceRepository implements TeacherSubjectPreferenceRepository{
  Map<String, TeacherSubjectPreference> _sessions = new Map();
  
  @override
  void delete(String teacherId) {
    _sessions.remove(teacherId);
  }

  @override
  void save(TeacherSubjectPreference preference) {
    _sessions.putIfAbsent(preference.teacherId, () => preference);
  }

  @override
  List<TeacherSubjectPreference> searchAll() {
    return List<TeacherSubjectPreference>.from(_sessions.values);
  }

  @override
  TeacherSubjectPreference? findByTeacherId(String teacherId) {
    return _sessions.containsKey(teacherId) ? _sessions[teacherId] : null;
  }
  
}