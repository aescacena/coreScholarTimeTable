import 'package:faker/faker.dart';
import '../../../../../core/instance/course/domain/Course.dart';
import '../../../../../core/instance/course/domain/CourseSubject.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';
import 'CourseSubjectMother.dart';

class CourseMother{
  static ClassRoom create(String id, String name, List<CourseSubject> subjects){
    return ClassRoom.create(id, name, subjects);
  }

  static ClassRoom random(){
    return create(
        UuidGeneratorMother.random(),
        faker.company.name(),
        CourseSubjectMother.randomListWithTotal(7));
  }

  static List<ClassRoom> randomList(){
    List<ClassRoom> courses = [];
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