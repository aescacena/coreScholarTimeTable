import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../core/shared/domain/TimeDuration.dart';

void main(){
  group("Domain TimeDuration", () {
    test("Add time", () {
      var timeDuration       = TimeDuration.create(1, 0);
      var timeToSum          = TimeDuration.create(5, 50);
      var timeDurationExpect = TimeDuration.create(6, 50);

      // Act

      // Assert
      expect(timeDurationExpect, timeDuration.sum(timeToSum));
    });
    test("Should add an hour when sum of the minutes exceeds 60 minutes", () {
      var timeDuration       = TimeDuration.create(1, 10);
      var timeToSum          = TimeDuration.create(0, 50);
      var timeDurationExpect = TimeDuration.create(2, 0);

      // Act

      // Assert
      expect(timeDurationExpect, timeDuration.sum(timeToSum));
    });
    test("Should add two hours when add an hour and the sum of the minutes exceeds 60 minutes", () {
      var timeDuration       = TimeDuration.create(1, 10);
      var timeToSum          = TimeDuration.create(1, 60);
      var timeDurationExpect = TimeDuration.create(3, 10);

      // Act

      // Assert
      expect(timeDurationExpect, timeDuration.sum(timeToSum));
    });
  });
}