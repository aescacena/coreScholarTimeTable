import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  MyAppBar(): preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /*title: Image.asset(
        'assets/images/logo.png',
        width: 130.0,
      ),*/
      actions: <Widget>[
        scholarCoursesIcon(context)
      ],
    );
  }

  Widget scholarCoursesIcon(BuildContext context) {
    // Using Stack to show Notification Badge
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        //CartCounterBadge()
      ],
    );
  }

}