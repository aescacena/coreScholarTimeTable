import 'ClassRoomType.dart';

class ClassRoom{
  final String        id;
  final String        name;
  final ClassRoomType type;

  ClassRoom(this.id, this.name, this.type);

  static createGeneral(String id, String name){
    return ClassRoom(id, name, ClassRoomType.GENERAL);
  }

  static createSpecific(String id, String name){
    return ClassRoom(id, name, ClassRoomType.SPECIFIC);
  }
}