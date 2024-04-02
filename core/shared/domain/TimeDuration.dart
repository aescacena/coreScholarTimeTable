class TimeDuration{
  final int hour;
  final int minutes;

  TimeDuration._(this.hour, this.minutes);

  static TimeDuration create(int hour, int minutes){
    return TimeDuration._(hour, minutes);
  }

  static TimeDuration zero() {
    return TimeDuration._(0, 0);
  }

  TimeDuration sum(TimeDuration duration) {
    int actualHour    = this.hour + duration.hour;
    int actualMinutes = this.minutes + duration.minutes;
    if(actualMinutes >= 60){
      actualMinutes = actualMinutes - 60;
      return TimeDuration.create(actualHour + 1, actualMinutes);
    }
    return TimeDuration.create(actualHour, actualMinutes);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeDuration &&
          runtimeType == other.runtimeType &&
          hour == other.hour &&
          minutes == other.minutes;

  @override
  int get hashCode => hour.hashCode ^ minutes.hashCode;

  @override
  String toString() {
    return 'TimeDuration{hour: $hour, minutes: $minutes}';
  }
}