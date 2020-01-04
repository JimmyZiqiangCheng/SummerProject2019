import 'package:flutter/material.dart';
import 'package:project_valkyrie/ui/styles/app_colors.dart';
import 'package:project_valkyrie/ui/styles/text_styles.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';

class MyDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget dialogBody;
  final Widget customTextButton;
  final String _dismiss = 'Dismiss';
  // show or hide the top right button
  final bool enableTopRightIcon;
  // customise the top right icon
  final Icon topRightIcon;
  // onTap function for the top right icon
  final Function topRightIconOnTap;

  MyDialog(
      {Key key,
      @required this.title,
      this.subTitle,
      @required this.dialogBody,
      this.customTextButton,
      this.enableTopRightIcon: false,
      this.topRightIconOnTap,
      this.topRightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UIHelper.circularAngle)),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(UIHelper.circularAngle),
            //boxShadow: [UIHelper.customBoxShadow],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(UIHelper.circularAngle)),
                  // Header Color
                  color: Colors.transparent,
                ),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () => {dismissDialog(context)},
                            alignment: Alignment.center,
                            icon: Icon(
                              Icons.close,
                              size: 28.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        if (this.enableTopRightIcon)
                          Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              padding: const EdgeInsets.all(0.0),
                              onPressed: (this.topRightIconOnTap != null) ? this.topRightIconOnTap : () {
                                print('[Warning, the top right icon has enabled without an OnTap Function!');
                              },
                              alignment: Alignment.center,
                              icon: (this.topRightIcon != null)
                                  ? this.topRightIcon
                                  : Icon(
                                      Icons.settings,
                                      size: 28.0,
                                      color: Colors.black87,
                                    ),
                            ),
                          )
                      ],
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyles.heading3Style,
                    ),
                    if (subTitle != null) ...[
                      UIHelper.verticalSpaceSmall,
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Text(
                          subTitle,
                          style: TextStyles.subHeaderStyle(
                              color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ],
                ),
              ),
              UIHelper.horizontalLine(color: Colors.grey),
              Center(
                child: Container(
                  padding: EdgeInsets.all(
                    UIHelper.horizontalMarginLarge,
                  ),
                  child: dialogBody,
                ),
              ),
              if (customTextButton != null)
                customTextButton
              else
                //UIHelper.horizontalSpaceLarge,
                _dialogButton(
                  text: _dismiss,
                  isActive: true,
                  onTap: () {
                    dismissDialog(context);
                  },
                ),
            ],
          ),
        ));
  }

  void dismissDialog(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop();

  Widget _dialogButton({String text, bool isActive, Function onTap}) {
    return InkWell(
      splashColor: AppColors.primary,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: UIHelper.verticalMarginLarge),
        child: Text(
          text,
          style: TextStyles.textButtonStyleInDialog,
        ),
      ),
      onTap: onTap,
    );
  }
}
