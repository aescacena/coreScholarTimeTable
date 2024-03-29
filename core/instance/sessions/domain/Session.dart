import 'SessionSubject.dart';

class Session{
  final String         id;
  final String         subjectId;
  final String         teacherId;
  final String         groupStudentsId;
  final SessionSubject subject;

  Session.create(this.id, this.subjectId, this.teacherId, this.groupStudentsId, this.subject);
}