class Dates{
  static String today(){
    return Dates._dateTimeToString(DateTime.now());
  }

  static String addDay(String date){
    return Dates.addDaysFromString(date, 1);
  }

  static List<String> daysFrom(String date, int totalDays){
    List<String> dates = [date];
    for(int i = 1; i < totalDays; i++){
      dates.add(Dates.addDaysFromString(date, i));
    }
    return dates;
  }

  static String _dateTimeToString(DateTime date){
    String year  = date.year.toString();
    String month = date.month.toString().padLeft(2, '0');  // Asegura que el mes tenga dos dígitos
    String day   = date.day.toString().padLeft(2, '0');  // Asegura que el día tenga dos dígitos
    return '$year-$month-$day';
  }

  static DateTime _stringToDateTime(String date){
    List<String> parts = date.split('-');
    if (parts.length != 3) {
      throw Exception('Formato de fecha inválido');
    }
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);

    return DateTime(year, month, day);
  }

  static String addDaysFromDateTime(DateTime date, int numberDays){
    return Dates._dateTimeToString(date.add(Duration(days: numberDays)));
  }

  static String addDaysFromString(String date, int numberDays){
    return Dates.addDaysFromDateTime(Dates._stringToDateTime(date), numberDays);
  }
}