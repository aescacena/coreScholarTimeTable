import 'package:faker/faker.dart';
import 'package:scholar_time_table_app/src/core/instance/course/domain/CourseSubject.dart';

import '../../../../../src/core/shared/infrastructure/UuidGeneratorMother.dart';

class CourseSubjectMother{
  static CourseSubject create(
      String subjectId, int weeklyHours, String teacherId, int totalHours, int classHours){
    return CourseSubject.create(subjectId, weeklyHours, teacherId: teacherId, totalHours: totalHours, classHours: classHours);
  }

  static CourseSubject random(){
    int classHours  = faker.randomGenerator.integer(4, min: 1);
    int weeklyHours = classHours < 4 ? 2 : 1;
    return CourseSubjectMother.create(
        UuidGeneratorMother.random(),
        weeklyHours,
        UuidGeneratorMother.random(),
        faker.randomGenerator.integer(2500, min: 1500),
        classHours);
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