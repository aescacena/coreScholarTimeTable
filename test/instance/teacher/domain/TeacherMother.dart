import 'package:faker/faker.dart';

import '../../../../core/instance/teacher/domain/Teacher.dart';

class TeacherMother{
  static Teacher create(int id, String name, String subName, int department){
    return Teacher.create(id, name, subName, department);
  }

  static Teacher random(){
    return create(
        faker.randomGenerator.integer(99999), faker.person.firstName(),
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