import 'package:flutter/material.dart';

class TweenAnimationBuilderDemoScreen extends StatefulWidget {
  @override
  _TweenAnimationBuilderDemoScreenState createState() =>
      _TweenAnimationBuilderDemoScreenState();
}

class _TweenAnimationBuilderDemoScreenState
    extends State<TweenAnimationBuilderDemoScreen> {
  static final _tween = ColorTween(begin: Colors.yellow, end: Colors.red);
  // Tween<Color>(begin: Colors.yellow, end: Colors.red);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TweenAnimationBuilderDemoScreen'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: TweenAnimationBuilder(
              tween: _tween,
              onEnd: () {
                //...
              },
              curve: Curves.easeOutCubic,
              duration: Duration(seconds: 5),
              builder: (BuildContext ctx, Color color, Widget ch) {
                return Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      color: color,
                      border: Border.all(
                        color: Colors.black,
                        width: 8,
                      )),
                  child: ch,
                  alignment: Alignment.center,
                );
              },
              child: Text(
                'color of the container will change',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
