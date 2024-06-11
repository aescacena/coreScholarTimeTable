import 'package:faker/faker.dart';
import 'package:scholar_time_table_app/src/core/instance/subjects/domain/Subject.dart';
import 'package:scholar_time_table_app/src/core/instance/subjects/domain/SubjectId.dart';

import '../../../../../src/core/shared/infrastructure/UuidGeneratorMother.dart';
import 'SubjectIdMother.dart';

class SubjectMother{
  static Subject create(SubjectId id, String name, String departmentId){
    return Subject.create(id, name, departmentId);
  }

  static Subject random(){
    return create(SubjectIdMother.random(), faker.person.firstName(), UuidGeneratorMother.random());
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