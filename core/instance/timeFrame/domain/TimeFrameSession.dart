import '../../../shared/domain/Time.dart';
import '../../../shared/domain/TimeDuration.dart';
import 'TimeFrameType.dart';

class TimeFrameSection{
  final Time                 start;
  final Time                 end;
  final TimeFrameSectionType type;

  TimeFrameSection._(this.start, this.end, this.type);

  static TimeFrameSection createTeachingSession(Time start, TimeDuration duration){
    return TimeFrameSection._(start, start.addTimeDuration(duration), TimeFrameSectionType.TEACHING_SESSION);
  }

  static TimeFrameSection createBreakTime(Time start, TimeDuration duration){
    return TimeFrameSection._(start, start.addTimeDuration(duration), TimeFrameSectionType.BREAK_TIME);
  }

  static TimeFrameSection createStopTime(Time start, TimeDuration duration){
    return TimeFrameSection._(start, start.addTimeDuration(duration), TimeFrameSectionType.STOP_TIME);
  }

  TimeFrameSection changeStart(TimeDuration duration){
    return TimeFrameSection._(this.start.addTimeDuration(duration), this.end.addTimeDuration(duration), this.type);
  }

  bool isTeachingSession(){
    return this.type == TimeFrameSectionType.TEACHING_SESSION;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeFrameSection &&
          runtimeType == other.runtimeType &&
          start == other.start &&
          end == other.end &&
          type == other.type;

  @override
  int get hashCode => start.hashCode ^ end.hashCode ^ type.hashCode;
}