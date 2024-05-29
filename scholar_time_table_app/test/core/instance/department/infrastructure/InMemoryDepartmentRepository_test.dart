
import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/core/instance/department/domain/Department.dart';
import 'package:scholar_time_table_app/core/instance/department/infrastructure/InMemoryDepartmentRepository.dart';

import '../domain/DepartmentMother.dart';

void main(){
  late InMemoryDepartmentRepository repository;

  setUp((){
    repository = new InMemoryDepartmentRepository();
  });

  group("Repository Department", () {
    test("Should save Department", () {
      // Arrange
      Department department = DepartmentMother.random();

      // Act
      repository.save(department);

      // Assert
    });
    test("Should return all Departments", () {
      // Arrange
      List<Department> departments = DepartmentMother.randomList();

      // Act
      departments.forEach((element) => repository.save(element));
      List<Department> departmentsFound = repository.searchAll();

      // Assert
      expect(departments, containsAll(departmentsFound));
    });
    test("Should return exist Department", () {
      // Arrange
      Department department = DepartmentMother.random();

      // Act
      repository.save(department);

      // Assert
      expect(repository.findById(department.id), isNotNull);
    });
    test("Should return null", () {
      // Arrange
      Department department = DepartmentMother.random();

      // Act

      // Assert
      expect(repository.findById(department.id), isNull);
    });
    test("Should remove null", () {
      // Arrange
      Department department = DepartmentMother.random();

      // Act
      repository.save(department);

      // Assert
      expect(repository.findById(department.id), isNotNull);
      repository.delete(department.id);
      expect(repository.findById(department.id), isNull);
    });
  });
}