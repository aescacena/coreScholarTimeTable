import 'package:faker/faker.dart';

import '../../../../../core/instance/subjects/domain/Subject.dart';
import '../../../../../core/instance/subjects/domain/SubjectId.dart';
import 'SubjectIdMother.dart';

class SubjectMother{
  static Subject create(SubjectId id, String name){
    return Subject.create(id, name);
  }

  static Subject random(){
    return create(SubjectIdMother.random(), faker.person.firstName());
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