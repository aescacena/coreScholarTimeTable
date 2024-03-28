import 'package:faker/faker.dart';
import '../../../../../core/instance/course/domain/Course.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';

class CourseMother{
  static Course create(String id, String name, List<String> subjects){
    return Course.create(id, name, subjects);
  }

  static Course random(){
    return create(
        UuidGeneratorMother.random(),
        faker.company.name(),
        List.generate(
            faker.randomGenerator.integer(10), (index) => faker.job.title()));
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