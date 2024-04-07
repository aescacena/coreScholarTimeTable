import 'CourseSubject.dart';

class ClassRoom{
  final String              id;
  final String              name;
  final List<CourseSubject> subjects;

  ClassRoom.create(this.id, this.name, this.subjects);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClassRoom &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          subjects == other.subjects;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ subjects.hashCode;
}