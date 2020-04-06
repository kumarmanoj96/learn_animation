import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBuilderDemoScreen extends StatefulWidget {
  @override
  _AnimatedBuilderDemoScreenState createState() =>
      _AnimatedBuilderDemoScreenState();
}

class _AnimatedBuilderDemoScreenState extends State<AnimatedBuilderDemoScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _angleAnimation,
      _containerColorAnimation,
      _containerRadiusAnimation,
      _containerSizeAnimation;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: const Duration(seconds: 5))
      ..repeat();
    _angleAnimation =
        Tween(begin: 0.0, end: 2 * math.pi).animate(CurvedAnimation(
      curve: Curves.easeIn,
      parent: _animationController,
    ));
    _containerColorAnimation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(
            CurvedAnimation(curve: Curves.ease, parent: _animationController));
    _containerRadiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(100.0),
      end: BorderRadius.circular(0.0),
    ).animate(
      _animationController,
    );

    _containerSizeAnimation = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.bounceInOut));
    super.initState();
  }

  @override
  void dispose() {
    //don't forget to dispose it
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilderDemoScreen'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          child: Text(
            'Hello',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          builder: (_, Widget ch) {
            return Transform.rotate(
              angle: _angleAnimation.value,
              child: Container(
                height: _containerSizeAnimation.value * height,
                width: _containerSizeAnimation.value * width,
                decoration: BoxDecoration(
                    borderRadius: _containerRadiusAnimation.value,
                    color: _containerColorAnimation.value),
                child: Align(
                  child: ch,
                  alignment: Alignment.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
