import 'package:faker/faker.dart';
import 'package:scholar_time_table_app/core/instance/teachingSession/domain/TeachingSession.dart';
import 'package:scholar_time_table_app/core/instance/teachingSession/domain/TeachingSessionSubject.dart';

import '../../../../shared/infrastructure/UuidGeneratorMother.dart';
import 'TeachingSessionSubjectMother.dart';

class TeachingSessionMother{
  static TeachingSession create(
      String id, String subjectId, String teacherId, String groupStudentsId,
      TeachingSessionSubject subject){
    return TeachingSession.create(id, subjectId, teacherId, groupStudentsId, subject);
  }

  static TeachingSession random(){
    return create(
        UuidGeneratorMother.random(),
        UuidGeneratorMother.random(),
        UuidGeneratorMother.random(),
        UuidGeneratorMother.random(),
        TeachingSessionSubjectMother.random());
  }

  static List<TeachingSession> randomList(){
    List<TeachingSession> sessions = [];
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