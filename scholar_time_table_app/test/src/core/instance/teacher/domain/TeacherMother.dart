import 'package:faker/faker.dart';
import 'package:scholar_time_table_app/src/core/instance/teacher/domain/Teacher.dart';

import '../../../../../src/core/shared/infrastructure/UuidGeneratorMother.dart';

class TeacherMother{
  static Teacher create(String id, String name, String subName, int department){
    return Teacher.create(id, name, subName, department);
  }

  static Teacher random(){
    return create(
        UuidGeneratorMother.random(), faker.person.firstName(),
        faker.person.lastName(), faker.randomGenerator.integer(99999));
  }

  static List<Teacher> randomList(){
    List<Teacher> teachers = [];
    int           total    = faker.randomGenerator.integer(10);
    int           i        = 0;
    while(i < total){
      var teacher = random();
      if(!teachers.any((element) => element.id == teacher.id)){
        teachers.add(teacher);
        i++;
      }
    }
    return teachers;
  }
}