class CalendarDay{
  final String date;
  List<int>    subjects;

  CalendarDay._(this.date, this.subjects);

  static CalendarDay emptyDay(String date){
    return CalendarDay._(date, []);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarDay &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          subjects == other.subjects;

  @override
  int get hashCode => date.hashCode ^ subjects.hashCode;
}