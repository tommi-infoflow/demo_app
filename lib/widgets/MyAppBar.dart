import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  MyAppBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.0,
        decoration: new BoxDecoration(color: Colors.grey),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ));
  }
}
