import 'Session.dart';

abstract class SessionRepository{
  Session? findById(String id);
  List<Session> searchAll();
  void save(Session session);
  void delete(String id);
}