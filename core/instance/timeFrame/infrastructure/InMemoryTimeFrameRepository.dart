import '../domain/TeachingSession.dart';
import '../domain/TeachingSessionRepository.dart';

class InMemoryTeachingSessionRepository implements TeachingSessionRepository{
  Map<String, TeachingSession> _sessions = new Map();
  
  @override
  void delete(String id) {
    _sessions.remove(id);
  }

  @override
  TeachingSession? findById(String id) {
    return _sessions.containsKey(id) ? _sessions[id] : null;
  }

  @override
  void save(TeachingSession session) {
    _sessions.putIfAbsent(session.id, () => session);
  }

  @override
  List<TeachingSession> searchAll() {
    return List<TeachingSession>.from(_sessions.values);
  }
  
}