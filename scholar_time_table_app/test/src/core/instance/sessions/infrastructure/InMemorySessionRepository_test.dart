import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/src/core/instance/teachingSession/domain/TeachingSession.dart';
import 'package:scholar_time_table_app/src/core/instance/teachingSession/infrastructure/InMemoryTeachingSessionRepository.dart';

import '../domain/TeachingSessionMother.dart';

void main(){
  late InMemoryTeachingSessionRepository repository;

  setUp((){
    repository = new InMemoryTeachingSessionRepository();
  });

  group("Repository Session", () {
    test("Should save Department", () {
      // Arrange
      TeachingSession session = TeachingSessionMother.random();

      // Act
      repository.save(session);

      // Assert
    });
    test("Should return all Sessions", () {
      // Arrange
      List<TeachingSession> sessions = TeachingSessionMother.randomList();

      // Act
      sessions.forEach((element) => repository.save(element));
      List<TeachingSession> sessionsFound = repository.searchAll();

      // Assert
      expect(sessions, containsAll(sessionsFound));
    });
    test("Should return exist Session", () {
      // Arrange
      TeachingSession session = TeachingSessionMother.random();

      // Act
      repository.save(session);

      // Assert
      expect(repository.findById(session.id), isNotNull);
    });
    test("Should return null", () {
      // Arrange
      TeachingSession session = TeachingSessionMother.random();

      // Act

      // Assert
      expect(repository.findById(session.id), isNull);
    });
    test("Should remove null", () {
      // Arrange
      TeachingSession session = TeachingSessionMother.random();

      // Act
      repository.save(session);

      // Assert
      expect(repository.findById(session.id), isNotNull);
      repository.delete(session.id);
      expect(repository.findById(session.id), isNull);
    });
  });
}