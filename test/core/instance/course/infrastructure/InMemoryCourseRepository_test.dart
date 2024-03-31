import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../../core/instance/course/domain/Course.dart';
import '../../../../../core/instance/course/infrastructure/InMemoryCourseRepository.dart';
import '../domain/CourseMother.dart';

void main(){
  late InMemoryCourseRepository repository;

  setUp((){
    repository = new InMemoryCourseRepository();
  });

  group("Repository Courses", () {
    test("Should save Course", () {
      // Arrange
      ClassRoom course = CourseMother.random();

      // Act
      repository.save(course);

      // Assert
    });
    test("Should return all Courses", () {
      // Arrange
      List<ClassRoom> courses = CourseMother.randomList();

      // Act
      courses.forEach((element) => repository.save(element));
      List<ClassRoom> cousesFound = repository.searchAll();

      // Assert
      expect(courses, containsAll(cousesFound));
    });
    test("Should return exist Course", () {
      // Arrange
      ClassRoom course = CourseMother.random();

      // Act
      repository.save(course);

      // Assert
      expect(repository.findById(course.id), isNotNull);
    });
    test("Should return null", () {
      // Arrange
      ClassRoom course = CourseMother.random();

      // Act

      // Assert
      expect(repository.findById(course.id), isNull);
    });
    test("Should remove null", () {
      // Arrange
      ClassRoom course = CourseMother.random();

      // Act
      repository.save(course);

      // Assert
      expect(repository.findById(course.id), isNotNull);
      repository.delete(course.id);
      expect(repository.findById(course.id), isNull);
    });
  });
}