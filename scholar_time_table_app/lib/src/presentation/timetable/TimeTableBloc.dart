import 'package:scholar_time_table_app/src/presentation/timetable/TimeTableState.dart';

import '../../core/shared/domain/bloc/bloc.dart';

class TimeTableBloc extends Bloc<TimeTableState>{

  TimeTableBloc(){
    _init();
  }

  Future<void> _init() async{
    changeState(TimeTableState.initial());
  }
}