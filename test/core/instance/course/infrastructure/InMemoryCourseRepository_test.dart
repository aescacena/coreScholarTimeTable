import 'dart:io';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../../core/instance/course/domain/Course.dart';
import '../../../../../core/instance/course/infrastructure/InMemoryCourseRepository.dart';
import '../domain/CourseMother.dart';

void main(){
  late InMemoryCourseRepository repository;

  group("Constructor", (){
    test("Should create Empty", (){
      // Arrange

      // Act
      repository = InMemoryCourseRepository.empty();

      // Assert
      expect(repository.searchAll().isEmpty, isTrue);
    });
    test("Should create from List", (){
      // Arrange
      var courses = CourseMother.randomList();

      // Act
      repository = InMemoryCourseRepository.create(courses);

      // Assert
      expect(repository.searchAll(), courses);
    });
    test("Should create from File", (){
      // Arrange
      var file = File(Directory.current.path+'/core/resource/data/Courses.json');

      // Act
      repository = InMemoryCourseRepository.fromFile(file);

      // Assert
      expect(repository.searchAll().isNotEmpty, isTrue);
    });
  });
  group("Repository Courses", () {
    test("Should save Course", () {
      // Arrange
      Course course = CourseMother.random();

      // Act
      repository = InMemoryCourseRepository.empty();
      repository.save(course);

      // Assert
    });
    test("Should return all Courses", () {
      // Arrange
      List<Course> courses = CourseMother.randomList();

      // Act
      repository = InMemoryCourseRepository.empty();
      courses.forEach((element) => repository.save(element));
      List<Course> coursesFound = repository.searchAll();

      // Assert
      expect(courses, containsAll(coursesFound));
    });
    test("Should return exist Course", () {
      // Arrange
      Course course = CourseMother.random();

      // Act
      repository = InMemoryCourseRepository.empty();
      repository.save(course);

      // Assert
      expect(repository.findById(course.id), isNotNull);
    });
    test("Should return null", () {
      // Arrange
      Course course = CourseMother.random();

      // Act
      repository = InMemoryCourseRepository.empty();

      // Assert
      expect(repository.findById(course.id), isNull);
    });
    test("Should remove null", () {
      // Arrange
      Course course = CourseMother.random();

      // Act
      repository = InMemoryCourseRepository.empty();
      repository.save(course);

      // Assert
      expect(repository.findById(course.id), isNotNull);
      repository.delete(course.id);
      expect(repository.findById(course.id), isNull);
    });
  });
}