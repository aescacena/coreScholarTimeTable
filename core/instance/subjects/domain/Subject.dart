import 'SubjectId.dart';

class Subject{
  final SubjectId id;
  final String    name;
  final int       duration;

  Subject.create(this.id, this.name, this.duration);
}