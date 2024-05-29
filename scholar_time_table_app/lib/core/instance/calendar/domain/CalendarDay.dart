class CalendarDay{
  final String date;
  List<String> sessions;

  CalendarDay._(this.date, this.sessions);

  static CalendarDay emptyDay(String date){
    return CalendarDay._(date, []);
  }

  static CalendarDay withSessions(String date, List<String> sessions){
    return CalendarDay._(date, sessions);
  }

  static CalendarDay withNumberSessions(String date, numberSessions){
    return CalendarDay._(date, List.generate(numberSessions, (index) => numberSessions));
  }

  CalendarDay addSession(String sessionId){
    var newSessions = [...sessions, sessionId];
    return CalendarDay._(date, newSessions);
  }

  CalendarDay removeSession(String sessionId){
    var newSessions = this.sessions.where((id) => id != sessionId).toList();
    return CalendarDay._(date, newSessions);
  }

  bool contains(String sessionId){
    return this.sessions.contains(sessionId);
  }

  bool notContains(String sessionId){
    return !this.contains(sessionId);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarDay &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          sessions == other.sessions;

  @override
  int get hashCode => date.hashCode ^ sessions.hashCode;
}