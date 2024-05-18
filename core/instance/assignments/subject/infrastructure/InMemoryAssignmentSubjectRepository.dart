import '../domain/AssignmentSubject.dart';
import '../domain/AssignmentSubjectRepository.dart';

class InMemoryAssignmentSubjectRepository implements AssignmentSubjectRepository{

  List<AssignmentSubject> _assignments = [];

  InMemoryAssignmentSubjectRepository._(this._assignments);

  static InMemoryAssignmentSubjectRepository empty() {
    return InMemoryAssignmentSubjectRepository._([]);
  }

  void saveALl(List<AssignmentSubject> assignments) {
    for(var assignment in assignments){
      if(_notExistInMemory(assignment)){
        _assignments.add(assignment);
      }
    }
  }

  List<AssignmentSubject> searchAll() {
    return _assignments;
  }

  bool _existInMemory(AssignmentSubject assignment){
    return _assignments.any((actual) => actual.subjectId == assignment.subjectId && actual.teacherId == assignment.teacherId);
  }

  bool _notExistInMemory(AssignmentSubject assignment){
    return !_existInMemory(assignment);
  }
}