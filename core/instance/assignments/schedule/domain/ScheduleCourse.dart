class ScheduleCourse{
  final String       id;
  final List<String> subjects;
  final int          turn;

  ScheduleCourse(this.id, this.subjects, this.turn);

  bool containSubject(String subject){
    return subjects.contains(subject);
  }

  bool notContainSubject(String subject){
    return !containSubject(subject);
  }
}