import '../../../shared/domain/Time.dart';
import 'TimeFrameStopType.dart';

class TimeFrameStop{
  final int               startAfterSession;
  final Time              duration;
  final TimeFrameStopType type;

  TimeFrameStop(this.startAfterSession, this.duration, this.type);

  static TimeFrameStop createStopTime(int startAfterSession, Time duration){
    return TimeFrameStop(startAfterSession, duration, TimeFrameStopType.STOP_TIME);
  }
  static TimeFrameStop createBreakTime(int startAfterSession, Time duration){
    return TimeFrameStop(startAfterSession, duration, TimeFrameStopType.BREAK_TIME);
  }

}