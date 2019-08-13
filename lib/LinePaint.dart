import 'package:flutter/material.dart';

import 'RoundedBorderPainter.dart';

class Line extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LineState();
}

class _LineState extends State<Line> {
  double _progress = 0.0;
  Color _color;
  Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              color: Colors.white,
              child: CustomPaint(
                painter: RoundedBorderPainter(
                    radius: 10,
                    strokeWidth: 10,
                    color: _color,
                    progress: _progress),
                child: Center(
                  child: Container(
                    child: Text('Progress : $_progress %'),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                      if (_progress < 100) {
                        _progress = _progress + 10;
                        if (_progress <= 50) {
                          _color = Colors.amberAccent;
                        } else if (_progress > 50 && _progress <= 80) {
                          _color = Colors.deepOrangeAccent;
                        } else {
                          _color = Colors.red;
                        }
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  color: Colors.blue,
                  child: Text(
                    'Fill',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      _progress = 0;
                      _color = Colors.amberAccent;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  color: Colors.grey,
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
