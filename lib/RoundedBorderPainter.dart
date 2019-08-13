import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;

class RoundedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final StrokeCap strokeCap = StrokeCap.round;
  double radius;
  double progress;
  double _firstPercentage;
  double _totalPer;

  Size size;

  RoundedBorderPainter({
    this.color = Colors.black,
    this.strokeWidth = 2,
    this.radius = 1,
    this.progress = 100,
  }) {
    if (radius <= 1) this.radius = 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    radius = size.shortestSide / 2 < radius ? size.shortestSide / 2 : radius;
    this.size = size;
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;


    if (progress != 0.0) {
      canvas.drawPath(getPath1(), paint);
      if (progress > 25) {
        canvas.drawPath(getPath2(), paint);
        if (progress > 50) {
          canvas.drawPath(getPath3(), paint);
          if (progress >= 75) canvas.drawPath(getPath4(), paint);
        }
      }
    }
  }

  Path getPath1() {
    return Path()
      ..addPath(getTopLeftPath2(), Offset(0, 0))
      ..addPath(getTopPath(), Offset(0, 0))
      ..addPath(getTopRightPath1(), Offset(0, 0));
  }

  Path getPath2() {
    return Path()
      ..addPath(getTopRightPath2(), Offset(0, 0))
      ..addPath(getRightPath(), Offset(0, 0))
      ..addPath(getBottomRightPath1(), Offset(0, 0));
  }

  Path getPath3() {
    return Path()
      ..addPath(getBottomRightPath2(), Offset(0, 0))
      ..addPath(getBottomPath(), Offset(0, 0))
      ..addPath(getBottomLeftPath1(), Offset(0, 0));
  }

  Path getPath4() {
    return Path()
      ..addPath(getBottomLeftPath2(), Offset(0, 0))
      ..addPath(getLeftPath(), Offset(0, 0))
      ..addPath(getTopLeftPath1(), Offset(0, 0));
  }

  Path getTopPath() {

    _totalPer = (progress * 100) / 100;
    if (_totalPer != 0) {
      if (_totalPer >= 25) {
        _totalPer = _totalPer - 25;
        _firstPercentage = 100;
      } else {
        _firstPercentage = (_totalPer * 100) / 25;
        _totalPer = 0;
      }

      return Path()
        ..moveTo(0 + radius, 0)
        ..lineTo(((size.height * _firstPercentage)/100) - radius, 0);
    }
  }

  Path getRightPath() {

    if (_totalPer != 0) {
      if (_totalPer >= 25) {
        _totalPer = _totalPer - 25;
        _firstPercentage = 100;
      } else {
        _firstPercentage = (_totalPer * 100) / 25;
        _totalPer = 0;
      }
      return Path()
        ..moveTo(size.width, 0 + radius)
        ..lineTo(size.height, ((size.height * _firstPercentage) / 100) - radius);
    }


  }

  Path getBottomPath() {

    if (_totalPer != 0) {
      if (_totalPer >= 25) {
        _totalPer = _totalPer - 25;
        _firstPercentage = 0;
      } else {
        _firstPercentage = 100 - (_totalPer * 100) / 25;
        _totalPer = 0;
      }
      return Path()
        ..moveTo(size.width - radius, size.height)
        ..lineTo(((size.width * _firstPercentage) / 100) + radius, size.height);
    }


  }

  Path getLeftPath() {
    if (_totalPer != 0) {
      if (_totalPer >= 25) {
        _totalPer = _totalPer - 25;
        _firstPercentage = 0;
      } else {
        _firstPercentage = 100 - (_totalPer * 100) / 25;
        _totalPer = 0;
      }
      return Path()
        ..moveTo(0, size.height - radius)
        ..lineTo(0, ((size.width * _firstPercentage) / 100) + radius);
    }

  }

  Path getTopRightPath1() {
    if (progress>25) {
      return Path()
        ..addArc(
          Rect.fromLTWH(size.width - (radius * 2), 0, radius * 2, radius * 2),
          vm.radians(-45),
          vm.radians(-45),
        );
    }else{
      return Path();
    }
  }

  Path getTopRightPath2() {
    return Path()
      ..addArc(
        Rect.fromLTWH(size.width - (radius * 2), 0, radius * 2, radius * 2),
        vm.radians(0),
        vm.radians(-45),
      );
  }

  Path getBottomRightPath1() {
    if (progress>50) {
      return Path()
        ..addArc(
          Rect.fromLTWH(size.width - (radius * 2), size.height - (radius * 2), radius * 2, radius * 2),
          vm.radians(45),
          vm.radians(-45),
        );
    }else{
      return Path();
    }
  }

  Path getBottomRightPath2() {
    return Path()
      ..addArc(
        Rect.fromLTWH(size.width - (radius * 2), size.height - (radius * 2), radius * 2, radius * 2),
        vm.radians(90),
        vm.radians(-45),
      );
  }

  Path getBottomLeftPath1() {
    if (progress>75) {
      return Path()
        ..addArc(
          Rect.fromLTWH(0, size.height - (radius * 2), radius * 2, radius * 2),
          vm.radians(135),
          vm.radians(-45),
        );
    }else{
      return Path();
    }

  }

  Path getBottomLeftPath2() {
    return Path()..addArc(
        Rect.fromLTWH(0, size.height - (radius * 2), radius * 2, radius * 2),
        vm.radians(180),
        vm.radians(-45),
      );

  }

  Path getTopLeftPath1() {
    return Path()
      ..addArc(
        Rect.fromLTWH(0, 0, radius * 2, radius * 2),
        vm.radians(225),
        vm.radians(-45),
      );
  }

  Path getTopLeftPath2() {
    return Path()
      ..addArc(
        Rect.fromLTWH(0, 0, radius * 2, radius * 2),
        vm.radians(270),
        vm.radians(-45),
      );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}