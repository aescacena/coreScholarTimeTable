import '../../../shared/domain/Time.dart';
import '../../../shared/domain/TimeDuration.dart';

class TimeFrameSession{
  final int  numberSession;
  final Time start;
  final Time end;

  TimeFrameSession._(this.numberSession, this.start, this.end);

  static TimeFrameSession create(int numberSession, Time start, Time end){
    return TimeFrameSession._(numberSession, start, end);
  }

  static TimeFrameSession withDuration(int numberSession, Time start, TimeDuration duration){
    return TimeFrameSession._(numberSession, start, start.addTimeDuration(duration));
  }
}