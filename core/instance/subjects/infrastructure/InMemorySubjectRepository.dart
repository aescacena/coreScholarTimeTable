import 'dart:ffi';

import '../domain/Subject.dart';
import '../domain/SubjectId.dart';
import '../domain/SubjectRepository.dart';

class InMemorySubjectRepository extends SubjectRepository{
  Map<String, Subject> _departments = new Map();

  @override
  void delete(SubjectId id) {
    _departments.remove(id.value);
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
  Subject? findById(SubjectId id) {
    return _departments.containsKey(id.value) ? _departments[id.value] : null;
  }
}