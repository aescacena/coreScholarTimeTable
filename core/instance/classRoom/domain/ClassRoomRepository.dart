import 'ClassRoom.dart';

abstract class ClassRoomRepository{
  ClassRoom? findById(String id);
  List<ClassRoom> searchAll();
  void save(ClassRoom classRoom);
  void delete(String id);
}