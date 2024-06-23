import '../../core/shared/domain/bloc/bloc.dart';
import 'GeneralOptionsState.dart';

class GeneralOptionsBloc extends Bloc<GeneralOptionsState>{

  GeneralOptionsBloc(){
    _init();
  }

  Future<void> _init() async{
    changeState(GeneralOptionsState.initial());
  }
}