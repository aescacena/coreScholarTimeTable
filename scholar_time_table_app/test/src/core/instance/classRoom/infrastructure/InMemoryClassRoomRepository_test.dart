import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/src/core/instance/classRoom/domain/ClassRoom.dart';
import 'package:scholar_time_table_app/src/core/instance/classRoom/infrastructure/InMemoryClassRoomRepository.dart';

import '../domain/ClassRoomMother.dart';

void main(){
  late InMemoryClassRoomRepository repository;

  setUp((){
    repository = new InMemoryClassRoomRepository();
  });

  group("Repository ClassRoom", () {
    test("Should save ClassRoom", () {
      // Arrange
      ClassRoom classRoom = ClassRoomMother.random();

      // Act
      repository.save(classRoom);

      // Assert
    });
    test("Should return all ClassRooms", () {
      // Arrange
      List<ClassRoom> classRoom = ClassRoomMother.randomList();

      // Act
      classRoom.forEach((element) => repository.save(element));
      List<ClassRoom> classRoomFound = repository.searchAll();

      // Assert
      expect(classRoom, containsAll(classRoomFound));
    });
    test("Should return exist ClassRoom", () {
      // Arrange
      ClassRoom classRoom = ClassRoomMother.random();

      // Act
      repository.save(classRoom);

      // Assert
      expect(repository.findById(classRoom.id), isNotNull);
    });
    test("Should return null", () {
      // Arrange
      ClassRoom classRoom = ClassRoomMother.random();

      // Act

      // Assert
      expect(repository.findById(classRoom.id), isNull);
    });
    test("Should remove null", () {
      // Arrange
      ClassRoom classRoom = ClassRoomMother.random();

      // Act
      repository.save(classRoom);

      // Assert
      expect(repository.findById(classRoom.id), isNotNull);
      repository.delete(classRoom.id);
      expect(repository.findById(classRoom.id), isNull);
    });
  });
}