import 'package:flutter/material.dart';

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
}