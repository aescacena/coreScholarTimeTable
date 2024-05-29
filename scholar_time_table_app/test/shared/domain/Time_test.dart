import 'package:flutter_test/flutter_test.dart';
import 'package:scholar_time_table_app/core/shared/domain/Time.dart';

void main(){
  group("Domain TimeFrame", () {
    group("Constructor ", () {
      test("Should create with time", () {
        // Arrange
        var hours   = 14;
        var minutes = 10;

        // Act
        var time = Time(hours, minutes);

        // Assert
        expect(time.hour, equals(hours));
        expect(time.minutes, equals(minutes));
      });
    });
    group("Functionalities", () {
      test("Add time", () {
        var time    = Time(14, 10);
        var hours   = 5;
        var minutes = 50;

        // Act
        var timeResult = time.addTime(hours, minutes);
    
        // Assert
        expect(timeResult.hour, equals(20));
        expect(timeResult.minutes, equals(0));
      });
    });
  });
}