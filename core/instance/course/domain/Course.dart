import 'CourseSubject.dart';

class Course{
  final String              id;
  final String              name;
  final List<CourseSubject> subjects;

  Course.create(this.id, this.name, this.subjects);

  Course assignTeacherToSubject(String teacherId, String subjectId){
    var index = subjects.indexWhere((subject) => subject.subjectId == subjectId);
    if (index == -1) {
      return this;
    }
    var subjectsUpdated = [
      ...subjects.sublist(0, index),
      subjects[index].addTeacher(teacherId),
      ...subjects.sublist(index + 1)];
    return Course.create(id, name, subjectsUpdated);
  }

  CourseSubject? _searchSubject(String subjectId){
    for(var subject in subjects){
      if(subject.subjectId == subjectId){
        return subject;
      }
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Course &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          subjects == other.subjects;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ subjects.hashCode;
}