import '../../../../src/core/shared/domain/TimeDuration.dart';

class Time{
  final int hour;
  final int minutes;

  Time(this.hour, this.minutes);

  Time addTime(int hour, int minutes){
    var actualTime = DateTime(2024, 1, 1, this.hour, this.minutes);
    var timeResult = actualTime.add(Duration(hours: hour, minutes: minutes));
    return Time(timeResult.hour, timeResult.minute);
  }

  Time addTimeDuration(TimeDuration duration){
    var actualTime = DateTime(2024, 1, 1, this.hour, this.minutes);
    var timeResult = actualTime.add(Duration(hours: duration.hour, minutes: duration.minutes));
    return Time(timeResult.hour, timeResult.minute);
  }

  int diff(Time time){
    var actualTime = DateTime(2024, 1, 1, this.hour, this.minutes);
    return actualTime.difference(DateTime(2024, 1, 1, time.hour, time.minutes)).inMinutes;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Time &&
          runtimeType == other.runtimeType &&
          hour == other.hour &&
          minutes == other.minutes;

  @override
  int get hashCode => hour.hashCode ^ minutes.hashCode;

  @override
  String toString() {
    return 'Time{hour: $hour, minutes: $minutes}';
  }
}