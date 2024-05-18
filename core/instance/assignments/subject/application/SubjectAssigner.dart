
class SubjectAssigner{
  final List<String> subjects;
  final List<int>    _timeSubjects;
  final List<String> teachers;
  final int          maximumHours = 18;
  List<List<int>>    _assignments = [];

  SubjectAssigner._(this.subjects, this._timeSubjects, this.teachers){
    _assignments = List.generate(this.subjects.length, (i) => List.filled(this.teachers.length, 0));
  }

  static SubjectAssigner assignSubjects(List<String> subjects, List<int> timeSubjects, List<String> teachers){
    var assigner = SubjectAssigner._(subjects, timeSubjects, teachers);
    assigner._assignSubjects();
    return assigner;
  }

  void _assignSubjects(){
    for(var subject = 0; subject < subjects.length; subject++){
      var bestTeacher = _selectBestTeacher();
      if(_exceedsTimeLimit(subject, bestTeacher)){
        return;
      }
      _assign(subject, _selectBestTeacher());
    }
  }

  bool isTeacherAssigned(int teacher){
    for(var subject = 0; subject < subjects.length; subject++){
      if(_subjectAssignedToTeacher(subject, teacher)){
        return true;
      }
    }
    return false;
  }

  bool isTeacherNotAssigned(int teacher){
    return !isTeacherAssigned(teacher);
  }

  bool isSubjectAssigned(int subject){
    for(var teacher = 0; teacher < teachers.length; teacher++){
      if(_subjectAssignedToTeacher(subject, teacher)){
        return true;
      }
    }
    return false;
  }

  bool isSubjectNotAssigned(int subject){
    return !this.isSubjectAssigned(subject);
  }

  void _assign(int subject, int teacher){
    _assignments[subject][teacher] = 1;
  }

  int _selectBestTeacher(){
    var bestTeacher  = -1;
    var bestTimeCost = 0;
    for(var teacher = 0; teacher < teachers.length; teacher++){
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
    for(var subject = 0; subject < subjects.length; subject++){
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
    return maximumHours < (_subjectTime(subject) + _calculateTeacherTime(teacher));
  }
}