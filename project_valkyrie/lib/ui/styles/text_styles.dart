import 'package:flutter/material.dart';
import 'package:project_valkyrie/ui/styles/app_colors.dart';


class TextStyles {
  static const double _textHeadingSize1 = 64.0;
  static const double _textHeadingSize2 = 48.0;
  static const double _textHeadingSize3 = 32.0;
  static const double _textSize = 16.0;
  static const double _textTitleSize = 20.0;
  static const double _textSubtitleSize = 12.0;

  static const double _buttonTextSize = 18.0;
  static const String _buttonFontFamily = 'OpenSans';

  // text style

  static const headerStyle = TextStyle(
    fontSize: _textHeadingSize3,
    fontWeight: FontWeight.bold,
  );
  static subHeaderStyle({Color color : Colors.grey}) { return TextStyle(
    fontSize: _textSize,
    fontWeight: FontWeight.w500,
    color: color);
  }

  static const heading1Style = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.primaryDark,
    fontSize: _textHeadingSize1,
  );

  static const heading2Style = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
    fontSize: _textHeadingSize2,
  );

  static const heading3Style = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDark,
    fontSize: _textHeadingSize3,
  );

  static const titleStyle = TextStyle(
    color: AppColors.primaryDark,
    fontSize: _textTitleSize,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static const titleStyleLight = TextStyle(
    color: AppColors.primary,
    fontSize: _textTitleSize,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const subtitleStyle = TextStyle(
    color: AppColors.primaryDark,
    fontSize: _textSubtitleSize,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );

  // Flat Button
  static const flatButtonActiveStyle = TextStyle(
      fontSize: _buttonTextSize,
      fontWeight: FontWeight.w600,
      color: AppColors.flatButtonActiveText,
      fontFamily: _buttonFontFamily);

  static const flatButtonInactiveStyle = TextStyle(
      fontSize: _buttonTextSize,
      fontWeight: FontWeight.w600,
      color: AppColors.flatButtonInatviceText,
      fontFamily: _buttonFontFamily);

  // InkWell Text Button Style
  static const textButtonStyle = TextStyle(
      fontSize: _textSize,
      color: AppColors.primaryDark,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.underline);

    static final textButtonStyleInDialog = TextStyle(
      fontSize: _buttonTextSize,
      //fontWeight: FontWeight.bold,
      color: AppColors.buttonTextInDialog,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.underline);
}
