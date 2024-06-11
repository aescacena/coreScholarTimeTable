class Teacher {
  final String id;
  final String name;
  final String subName;
  final int    departmentId;

  Teacher.create(this.id, this.name, this.subName, this.departmentId);

  static fromPrimitive(Map<String, dynamic> data){
    return Teacher.create(
        data["id"],
        data["name"] ,
        data.containsKey("subName") ? data["subName"] : "",
        data["departmentId"]);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Teacher &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          subName == other.subName &&
          departmentId == other.departmentId;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ subName.hashCode ^ departmentId.hashCode;
}