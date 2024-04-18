import '../domain/Subject.dart';
import '../domain/SubjectRepository.dart';

class InMemorySubjectRepository extends SubjectRepository{
  Map<String, Subject> _departments = new Map();

  @override
  void delete(String id) {
    _departments.remove(id);
  }

  @override
  void save(Subject subject) {
    _departments.putIfAbsent(subject.id.value, () => subject);
  }

  @override
  List<Subject> searchAll() {
    return List<Subject>.from(_departments.values);
  }

  @override
  Subject? findById(String id) {
    return _departments.containsKey(id) ? _departments[id] : null;
  }
}