import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget{

  final Widget header;
  final Widget body;
  final Widget footer;  

  MyScaffold({this.header, this.body, this.footer});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          header,
          Expanded(child: body),
          footer,
        ],
      ),
    );
  }
}