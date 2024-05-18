import 'package:faker/faker.dart';

import '../../../../../../core/instance/assignments/subject/domain/AssignmentSubject.dart';
import '../../../../../shared/infrastructure/UuidGeneratorMother.dart';

class AssignmentSubjectMother{
  static AssignmentSubject create(String subjectId, String teacherId){
    return new AssignmentSubject(subjectId, teacherId);
  }

  static AssignmentSubject random(){
    return new AssignmentSubject(UuidGeneratorMother.random(), UuidGeneratorMother.random());
  }

  static List<AssignmentSubject> randomList(){
    var total = faker.randomGenerator.integer(5, min: 2);
    List<AssignmentSubject> assignments = [];
    for(var i = 0; i < total; i++){
      assignments.add(random());
    }
    return assignments;
  }
}