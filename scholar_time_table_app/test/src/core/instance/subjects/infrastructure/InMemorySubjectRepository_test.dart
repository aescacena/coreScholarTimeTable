import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/src/core/instance/subjects/infrastructure/InMemorySubjectRepository.dart';

import '../../../shared/infrastructure/DirectoryFileRepository.dart';
import '../domain/SubjectIdMother.dart';

void main(){
  late InMemorySubjectRepository repository;

  setUp((){
    repository = InMemorySubjectRepository.create(DirectoryFileRepository());
  });

  group("Repository Subjects", () {
    test("Should return all Subjects", () async{
      // Arrange

      // Act
      var found = await repository.searchAll();

      // Assert
      expect(found.isNotEmpty, true);
    });
    test("Should return exist Subject", () async{
      // Arrange

      // Act
      var allSubjects = await repository.searchAll();
      var found       = await repository.findById(allSubjects[0].id);

      // Assert
      expect(found, isNotNull);
    });
    test("Should return null", () async{
      // Arrange

      // Act
      var found = await repository.findById(SubjectIdMother.random());

      // Assert
      expect(found, isNull);
    });
  });
}