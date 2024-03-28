import 'CourseSubject.dart';

class Course{
  final String              id;
  final String              name;
  final List<CourseSubject> subjects;

  Course.create(this.id, this.name, this.subjects);
}