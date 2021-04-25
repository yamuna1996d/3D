import 'dart:math';

import 'package:flutter/material.dart';

const PrimaryColor = Color(0xFF308614);
const TextColor = Color(0xFF3C4046);
const backgroundColor = Color(0xFFF9F8FD);
const Color darkGrey = Color(0xff202020);
const double DefaultPadding = 20.0;
const Color yellow = Color(0xffFDC054);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];
getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

class SizeConfig {
  static double widthInPx = 1080;
  static double heightInPx = 1920;
  static double defaultSize = 21;
  static MediaQueryData _mediaQueryData;
  static double pixelRatio;
  static double screenWidth;
  static double screenHeight;
  static double defaultHeight;
  static double defaultWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    pixelRatio = _mediaQueryData.devicePixelRatio;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    defaultHeight = defaultSize * screenHeight / heightInPx;
    defaultWidth = defaultSize * screenWidth / widthInPx;
  }
}
class DrawCircle extends CustomPainter {
  DrawCircle({
    @required this.radius,
    @required this.offset,
    @required this.color,
    this.elevation = 8,
    this.transparentOccluder = true,
    this.shadowColor,
    this.hasShadow = false,
    this.shadowOffset = 1,
  }) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  final double radius;
  final Offset offset;
  final Color color;
  final double elevation;
  final bool transparentOccluder;
  final bool hasShadow;
  final Color shadowColor;
  final double shadowOffset;
  Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    if (hasShadow) {
      Path oval = Path()
        ..addOval(
            Rect.fromCircle(center: offset, radius: radius + shadowOffset));

      canvas.drawShadow(
        oval,
        shadowColor ?? Colors.black.withOpacity(0.7),
        elevation,
        transparentOccluder,
      );
    }

    canvas.drawCircle(offset, radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
