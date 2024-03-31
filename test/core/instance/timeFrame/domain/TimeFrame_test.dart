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
        expect(timeFrame.totalSessions(), isZero);
        expect(timeFrame.totalStopsTimes(), isZero);
      });
    });
    group("Sessions", () {
      test("Should create number sessions", () {
        // Arrange
        TimeFrame    timeFrame      = TimeFrame.createEmpty(TimeMother.random());
        int          numberSessions = 6;
        Time         startSessions  = TimeMother.create(1, 0);
        TimeDuration duration       = TimeDuration.create(2, 0);

        // Act
        timeFrame.addSessions(numberSessions, startSessions, duration);

        // Assert
        expect(timeFrame.totalSessions(), equals(numberSessions));
      });
      test("Should create number sessions with correct time", () {
        // Arrange
        TimeFrame    timeFrame      = TimeFrame.createEmpty(TimeMother.random());
        int          numberSessions = 6;
        Time         startSessions  = TimeMother.create(1, 0);
        TimeDuration duration       = TimeDuration.create(2, 0);

        // Act
        timeFrame.addSessions(numberSessions, startSessions, duration);

        // Assert
        expect(true, equals(false));
      });
    });
  });
}