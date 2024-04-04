import 'TeachingSession.dart';

abstract class TeachingSessionRepository{
  TeachingSession? findById(String id);
  List<TeachingSession> searchAll();
  void save(TeachingSession session);
  void delete(String id);
}