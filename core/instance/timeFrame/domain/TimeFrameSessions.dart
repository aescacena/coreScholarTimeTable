import '../../../shared/domain/Time.dart';

class TimeFrameSessions{
  final Time start;
  final int  numberSessions;
  final Time timeBetweenSessions;

  TimeFrameSessions(this.start, this.numberSessions, this.timeBetweenSessions);
}