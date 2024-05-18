class AssignmentSubject{
  final String subjectId;
  final String teacherId;

  AssignmentSubject(this.subjectId, this.teacherId);

  Map<String, dynamic> toPrimitives(){
    return {
      'subjectId': subjectId,
      'teacherId': teacherId
    };
  }
}