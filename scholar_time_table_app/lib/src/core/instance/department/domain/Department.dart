class Department{
  final String id;
  final String name;

  Department.create(this.id, this.name);

  static fromPrimitive(Map<String, dynamic> data) {
    return Department.create(data["id"], data["name"]);
  }
}