import 'TimeFrame.dart';

abstract class TimeFrameRepository{
  TimeFrame? findById(String id);
  List<TimeFrame> searchAll();
  void save(TimeFrame timeFrame);
  void delete(String id);
}