import 'package:flutter/material.dart';
import './screens/animated_container_demo_screen.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Intro Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedContainerDemoScreen(),
    );
  }
}