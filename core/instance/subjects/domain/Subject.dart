import 'SubjectId.dart';

class Subject{
  final SubjectId id;
  final String    name;

  Subject.create(this.id, this.name);

  static fromPrimitive(Map<String, dynamic> data) {
    return Subject.create(SubjectId(data["id"]), data["name"]);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Subject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}