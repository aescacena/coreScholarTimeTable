import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../../core/instance/sessions/domain/Session.dart';
import '../../../../../core/instance/sessions/infrastructure/InMemorySessionRepository.dart';
import '../domain/SessionMother.dart';

void main(){
  late InMemorySessionRepository repository;

  setUp((){
    repository = new InMemorySessionRepository();
  });

  group("Repository Session", () {
    test("Should save Department", () {
      // Arrange
      Session session = SessionMother.random();

      // Act
      repository.save(session);

      // Assert
    });
    test("Should return all Sessions", () {
      // Arrange
      List<Session> sessions = SessionMother.randomList();

      // Act
      sessions.forEach((element) => repository.save(element));
      List<Session> sessionsFound = repository.searchAll();

      // Assert
      expect(sessions, containsAll(sessionsFound));
    });
    test("Should return exist Session", () {
      // Arrange
      Session session = SessionMother.random();

      // Act
      repository.save(session);

      // Assert
      expect(repository.findById(session.id), isNotNull);
    });
    test("Should return null", () {
      // Arrange
      Session session = SessionMother.random();

      // Act

      // Assert
      expect(repository.findById(session.id), isNull);
    });
    test("Should remove null", () {
      // Arrange
      Session session = SessionMother.random();

      // Act
      repository.save(session);

      // Assert
      expect(repository.findById(session.id), isNotNull);
      repository.delete(session.id);
      expect(repository.findById(session.id), isNull);
    });
  });
}