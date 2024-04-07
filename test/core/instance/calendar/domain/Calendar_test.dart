import 'package:faker/faker.dart';
import 'package:test/test.dart';

import '../../../../../core/instance/calendar/domain/Calendar.dart';

void main(){
  group("Constructor", () {
    test("Should create empty calendar with days indicated", () {
      // Arrange
      List<String> dates = ["2024-05-01", "2024-05-02", "2024-05-03", "2024-05-04", "2024-05-05"];

      // Act
      Calendar calendar = Calendar.createWith(faker.randomGenerator.integer(99), dates[0], 5);

      // Assert
      expect(calendar.dates(), dates);
    });
  });
  group("Subjects", () {
    test("Should add subject on first day", () {
      // Arrange

      // Act

      // Assert
      expect(true, isFalse);
    });
    test("Should add subject day selected", () {
      // Arrange

      // Act

      // Assert
      expect(true, isFalse);
    });
    test("Should remove subject on day", () {
      // Arrange

      // Act

      // Assert
      expect(true, isFalse);
    });
    test("Should change subject of day", () {
      // Arrange

      // Act

      // Assert
      expect(true, isFalse);
    });
    test("Should swap subjects", () {
      // Arrange

      // Act

      // Assert
      expect(true, isFalse);
    });
  });
}