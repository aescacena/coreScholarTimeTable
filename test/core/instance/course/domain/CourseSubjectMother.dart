import 'package:faker/faker.dart';

import '../../../../../core/instance/course/domain/CourseSubject.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';

class CourseSubjectMother{
  static CourseSubject create(
      String subjectId, String teacherId, int totalHours, int weeklyHours, int classHours){
    return CourseSubject.create(subjectId, teacherId, totalHours, weeklyHours, classHours);
  }

  static CourseSubject random(){
    int classHours  = faker.randomGenerator.integer(4, min: 1);
    int weeklyHours = classHours < 4 ? 2 : 1;
    return CourseSubject.create(
        UuidGeneratorMother.random(),
        UuidGeneratorMother.random(),
        faker.randomGenerator.integer(2500, min: 1500), weeklyHours, classHours);
  }

  static List<CourseSubject> randomListWithTotal(int total){
    List<CourseSubject> subjects = [];
    int i = 0;
    while(i < total){
      var subject = CourseSubjectMother.random();
      if(!subjects.any((element) => element.subjectId == subject.subjectId || element.teacherId == subject.teacherId)){
        subjects.add(subject);
        i++;
      }
    }
    return subjects;
  }
}