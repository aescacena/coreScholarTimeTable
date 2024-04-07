import '../domain/TimeFrame.dart';
import '../domain/TimeFrameRepository.dart';

class InMemoryTimeFrameRepository implements TimeFrameRepository{
  Map<String, TimeFrame> _frames = new Map();
  
  @override
  void delete(String id) {
    _frames.remove(id);
  }

  @override
  TimeFrame? findById(String id) {
    return _frames.containsKey(id) ? _frames[id] : null;
  }

  @override
  void save(TimeFrame timeFrame) {
    _frames.putIfAbsent(timeFrame.id, () => timeFrame);
  }

  @override
  List<TimeFrame> searchAll() {
    return List<TimeFrame>.from(_frames.values);
  }
  
}