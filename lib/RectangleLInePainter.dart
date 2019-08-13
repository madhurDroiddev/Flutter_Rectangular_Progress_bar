import 'package:flutter/cupertino.dart';

class LinePainter extends CustomPainter {
  Color _color;
  double _progress;
  double value;

  LinePainter(this._progress, this._color);

  @override
  void paint(Canvas canvas, Size size) {
    double _firstPercentage;

    Paint line = new Paint()
      ..color = _color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path = new Path();
    path.moveTo(0, 0);

    double _totalPer = (_progress * 100) / 100;
    if (_totalPer != 0) {
      if (_totalPer >= 25) {
        _totalPer = _totalPer - 25;
        _firstPercentage = 100;
      } else {
        _firstPercentage = (_totalPer * 100) / 25;
        _totalPer = 0;
      }
      path.lineTo((size.height * _firstPercentage) / 100, 0);
    }
    if (_totalPer != 0) {
      if (_totalPer >= 25) {
        _totalPer = _totalPer - 25;
        _firstPercentage = 100;
      } else {
        _firstPercentage = (_totalPer * 100) / 25;
        _totalPer = 0;
      }
      path.lineTo(size.height, (size.height * _firstPercentage) / 100);
    }
    if (_totalPer != 0) {
      if (_totalPer >= 25) {
        _totalPer = _totalPer - 25;
        _firstPercentage = 0;
      } else {
        _firstPercentage = 100 - (_totalPer * 100) / 25;
        _totalPer = 0;
      }
      path.lineTo((size.width * _firstPercentage) / 100, size.height);
    }
    if (_totalPer != 0) {
      if (_totalPer >= 25) {
        _totalPer = _totalPer - 25;
        _firstPercentage = 0;
      } else {
        _firstPercentage = 100 - (_totalPer * 100) / 25;
        _totalPer = 0;
      }
      path.lineTo(0, (size.width * _firstPercentage) / 100);
    }

    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate._progress != _progress;
  }
}