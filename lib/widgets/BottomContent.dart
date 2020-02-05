import 'package:demo_app/widgets/ButtonColumn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: new BoxDecoration(color: Colors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonColumn(color: Colors.black, icon: Icons.movie, label: 'Dashboard'),
          ButtonColumn(color: Colors.black, icon: Icons.search, label: 'Search'),
          ButtonColumn(color: Colors.black, icon: Icons.favorite, label: 'Favourite'),
          ButtonColumn(color: Colors.black, icon: Icons.settings, label: 'Setting'),
        ]
      ),
    );
  }
}