class TeacherSubjectPreference{
  final String       teacherId;
  final List<String> subjects;

  TeacherSubjectPreference._(this.teacherId, this.subjects);

  static TeacherSubjectPreference create(String teacherId, List<String> subjects){
    return TeacherSubjectPreference._(teacherId, subjects);
}

  static TeacherSubjectPreference withSubject(String teacherId, String subjectId){
    return TeacherSubjectPreference._(teacherId, [subjectId]);
  }

  TeacherSubjectPreference addSubject(String subjectId){
    if(this.subjects.isEmpty){
      return TeacherSubjectPreference.withSubject(teacherId, subjectId);
    }
    return TeacherSubjectPreference.create(teacherId, [...subjects, subjectId]);
  }

  TeacherSubjectPreference removeSubject(String subjectId){
    List<String> subjectsResult = List.from(subjects);
    subjectsResult.removeWhere((actualSubjectId) => actualSubjectId == subjectId);
    return create(teacherId, subjectsResult);
  }
}