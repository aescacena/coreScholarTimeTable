
import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/src/core/instance/department/infrastructure/InMemoryDepartmentRepository.dart';

import '../../../shared/infrastructure/DirectoryFileRepository.dart';

void main(){
  late InMemoryDepartmentRepository repository;

  setUp((){
    repository = InMemoryDepartmentRepository.create(DirectoryFileRepository());
  });

  group("Repository Department", () {
    test("Should return all Departments", () async{
      // Arrange

      // Act
      var found = await repository.searchAll();

      // Assert
      expect(found.isNotEmpty, true);
    });
    test("Should return exist Department", () async{
      // Arrange

      // Act
      var allDepartments = await repository.searchAll();
      var found          = await repository.findById(allDepartments[0].id);

      // Assert
      expect(found, isNotNull);
    });
    test("Should return null", () async{
      // Arrange

      // Act
      var found = await repository.findById("NOT_EXISTE");

      // Assert
      expect(found, isNull);
    });
  });
}