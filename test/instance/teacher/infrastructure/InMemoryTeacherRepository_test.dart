import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import '../../../../core/instance/teacher/domain/Teacher.dart';
import '../../../../core/instance/teacher/infrastructure/InMemoryTeacherRepository.dart';
import '../domain/TeacherMother.dart';

void main(){
  late InMemoryTeacherRepository repository;

  setUp((){
    repository = new InMemoryTeacherRepository();
  });

  group("Repository Teachers", () {
    test("Should save Teacher", () {
      // Arrange
      Teacher teacher = TeacherMother.random();

      // Act
      repository.save(teacher);

      // Assert
    });
    test("Should return all Teachers", () {
      // Arrange
      List<Teacher> teachers = TeacherMother.randomList();

      // Act
      teachers.forEach((element) => repository.save(element));
      List<Teacher> teachersFound = repository.searchAll();

      // Assert
      expect(teachers, containsAll(teachersFound));
    });
    test("Should return exist Teacher", () {
      // Arrange
      Teacher teacher = TeacherMother.random();

      // Act
      repository.save(teacher);

      // Assert
      expect(repository.findById(teacher.id), isNotNull);
    });
    test("Should return null", () {
      // Arrange
      Teacher teacher = TeacherMother.random();

      // Act

      // Assert
      expect(repository.findById(teacher.id), isNull);
    });
    test("Should remove null", () {
      // Arrange
      Teacher teacher = TeacherMother.random();

      // Act
      repository.save(teacher);

      // Assert
      expect(repository.findById(teacher.id), isNotNull);
      repository.delete(teacher.id);
      expect(repository.findById(teacher.id), isNull);
    });
  });
}