class CalendarDay{
  final String    date;
  List<int> subjects;

  CalendarDay._(this.date, this.subjects);

  static CalendarDay emptyDay(String date){
    return CalendarDay._(date, []);
  }
}