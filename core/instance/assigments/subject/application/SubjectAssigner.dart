class SubjectAssigner{
  final List<String> subjects;
  final List<String> timeSubjects;
  final List<String> teachers;
  final int          maximumHours = 18;
  List<List<int>> _assignments = [];

  SubjectAssigner(this.subjects, this.timeSubjects, this.teachers){
    _assignments = List.generate(this.subjects.length, (i) => List.filled(this.teachers.length, 0));
  }

  /*void assign(){
    for(var subject = 0; subject < subjects.length; subject++){
      if(_subjectNotAssigned(subject)){
        _assignments[subject][_selectTeacher()] = 1;
      }
    }
  }*/

  bool subjectNotAssigned(int positionSubject){
    for(var teacher = 0; teacher < teachers.length; teacher++){
      if(_assignments[positionSubject][teacher] == 1){
        return true;
      }
    }
    return false;
  }

  void assign(int subject, int teacher){
    _assignments[subject][teacher] = 1;
  }

  int selectBestTeacher(){
    int bestTeacher = -1;
    for(var teacher = 0; teacher < teachers.length; teacher++){
      if(bestTeacher == -1){
        bestTeacher = teacher;
      }
      var totalSubjects = 0;
      for(var subject = 0; subject < subjects.length; subject++){
        if(_assignments[subject][teacher] == 1){
          totalSubjects++;
        }
      }
      if(totalSubjects == 0){
        return bestTeacher;
      }
      if(bestTeacher == -1){
        bestTeacher = totalSubjects;
      }
    }
    return bestTeacher;
  }
}