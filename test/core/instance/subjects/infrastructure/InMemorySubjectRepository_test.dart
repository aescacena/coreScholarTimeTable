import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../../core/instance/subjects/domain/Subject.dart';
import '../../../../../core/instance/subjects/infrastructure/InMemorySubjectRepository.dart';
import '../domain/SubjectMother.dart';

void main(){
  late InMemorySubjectRepository repository;

  setUp((){
    repository = new InMemorySubjectRepository();
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