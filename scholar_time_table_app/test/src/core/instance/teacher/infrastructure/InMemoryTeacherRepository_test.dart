import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/src/core/instance/teacher/infrastructure/InMemoryTeacherRepository.dart';

import '../../../shared/infrastructure/DirectoryFileRepository.dart';

void main(){
  late InMemoryTeacherRepository repository;

  setUp((){
    repository = InMemoryTeacherRepository.create(DirectoryFileRepository());
  });

  group("Repository Teachers", () {
    test("Should return all Teachers", () async{
      // Arrange

      // Act
      var result = await repository.searchAll();

      // Assert
      expect(result.isNotEmpty, true);
    });
    test("Should return exist Teacher", () async{
      // Arrange

      // Act
      var allTeachers = await repository.searchAll();
      var found       = await repository.findById(allTeachers[0].id);

      // Assert
      expect(found, isNotNull);
    });
    test("Should return null because not found", () async{
      // Arrange

      // Act
      var found = await repository.findById("NO_EXISTE");

      // Assert
      expect(found, isNull);
    });
  });
}