import '../../../shared/domain/Time.dart';
import '../../../shared/domain/TimeDuration.dart';
import 'TimeFrameSession.dart';
import 'TimeFrameStop.dart';

class TimeFrame{
  final Time             start;
  List<TimeFrameSession> _sessions;
  List<TimeFrameStop>    _breaksTime;
  List<TimeFrameStop>    _stopsTime;

  TimeFrame._(this.start, this._sessions, this._breaksTime, this._stopsTime);

  static createEmpty(Time start){
    return TimeFrame._(start, [], [], []);
  }

  int totalSessions(){
    return this._sessions.length;
  }

  int totalBreaksTimes(){
    return this._breaksTime.length;
  }

  int totalStopsTimes(){
    return this._stopsTime.length;
  }

  void addSessions(int numberSessions, Time start, TimeDuration duration) {
    List<TimeFrameSession> sessions = [];
    var startSession = start;
    for(int i = 0; i < numberSessions; i++){
      var endSession = startSession.addTime(duration.hour, duration.minutes);
      sessions.add(TimeFrameSession.create(i, startSession, endSession));
      startSession = endSession;
    }
    this._sessions = sessions;
  }
}