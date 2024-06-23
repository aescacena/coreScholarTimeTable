import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_time_table_app/src/core/shared/domain/bloc/bloc_provider.dart';
import 'package:scholar_time_table_app/src/presentation/general_options/GeneralOptionsBloc.dart';
import 'package:scholar_time_table_app/src/presentation/general_options/GeneralOptionsState.dart';

class GeneralOptionsContent extends StatelessWidget{
  
  const GeneralOptionsContent();
  
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GeneralOptionsBloc>(context);

    return StreamBuilder<GeneralOptionsState>(
        initialData: bloc.state,
        stream: bloc.observableState,
        builder: (context, snapshot){
          final state = snapshot.data;
          return _renderCoursesContent(context, state!);
        });
  }

  Widget _renderCoursesContent(BuildContext context, GeneralOptionsState state) {
    return ListView.builder(
      itemCount: state.options.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Aquí puedes manejar la acción al tocar cada opción
            print('Opción seleccionada: ${state.options[index]}');
          },
          child: Container(
            height: 100,
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                state.options[index],
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}