import 'package:flutter/material.dart';
import 'package:project_valkyrie/ui/styles/app_colors.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 8.0;
  static const double _VerticalSpaceMedium = 16.0;
  static const double _VerticalSpaceLarge = 32.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 8.0;
  static const double _HorizontalSpaceMedium = 16.0;
  static const double _HorizontalSpaceLarge = 32.0;

  static const double verticalMarginSmall = _VerticalSpaceSmall;
  static const double verticalMarginMedium = _VerticalSpaceMedium;
  static const double verticalMarginLarge = _VerticalSpaceLarge;

  static const double horizontalMarginSmall = _HorizontalSpaceSmall;
  static const double horizontalMarginMedium = _HorizontalSpaceMedium;
  static const double horizontalMarginLarge = _HorizontalSpaceLarge;

  // circular angle on buttons, listTiles and carousels
  static const double _CircularAngle = 6.0;
  static const double circularAngle = _CircularAngle;

  static const Widget verticalSpaceSmall =
      SizedBox(height: _VerticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _VerticalSpaceMedium);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _VerticalSpaceLarge);

  static const Widget horizontalSpaceSmall =
      SizedBox(width: _HorizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _HorizontalSpaceLarge);

  // box shadow for listTiles and popup dialog
  static const double _blurRadius = 2.0;
  static const double _spreadRadius = 0.6;
  static const customBoxShadow = BoxShadow(
    color: AppColors.shadowColor,
    blurRadius: _blurRadius,
    spreadRadius: _spreadRadius,
    offset: Offset(0.0, 1.0),
  );

  static Divider horizontalLine(
          {double height: 0.5,
          double thickness: 1.0,
          Color color: AppColors.primaryDark}) =>
      Divider(
        height: height,
        thickness: thickness,
        color: color,
      );
}

class Drawhorizontalline extends CustomPainter {
  Paint _paint;
  final Color color;
  Drawhorizontalline({this.color}) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-60.0, -4.0), Offset(60.0, -4.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
