import 'package:faker/faker.dart';
import 'package:scholar_time_table_app/src/core/instance/teachingSession/domain/TeachingSessionSubject.dart';
import '../../../../../src/core/shared/infrastructure/UuidGeneratorMother.dart';

class TeachingSessionSubjectMother{
  static TeachingSessionSubject create(
      String classRoomId, List<String> alternativeClassRooms, List<int> distribution){
    return TeachingSessionSubject.create(classRoomId, alternativeClassRooms, distribution);
  }

  static TeachingSessionSubject random(){
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

  static List<TeachingSessionSubject> randomList(){
    List<TeachingSessionSubject> sessionSubjects = [];
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