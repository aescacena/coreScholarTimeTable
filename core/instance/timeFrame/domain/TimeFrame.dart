import 'dart:math';

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
    var teachingSessions = _searchAllType(TimeFrameSectionType.TEACHING_SESSION);
    if(teachingSessions.isEmpty || teachingSessions.length < afterNumberTeachingSession){
      return;
    }
    var teachingReference = teachingSessions[afterNumberTeachingSession - 1];
    List<TimeFrameSection> sessions = [];
    for(int actual = 0; actual < _sections.length; actual++){
      if(actual == 0){
        sessions.add(_sections[actual]);
      }else{
        if(_sections[actual] == teachingReference){
          sessions.add(_sections[actual].addNewStart(sessions.last.end));
          sessions.add(TimeFrameSection.createBreakTime(sessions.last.end, duration));
        }else{
          if(sessions.last.isBreakTime() && _sections[actual].isStopTime()){
            continue;
          }
          sessions.add(_sections[actual].addNewStart(sessions.last.end));
        }
      }
    }
    this._sections = sessions;
  }

  void addStopsTime(TimeDuration duration) {
    List<TimeFrameSection> sections = [];
    for(int i = 0; i < _sections.length; i++){
      if(_sections[i].isTeachingSession()){
        if(i == 0){
          sections.add(_sections[i]);
        }else{
          if(_sections[i - 1].isTeachingSession()){
            sections.add(TimeFrameSection.createStopTime(sections.last.end, duration));
          }
          var teachingSession = _sections[i];
          teachingSession = teachingSession.addNewStart(sections.last.end);
          sections.add(teachingSession);
        }
      }
      if(_sections[i].isBreakTime()){
        sections.add(_sections[i].addNewStart(sections.last.end));
      }
    }
    this._sections = sections;
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
    return _searchAllType(type).map((e) => e.start).toList();
  }

  int _countType(TimeFrameSectionType type){
    return _searchAllType(type).length;
  }

  List<TimeFrameSection> _searchAllType(TimeFrameSectionType type){
    return this._sections.where((element) => element.type == type).toList();
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