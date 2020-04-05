import 'package:flutter/material.dart';

class AnimatedContainerDemoScreen extends StatefulWidget {
  @override
  _AnimatedContainerDemoScreenState createState() =>
      _AnimatedContainerDemoScreenState();
}

class _AnimatedContainerDemoScreenState
    extends State<AnimatedContainerDemoScreen> {
  bool _selected = false;
  BoxDecoration get getDecoration {
    return _selected
        ? BoxDecoration(
            color: Colors.green,
            border: Border.all(
              color: Colors.black,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(0),
          )
        : BoxDecoration(
            color: Colors.indigo,
            border: Border.all(
              color: Colors.pink,
              width: 20,
            ),
            borderRadius: BorderRadius.circular(15),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container demo'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
              width: _selected ? 200.0 : 100.0,
              height: _selected ? 100.0 : 200.0,
              // color: _selected ? Colors.red : Colors.blue,
              decoration: getDecoration,
              alignment:
                  _selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Text(
                'Tap me to see animation',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
