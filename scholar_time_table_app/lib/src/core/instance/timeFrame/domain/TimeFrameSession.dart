import '../../../../../src/core/shared/domain/Time.dart';
import '../../../../../src/core/shared/domain/TimeDuration.dart';
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

  TimeFrameSection addNewStart(Time start){
    return TimeFrameSection._(start, start.addTimeDuration(TimeDuration.create(0, this.duration())), this.type);
  }

  bool isTeachingSession(){
    return this.type == TimeFrameSectionType.TEACHING_SESSION;
  }

  bool isBreakTime(){
    return this.type == TimeFrameSectionType.BREAK_TIME;
  }

  bool isStopTime(){
    return this.type == TimeFrameSectionType.STOP_TIME;
  }

  int duration(){
    return this.start.diff(this.end).abs();
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