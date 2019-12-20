import 'package:flutter/material.dart';

class AppIcons {
  const AppIcons();
  static const double _TextFieldPrefixIconSize = 32.0;
  
  static Icon textFieldPrefixIcon (IconData iconData) {
    return Icon(
      iconData,
      size: _TextFieldPrefixIconSize,
    );
  }
}