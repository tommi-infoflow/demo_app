import 'package:flutter/cupertino.dart';

class ButtonColumn extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  ButtonColumn({@required this.color, @required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color,),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(label, 
          style: TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: 12),),
        )
      ],
    );
  }
}
