import 'package:scholar_time_table_app/core/instance/assignments/schedule/domain/ScheduleTimeFrame.dart';

class ScheduleTimeFrameMother{
  static ScheduleTimeFrame create(int id, int period, int turn){
    return new ScheduleTimeFrame(id, period, turn);
  }
  
  static List<ScheduleTimeFrame> withDaysAndPeriodPerTurn(int days, int periodPerTurn){
    List<ScheduleTimeFrame> timeFrame = [];
    for(var day = 0; day < days; day++){
      timeFrame.addAll(List.generate(periodPerTurn, (index) => ScheduleTimeFrame(day, (index), 0)));
      timeFrame.addAll(List.generate(periodPerTurn, (index) => ScheduleTimeFrame(day, (index), 1)));
    }
    return timeFrame;
  }
}