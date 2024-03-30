import 'CourseSubject.dart';

class ClassRoom{
  final String              id;
  final String              name;
  final List<CourseSubject> subjects;

  ClassRoom.create(this.id, this.name, this.subjects);
}