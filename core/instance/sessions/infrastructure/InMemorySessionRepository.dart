import '../domain/Session.dart';
import '../domain/SessionRepository.dart';

class InMemorySessionRepository implements SessionRepository{
  Map<String, Session> _sessions = new Map();
  
  @override
  void delete(String id) {
    _sessions.remove(id);
  }

  @override
  Session? findById(String id) {
    return _sessions.containsKey(id) ? _sessions[id] : null;
  }

  @override
  void save(Session session) {
    _sessions.putIfAbsent(session.id, () => session);
  }

  @override
  List<Session> searchAll() {
    return List<Session>.from(_sessions.values);
  }
  
}