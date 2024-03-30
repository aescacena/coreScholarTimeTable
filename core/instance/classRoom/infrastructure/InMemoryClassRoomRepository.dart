
import '../domain/ClassRoom.dart';
import '../domain/ClassRoomRepository.dart';

class InMemoryClassRoomRepository extends ClassRoomRepository{
  Map<String, ClassRoom> _classRoom = new Map();

  @override
  void delete(String id) {
    _classRoom.remove(id);
  }

  @override
  void save(ClassRoom classRoom) {
    _classRoom.putIfAbsent(classRoom.id, () => classRoom);
  }

  @override
  List<ClassRoom> searchAll() {
    return List<ClassRoom>.from(_classRoom.values);
  }

  @override
  ClassRoom? findById(String id) {
    return _classRoom.containsKey(id) ? _classRoom[id] : null;
  }
}