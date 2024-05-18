
import '../domain/AssignmentSubject.dart';

class SubjectAssigner{
  final List<String> _subjects;
  final List<int>    _timeSubjects;
  final List<String> _teachers;
  final int          _maximumHours = 18;
  List<List<int>>    _assignments = [];

  SubjectAssigner._(this._subjects, this._timeSubjects, this._teachers){
    _assignments = List.generate(this._subjects.length, (i) => List.filled(this._teachers.length, 0));
  }

  static List<AssignmentSubject> assignSubjects(List<String> subjects, List<int> timeSubjects, List<String> teachers){
    var assigner = SubjectAssigner._(subjects, timeSubjects, teachers);
    return assigner._assignSubjects();
  }

  List<AssignmentSubject> _assignSubjects(){
    List<AssignmentSubject> assignments = [];
    for(var subject = 0; subject < _subjects.length; subject++){
      var bestTeacher = _selectBestTeacher();
      if(_exceedsTimeLimit(subject, bestTeacher)){
        break;
      }
      _assign(subject, bestTeacher);
      assignments.add(AssignmentSubject(_subjects[subject], _teachers[bestTeacher]));
    }
    return assignments;
  }

  bool _isTeacherAssigned(int teacher){
    for(var subject = 0; subject < _subjects.length; subject++){
      if(_subjectAssignedToTeacher(subject, teacher)){
        return true;
      }
    }
    return false;
  }

  bool _isTeacherNotAssigned(int teacher){
    return !_isTeacherAssigned(teacher);
  }

  bool _isSubjectAssigned(int subject){
    for(var teacher = 0; teacher < _teachers.length; teacher++){
      if(_subjectAssignedToTeacher(subject, teacher)){
        return true;
      }
    }
    return false;
  }

  bool _isSubjectNotAssigned(int subject){
    return !_isSubjectAssigned(subject);
  }

  void _assign(int subject, int teacher){
    _assignments[subject][teacher] = 1;
  }

  int _selectBestTeacher(){
    var bestTeacher  = -1;
    var bestTimeCost = 0;
    for(var teacher = 0; teacher < _teachers.length; teacher++){
      var actualCost = _calculateTeacherTime(teacher);
      if((bestTeacher == -1) || (actualCost < bestTimeCost)){
        bestTeacher  = teacher;
        bestTimeCost = actualCost;
      }
      if(actualCost == 0){
        return teacher;
      }
    }
    return bestTeacher;
  }

  int _calculateTeacherTime(int teacher){
    var cost = 0;
    for(var subject = 0; subject < _subjects.length; subject++){
      if(_subjectAssignedToTeacher(subject, teacher)){
        cost += _subjectTime(subject);
      }
    }
    return cost;
  }

  bool _subjectAssignedToTeacher(int subject, int teacher){
    return _assignments[subject][teacher] == 1;
  }

  int _subjectTime(int subject){
    return _timeSubjects[subject];
  }

  bool _exceedsTimeLimit(int subject, int teacher){
    return _maximumHours < (_subjectTime(subject) + _calculateTeacherTime(teacher));
  }
}