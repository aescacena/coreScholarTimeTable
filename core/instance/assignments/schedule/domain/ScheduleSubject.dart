class ScheduleSubject{
  final String    id;
  final List<int> sessions;

  ScheduleSubject(this.id, this.sessions);

  int totalSessions(){
    return sessions.length;
  }
}