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
    group("Sessions", () {
      test("Should create number sessions", () {
        // Arrange
        TimeFrame    timeFrame      = TimeFrame.createEmpty(TimeMother.random());
        int          numberSessions = 6;
        TimeDuration duration       = TimeDuration.create(2, 0);

        // Act
        timeFrame.addTeachingSessions(numberSessions, duration);

        // Assert
        expect(timeFrame.totalTeachingSessions(), equals(numberSessions));
      });
      test("Should create number sessions with correct time", () {
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
  });
}