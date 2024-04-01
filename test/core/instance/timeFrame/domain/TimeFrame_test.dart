import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../../core/instance/timeFrame/domain/TimeFrame.dart';
import '../../../../../core/shared/domain/Time.dart';
import '../../../../../core/shared/domain/TimeDuration.dart';
import '../../../../shared/domain/TimeMother.dart';

void main(){
  group("Domain TimeFrame", () {
    group("Constructor ", () {
      test("Should have only start time", () {
        // Arrange
        var time = TimeMother.random();

        // Act
        TimeFrame timeFrame = TimeFrame.createEmpty(time);

        // Assert
        expect(timeFrame.start, equals(time));
        expect(timeFrame.totalBreaksTimes(), isZero);
        expect(timeFrame.totalTeachingSessions(), isZero);
        expect(timeFrame.totalStopsTimes(), isZero);
      });
    });
    group("Sections", () {
      test("Should create number Teaching sessions", () {
        // Arrange
        TimeFrame    timeFrame      = TimeFrame.createEmpty(TimeMother.random());
        int          numberSessions = 6;
        TimeDuration duration       = TimeDuration.create(2, 0);

        // Act
        timeFrame.addTeachingSessions(numberSessions, duration);

        // Assert
        expect(timeFrame.totalTeachingSessions(), equals(numberSessions));
      });
      test("Should create number Teaching sessions with correct time", () {
        // Arrange
        TimeFrame    timeFrame           = TimeFrame.createEmpty(TimeMother.create(8, 0));
        int          numberSessions      = 3;
        TimeDuration duration            = TimeDuration.create(2, 0);
        List<Time>   sessionsStartExpect = [Time(8,0), Time(10,0), Time(12,0)];

        // Act
        timeFrame.addTeachingSessions(numberSessions, duration);
        var sessionsStartResult = timeFrame.startTeachingSessions();

        // Assert
        expect(sessionsStartExpect, equals(sessionsStartResult));
      });
      test("Should modify ranges Teaching sessions and add Break time", () {
        // Arrange
        TimeFrame timeFrame               = TimeFrame.createEmpty(TimeMother.create(8, 0));
        var       numberSessions          = 6;
        var       duration                = TimeDuration.create(2, 0);
        var       expectTeachingSessions  = [Time(8,0), Time(10,0), Time(12,0), Time(15,0), Time(17,0), Time(19,0)];
        var       expectBreakTime         = [Time(14,0)];
        var       afterNumberSession      = 3;
        var       durationBreakTime       = TimeDuration.create(1, 0);

        // Act
        timeFrame.addTeachingSessions(numberSessions, duration);
        timeFrame.addBreakTime(afterNumberSession, durationBreakTime);

        // Assert
        expect(expectTeachingSessions, equals(timeFrame.startTeachingSessions()));
        expect(expectBreakTime, equals(timeFrame.startBreaksTime()));
      });
    });
    test("Should modify ranges Teaching sessions and add couple Break time", () {
      // Arrange
      TimeFrame timeFrame               = TimeFrame.createEmpty(TimeMother.create(8, 0));
      var       numberSessions          = 6;
      var       duration                = TimeDuration.create(2, 0);
      var       expectTeachingSessions  = [Time(8,0), Time(10,0), Time(13,0), Time(15,0), Time(18,0), Time(20,0)];
      var       expectBreakTime         = [Time(12,0), Time(17,0)];
      var       afterNumberSession      = [2, 4];
      var       durationBreakTime       = TimeDuration.create(1, 0);

      // Act
      timeFrame.addTeachingSessions(numberSessions, duration);
      timeFrame.addBreakTime(afterNumberSession[0], durationBreakTime);
      timeFrame.addBreakTime(afterNumberSession[1], durationBreakTime);

      // Assert
      expect(expectTeachingSessions, equals(timeFrame.startTeachingSessions()));
      expect(expectBreakTime, equals(timeFrame.startBreaksTime()));
    });
    test("Should modify ranges Teaching sessions and add couple Stops time", () {
      // Arrange
      TimeFrame timeFrame               = TimeFrame.createEmpty(TimeMother.create(8, 0));
      var       numberSessions          = 6;
      var       duration                = TimeDuration.create(2, 0);
      var       expectTeachingSessions  = [Time(8, 0), Time(10, 10), Time(12, 20), Time(14, 30), Time(16, 40), Time(18, 50)];
      var       expectStopsTime         = [Time(10, 0), Time(12, 10), Time(14, 20), Time(16, 30), Time(18, 40)];
      var       durationStopTime        = TimeDuration.create(0, 10);

      // Act
      timeFrame.addTeachingSessions(numberSessions, duration);
      timeFrame.addStopsTime(durationStopTime);

      // Assert
      expect(expectTeachingSessions, equals(timeFrame.startTeachingSessions()));
      expect(expectStopsTime, equals(timeFrame.startStopsTime()));
    });
  });
}