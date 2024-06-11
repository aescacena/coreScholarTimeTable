import 'package:faker/faker.dart';
import 'package:scholar_time_table_app/src/core/instance/classRoom/domain/ClassRoom.dart';

import '../../../../../src/core/shared/infrastructure/UuidGeneratorMother.dart';
import 'ClassRoomTypeMother.dart';

class ClassRoomMother{
  static ClassRoom random(){
    return ClassRoom(
        UuidGeneratorMother.random(),
        faker.company.name(),
        ClassRoomTypeMother.random());
  }

  static List<ClassRoom> randomList(){
    List<ClassRoom> classRooms = [];
    int          total   = faker.randomGenerator.integer(10);
    int          i       = 0;
    while(i < total){
      var classRoom = random();
      if(!classRooms.any((element) => element.id == classRoom.id)){
        classRooms.add(classRoom);
        i++;
      }
    }
    return classRooms;
  }
}