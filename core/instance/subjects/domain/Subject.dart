import 'SubjectId.dart';

class Subject{
  final SubjectId id;
  final String    name;
  final String    departmentId;

  Subject.create(this.id, this.name, this.departmentId);

  static fromPrimitive(Map<String, dynamic> data) {
    return Subject.create(SubjectId(data["id"]), data["name"], data["departmentId"]);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Subject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          departmentId == other.departmentId;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ departmentId.hashCode;
}