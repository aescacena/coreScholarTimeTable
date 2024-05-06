class CourseSubject{
  final String  subjectId;
  final int     weeklyHours;
  final String? teacherId;
  final int?    totalHours;
  final int?    classHours;

  CourseSubject.create(
      this.subjectId, this.weeklyHours, {this.teacherId, this.totalHours, this.classHours});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseSubject &&
          runtimeType == other.runtimeType &&
          subjectId == other.subjectId &&
          weeklyHours == other.weeklyHours &&
          teacherId == other.teacherId &&
          totalHours == other.totalHours &&
          classHours == other.classHours;

  @override
  int get hashCode =>
      subjectId.hashCode ^
      weeklyHours.hashCode ^
      teacherId.hashCode ^
      totalHours.hashCode ^
      classHours.hashCode;
}