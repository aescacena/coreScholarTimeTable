import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_time_table_app/src/presentation/general_options/widgets/GeneralOptionsContent.dart';

import '../general_options/widgets/GeneralOptionsDrawer.dart';
import 'MyAppBar.dart';

class HomePage extends StatelessWidget{
  final String searchTerm = 'Element';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
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
      ),
      endDrawer: GeneralOptionsDrawer(),
    );
  }
}