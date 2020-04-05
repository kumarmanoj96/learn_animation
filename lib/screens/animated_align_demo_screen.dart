import 'package:flutter/material.dart';

class AnimatedAlignDemoScreen extends StatefulWidget {
  @override
  _AnimatedAlignDemoScreenState createState() =>
      _AnimatedAlignDemoScreenState();
}

class _AnimatedAlignDemoScreenState extends State<AnimatedAlignDemoScreen> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedAlignDemoScreen'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() {
            _selected = !_selected;
          }),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(color: Colors.indigo),
            child: AnimatedAlign(
              curve: Curves.easeInExpo,
                child: Text(
                  'Tap the container',
                  style: TextStyle(color: Colors.white),
                ),
                alignment:
                    !_selected ? Alignment.topLeft : Alignment.bottomRight,
                duration: Duration(seconds: 3)),
          ),
        ),
      ),
    );
  }
}
