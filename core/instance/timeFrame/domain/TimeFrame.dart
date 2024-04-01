import '../../../shared/domain/Time.dart';
import '../../../shared/domain/TimeDuration.dart';
import 'TimeFrameSession.dart';
import 'TimeFrameType.dart';

class TimeFrame{
  final Time             start;
  List<TimeFrameSection> _sections;

  TimeFrame._(this.start, this._sections);

  static createEmpty(Time start){
    return TimeFrame._(start, []);
  }

  int totalTeachingSessions(){
    return this._countType(TimeFrameSectionType.TEACHING_SESSION);
  }

  int totalBreaksTimes(){
    return this._countType(TimeFrameSectionType.BREAK_TIME);
  }

  int totalStopsTimes(){
    return this._countType(TimeFrameSectionType.STOP_TIME);
  }

  void addTeachingSessions(int numberSessions, TimeDuration duration) {
    List<TimeFrameSection> sessions = [];
    var startSession = start;
    for(int i = 0; i < numberSessions; i++){
      var endSession = startSession.addTime(duration.hour, duration.minutes);
      sessions.add(TimeFrameSection.createTeachingSession(startSession, duration));
      startSession = endSession;
    }
    this._sections = sessions;
  }

  void addBreakTime(int afterNumberTeachingSession, TimeDuration duration) {
    List<TimeFrameSection> sessions = [];
    for(int actual = 0; actual < _sections.length; actual++){
      if(actual < afterNumberTeachingSession){
        sessions.add(_sections[actual]);
      }else{
        if(actual == afterNumberTeachingSession){
          sessions.add(TimeFrameSection.createBreakTime(_sections[actual - 1].end, duration));
        }
        sessions.add(_sections[actual].changeStart(duration));
      }
    }
    this._sections = sessions;
  }

  List<Time> startTeachingSessions() {
    return this._startsSectionType(TimeFrameSectionType.TEACHING_SESSION);
  }

  List<Time> startBreaksTime() {
    return this._startsSectionType(TimeFrameSectionType.BREAK_TIME);
  }

  List<Time> startStopsTime() {
    return this._startsSectionType(TimeFrameSectionType.STOP_TIME);
  }

  List<Time> _startsSectionType(TimeFrameSectionType type){
    return this._sections
        .where((element) => element.type == type)
        .map((e) => e.start)
        .toList();
  }

  int _countType(TimeFrameSectionType type){
    return this._sections.where((element) => element.type == type).length;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeFrame &&
          runtimeType == other.runtimeType &&
          start == other.start &&
          _sections == other._sections;

  @override
  int get hashCode => start.hashCode ^ _sections.hashCode;
}