import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/src/core/instance/subjects/domain/Subject.dart';
import 'package:scholar_time_table_app/src/core/instance/subjects/infrastructure/InMemorySubjectRepository.dart';

import '../domain/SubjectMother.dart';

void main(){
  late InMemorySubjectRepository repository;

  setUp((){
    repository = InMemorySubjectRepository.empty();
  });

  group("Constructor", () {
    test("Should create Empty", () {
      // Arrange

      // Act
      repository = InMemorySubjectRepository.empty();

      // Assert
      expect(repository.searchAll().isEmpty, isTrue);
    });
    test("Should create from List", () {
      // Arrange
      var subjects = SubjectMother.randomList();

      // Act
      repository = InMemorySubjectRepository.create(subjects);

      // Assert
      expect(repository.searchAll(), subjects);
    });
    test("Should create from File", () {
      // Arrange
      var file = File(Directory.current.path+'/lib/src/core/resource/data/Subjects.json');

      // Act
      repository = InMemorySubjectRepository.fromFile(file);

      // Assert
      expect(repository.searchAll().isNotEmpty, isTrue);
    });
  });
  group("Repository Subjects", () {
    test("Should save Subject", () {
      // Arrange
      Subject subject = SubjectMother.random();

      // Act
      repository.save(subject);

      // Assert
    });
    test("Should return all Subjects", () {
      // Arrange
      List<Subject> subjects = SubjectMother.randomList();

      // Act
      subjects.forEach((element) => repository.save(element));
      List<Subject> subjectsFound = repository.searchAll();

      // Assert
      expect(subjects, containsAll(subjectsFound));
    });
    test("Should return exist Subject", () {
      // Arrange
      Subject subject = SubjectMother.random();

      // Act
      repository.save(subject);

      // Assert
      expect(repository.findById(subject.id), isNotNull);
    });
    test("Should return null", () {
      // Arrange
      Subject subject = SubjectMother.random();

      // Act

      // Assert
      expect(repository.findById(subject.id), isNull);
    });
    test("Should remove null", () {
      // Arrange
      Subject subject = SubjectMother.random();

      // Act
      repository.save(subject);

      // Assert
      expect(repository.findById(subject.id), isNotNull);
      repository.delete(subject.id);
      expect(repository.findById(subject.id), isNull);
    });
  });
}