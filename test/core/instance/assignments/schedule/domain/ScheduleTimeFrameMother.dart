import '../../../../../../core/instance/assignments/schedule/domain/ScheduleTimeFrame.dart';

class ScheduleTimeFrameMother{
  static ScheduleTimeFrame create(int id, int period){
    return new ScheduleTimeFrame(id, period);
  }
  
  static List<ScheduleTimeFrame> withPeriodPerDay(int days, int periodPerDay){
    List<ScheduleTimeFrame> timeFrame = [];
    for(var day = 0; day < days; day++){
      timeFrame.addAll(List.generate(periodPerDay, (index) => ScheduleTimeFrame(day, (index + 1))));
    }
    return timeFrame;
  }
}