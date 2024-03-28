import 'package:faker/faker.dart';

import '../../../../../core/instance/subjects/domain/Subject.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';

class SubjectMother{
  static Subject create(String id, String name, int duration){
    return Subject.create(id, name, duration);
  }

  static Subject random(){
    return create(
        UuidGeneratorMother.random(),
        faker.person.firstName(),
        faker.randomGenerator.integer(99999));
  }

  static List<Subject> randomList(){
    List<Subject> subjects = [];
    int           total    = faker.randomGenerator.integer(10);
    int           i        = 0;
    while(i < total){
      var subject = random();
      if(!subjects.any((element) => element.id == subject.id)){
        subjects.add(subject);
        i++;
      }
    }
    return subjects;
  }
}