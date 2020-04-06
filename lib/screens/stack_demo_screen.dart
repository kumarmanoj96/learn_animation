import 'package:flutter/material.dart';
import 'dart:math' as math;
//to position children inside stack either wrap the children in align along with padding or wrap then in positioned widget
//note Positioned has to be a child of a Stack. There cannot be another widget in between the stack and the widget
class StackDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.bottomCenter,    //by default topLeft
      children: <Widget>[
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
          height: 300.0,
          width: 300.0,
        ),
        Positioned(
            top: 30,
            left: 30,
            child: Transform.rotate(
               angle: math.pi / 4.0,
              origin: Offset.zero,
              child: Container(
                color: Colors.pink,
                height: 150.0,
                width: 150.0,
              ),
            ))
      ],
    );
  }
}
