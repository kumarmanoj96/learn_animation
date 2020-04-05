import 'package:flutter/material.dart';

const owl_url =
    'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

class OpacityDemoScreen extends StatefulWidget {
  @override
  _OpacityDemoScreenState createState() => _OpacityDemoScreenState();
}

class _OpacityDemoScreenState extends State<OpacityDemoScreen> {
  double _opacity1 = 1.0, _opacity2 = 1.0;
  Widget getFlatButton(String text, String id) {
    return Container(
      height: 100,
      width: 100,
      child: FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          child: Text(
            text,
          ),
          onPressed: () => setState(() {
                id == '1' ? _opacity1 = 0.0 : _opacity2 = 0.0;
              })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo page for opacity'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => setState(() {
                    _opacity1 = 1.0;
                    _opacity2 = 1.0;
                  }),
              child: Icon(Icons.refresh))
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Opacity(
                  opacity: _opacity1,
                  child: Container(
                      height: 200,
                      width: 200,
                      child: FittedBox(
                          fit: BoxFit.contain, child: Image.network(owl_url))),
                ),
                getFlatButton('Press me to hide 1st owl', '1'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  opacity: _opacity2,
                  curve: Curves.easeInOut,
                  child: Container(
                      height: 200,
                      width: 200,
                      child: FittedBox(
                          fit: BoxFit.contain, child: Image.network(owl_url))),
                ),
                getFlatButton('Press me to hide 2nd owl with animation', '2'),
              ],
            ),
            Container(
              height: 200,
              width: 200,
              child:
                  FittedBox(fit: BoxFit.contain, child: Image.network(owl_url)),
            ),
          ],
        ),
      ),
    );
  }
}
