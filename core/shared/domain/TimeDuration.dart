class TimeDuration{
  final int hour;
  final int minutes;

  TimeDuration._(this.hour, this.minutes);

  static TimeDuration create(int hour, int minutes){
    return TimeDuration._(hour, minutes);
  }
}