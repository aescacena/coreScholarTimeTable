class CalendarSubject {
  final String subjectId;
  final String teacherId;

  CalendarSubject(this.subjectId, this.teacherId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarSubject &&
          runtimeType == other.runtimeType &&
          subjectId == other.subjectId &&
          teacherId == other.teacherId;

  @override
  int get hashCode => subjectId.hashCode ^ teacherId.hashCode;
}