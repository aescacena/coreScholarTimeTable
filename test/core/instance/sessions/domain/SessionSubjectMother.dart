import 'package:faker/faker.dart';

import '../../../../../core/instance/sessions/domain/SessionSubject.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';

class SessionSubjectMother{
  static SessionSubject create(
      String classRoomId, List<String> alternativeClassRooms, List<int> distribution){
    return SessionSubject.create(classRoomId, alternativeClassRooms, distribution);
  }

  static SessionSubject random(){
    List<String>    alternativeClassRooms      = [];
    List<List<int>> distributionPossible       = [[1, 1, 1], [2, 2], [3, 2], [2, 1]];
    int             totalAlternativeClassRooms = faker.randomGenerator.integer(2);
    int             i                          = 0;
    while(i < totalAlternativeClassRooms){
      alternativeClassRooms.add(UuidGeneratorMother.random());
      i++;
    }
    return create(
        UuidGeneratorMother.random(), alternativeClassRooms,
        distributionPossible[faker.randomGenerator.integer(distributionPossible.length)]);
  }

  static List<SessionSubject> randomList(){
    List<SessionSubject> sessionSubjects = [];
    int          total   = faker.randomGenerator.integer(10);
    int          i       = 0;
    while(i < total){
      var sessionSubject = random();
      if(!sessionSubjects.any((element) => element.classRoomId == sessionSubject.classRoomId)){
        sessionSubjects.add(sessionSubject);
        i++;
      }
    }
    return sessionSubjects;
  }
}