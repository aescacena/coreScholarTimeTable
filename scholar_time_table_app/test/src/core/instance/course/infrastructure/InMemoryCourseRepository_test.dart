
import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/src/core/instance/course/infrastructure/InMemoryCourseRepository.dart';

import '../../../shared/infrastructure/DirectoryFileRepository.dart';

void main(){
  late InMemoryCourseRepository repository;

  setUp((){
    repository = InMemoryCourseRepository.create(DirectoryFileRepository());
  });

  group("Repository Courses", () {
    test("Should return all Courses", () async{
      // Arrange

      // Act
      var coursesFound = await repository.searchAll();

      // Assert
      expect(coursesFound.isNotEmpty, true);
    });
    test("Should return exist Course", () async{
      // Arrange

      // Act
      var allCourses = await repository.searchAll();
      var found      = await repository.findById(allCourses[0].id);

      // Assert
      expect(found, isNotNull);
    });
    test("Should return null", () async{
      // Arrange

      // Act
      var found = await repository.findById("NO_EXISTE");

      // Assert
      expect(found, isNull);
    });
  });
}