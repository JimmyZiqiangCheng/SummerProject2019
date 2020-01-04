import 'package:flutter/material.dart';
import 'package:project_valkyrie/ui/styles/app_colors.dart';
import 'package:project_valkyrie/ui/styles/text_styles.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';


class MyFlatButton extends StatelessWidget {
  final bool isActive;
  final String text;
  final void Function() onButtonPressed;
  const MyFlatButton({Key key, this.isActive, this.text, this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(UIHelper.circularAngle)),
      padding: const EdgeInsets.all(16.0),
      color: isActive
          ? AppColors.flatButtonActiveBackground
          : AppColors.flatButtonInactiveBackground,
      child: Text(
        text,
        style: isActive
            ? TextStyles.flatButtonActiveStyle
            : TextStyles.flatButtonInactiveStyle,
      ),
      onPressed: onButtonPressed,
    );
  }
}