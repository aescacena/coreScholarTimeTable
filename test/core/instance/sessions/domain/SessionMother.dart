import 'package:faker/faker.dart';

import '../../../../../core/instance/sessions/domain/Session.dart';
import '../../../../../core/instance/sessions/domain/SessionSubject.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';
import 'SessionSubjectMother.dart';

class SessionMother{
  static Session create(
      String id, String subjectId, String teacherId, String groupStudentsId,
      SessionSubject subject){
    return Session.create(id, subjectId, teacherId, groupStudentsId, subject);
  }

  static Session random(){
    return create(
        UuidGeneratorMother.random(),
        UuidGeneratorMother.random(),
        UuidGeneratorMother.random(),
        UuidGeneratorMother.random(),
        SessionSubjectMother.random());
  }

  static List<Session> randomList(){
    List<Session> sessions = [];
    int          total   = faker.randomGenerator.integer(10);
    int          i       = 0;
    while(i < total){
      var session = random();
      if(!sessions.any((element) => element.id == session.id)){
        sessions.add(session);
        i++;
      }
    }
    return sessions;
  }
}