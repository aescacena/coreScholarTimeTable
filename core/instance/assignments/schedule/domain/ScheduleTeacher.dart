class ScheduleTeacher{
  final String       id;
  final List<String> subjects;

  ScheduleTeacher(this.id, this.subjects);

  bool contains(String subject) {
    return subjects.contains(subject);
  }

  bool notContains(String subject) {
    return !contains(subject);
  }
}