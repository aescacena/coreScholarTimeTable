import 'package:faker/faker.dart';
import 'package:test/test.dart';

import '../../../../../core/instance/calendar/domain/Calendar.dart';
import '../../../../shared/infrastructure/UuidGeneratorMother.dart';
import 'CalendarIdMother.dart';
import 'CalendarMother.dart';

void main(){
  group("Constructor", () {
    test("Should create empty calendar with days indicated", () {
      // Arrange
      var dates      = ["2024-05-01", "2024-05-02", "2024-05-03", "2024-05-04", "2024-05-05"];
      var numberDays = 5;

      // Act
      Calendar calendar = Calendar.createWithNumberOfDays(CalendarIdMother.random(), dates[0], numberDays);

      // Assert
      expect(calendar.dates(), dates);
    });
  });
  group("Sessions", () {
    test("Should add session on first day of empty Calendar", () {
      // Arrange
      var dates      = ["2024-05-01", "2024-05-02", "2024-05-03", "2024-05-04", "2024-05-05"];
      var numberDays = 5;
      var calendar   = Calendar.createWithNumberOfDays(CalendarIdMother.random(), dates[0], numberDays);
      var sessionId  = UuidGeneratorMother.random();
      
      // Act
      var newCalendar = calendar.addSessionOn(dates[0], sessionId);

      // Assert
      expect(newCalendar.sessionsOn(dates[0]), contains(sessionId));
    });
    test("Should not add session because not exist date", () {
      // Arrange
      var dates        = ["2024-05-01", "2024-05-02", "2024-05-03", "2024-05-04", "2024-05-05"];
      var numberDays   = 5;
      var calendar     = Calendar.createWithNumberOfDays(CalendarIdMother.random(), dates[0], numberDays);
      var sessionId    = UuidGeneratorMother.random();
      var dateToSearch = "2025-05-01";

      // Act
      var newCalendar = calendar.addSessionOn(dateToSearch, sessionId);

      // Assert
      expect(newCalendar.sessionsOn(dateToSearch), isEmpty);
    });
    test("Should add session day selected", () {
      // Arrange
      var dates        = ["2024-05-01", "2024-05-02", "2024-05-03", "2024-05-04", "2024-05-05"];
      var numberDays   = 5;
      var calendar     = Calendar.createWithNumberOfDays(CalendarIdMother.random(), dates[0], numberDays);
      var sessionId    = UuidGeneratorMother.random();
      var dateToSearch = "2024-05-02";

      // Act
      var newCalendar = calendar.addSessionOn(dateToSearch, sessionId);

      // Assert
      expect(newCalendar.sessionsOn(dateToSearch), isNotEmpty);
    });
    test("Should remove session on day", () {
      // Arrange
      var dates             = ["2024-05-01", "2024-05-02", "2024-05-03", "2024-05-04", "2024-05-05"];
      var calendar          = CalendarMother.withDates(dates);
      var dateToSearch      = "2024-05-02";
      var sessionsToRemove = calendar.sessionsOn(dateToSearch).first;

      // Act
      var newCalendar = calendar.removeSessionOn(dateToSearch, sessionsToRemove);

      // Assert
      expect(newCalendar.sessionsOn(dateToSearch), isNot(contains(sessionsToRemove)));
    });
    test("Should change session of day", () {
      // Arrange
      var dates           = ["2024-05-01", "2024-05-02", "2024-05-03", "2024-05-04", "2024-05-05"];
      var calendar        = CalendarMother.withDates(dates);
      var initialDate     = "2024-05-02";
      var finalDate       = "2024-05-05";
      var sessions        = calendar.sessionsOn(initialDate);
      var sessionToChange = sessions.elementAt(faker.randomGenerator.integer(sessions.length, min: 0));

      // Act
      var newCalendar = calendar.changeSessionDate(sessionToChange, initialDate, finalDate);

      // Assert
      expect(newCalendar.sessionsOn(initialDate), isNot(contains(sessionToChange)));
      expect(newCalendar.sessionsOn(finalDate), contains(sessionToChange));
    });
    test("Should swap subjects", () {
      // Arrange
      var dates                = ["2024-05-01", "2024-05-02", "2024-05-03", "2024-05-04", "2024-05-05"];
      var calendar             = CalendarMother.withDates(dates);
      var date1                = "2024-05-02";
      var sessionsDate1        = calendar.sessionsOn(date1);
      var sessionDate1Selected = sessionsDate1.elementAt(faker.randomGenerator.integer(sessionsDate1.length, min: 0));
      var date2                = "2024-05-05";
      var sessionsDate2        = calendar.sessionsOn(date2);
      var sessionDate2Selected = sessionsDate2.elementAt(faker.randomGenerator.integer(sessionsDate2.length, min: 0));

      // Act
      var newCalendar = calendar.swapSessionsBetweenDays(date1, sessionDate1Selected, date2, sessionDate2Selected);

      // Assert
      expect(newCalendar.sessionsOn(date1), isNot(contains(sessionDate1Selected)));
      expect(newCalendar.sessionsOn(date1), contains(sessionDate2Selected));
      expect(newCalendar.sessionsOn(date2), isNot(contains(sessionDate2Selected)));
      expect(newCalendar.sessionsOn(date2), contains(sessionDate1Selected));
    });
  });
}