import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_time_table_app/src/presentation/general_options/widgets/GeneralOptionsContent.dart';
import 'package:scholar_time_table_app/src/presentation/timetable/TimeTableBloc.dart';
import 'package:scholar_time_table_app/src/presentation/timetable/widgets/TimeTableContent.dart';

import '../../DependenciesProvider.dart';
import '../../core/shared/domain/bloc/bloc_provider.dart';
import '../general_options/widgets/GeneralOptionsDrawer.dart';
import 'MyAppBar.dart';

class HomePage extends StatelessWidget{
  final String searchTerm = 'Element';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(),
      body: BlocProvider(
        key: ValueKey("TimeTableContentBlocProvider"),
        bloc: getIt<TimeTableBloc>(),
        child: TimeTableContent(),)
      /*Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Text('Results for ',
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(searchTerm,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Theme.of(context).primaryColor))
                  ],
                )),
            //Expanded(
              //child: CouseList(),
            //)
          ],
        ),
      )*/,
      endDrawer: GeneralOptionsDrawer(),
    );
  }
}