import 'TeachingSessionSubject.dart';

class TeachingSession{
  final String                 id;
  final String                 subjectId;
  final String                 teacherId;
  final String                 groupStudentsId;
  final TeachingSessionSubject subject;

  TeachingSession.create(this.id, this.subjectId, this.teacherId, this.groupStudentsId, this.subject);
}