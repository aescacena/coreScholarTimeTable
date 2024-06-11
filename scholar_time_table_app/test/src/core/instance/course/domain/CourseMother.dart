import 'package:faker/faker.dart';
import 'package:scholar_time_table_app/src/core/instance/course/domain/Course.dart';
import 'package:scholar_time_table_app/src/core/instance/course/domain/CourseSubject.dart';
import '../../../../../src/core/shared/infrastructure/UuidGeneratorMother.dart';
import 'CourseSubjectMother.dart';

class CourseMother{
  static Course create(String id, String name, List<CourseSubject> subjects){
    return Course.create(id, name, subjects);
  }

  static Course random(){
    return create(
        UuidGeneratorMother.random(),
        faker.company.name(),
        CourseSubjectMother.randomListWithTotal(7));
  }

  static List<Course> randomList(){
    List<Course> courses = [];
    int          total   = faker.randomGenerator.integer(10);
    int          i       = 0;
    while(i < total){
      var course = random();
      if(!courses.any((element) => element.id == course.id)){
        courses.add(course);
        i++;
      }
    }
    return courses;
  }
}