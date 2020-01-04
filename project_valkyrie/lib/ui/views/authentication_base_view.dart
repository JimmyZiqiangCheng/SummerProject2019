import 'package:flutter/material.dart';
import 'package:project_valkyrie/ui/styles/app_colors.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';


class AuthenticationBaseView extends StatefulWidget {
  final Widget contentWidget;
  final void Function() dismissActionOnPressed;
  final String viewTitle;
  AuthenticationBaseView(
      {Key key,
      this.contentWidget,
      this.viewTitle = 'Title',
      this.dismissActionOnPressed})
      : super(key: key);

  @override
  _AuthenticationBaseViewState createState() =>
      _AuthenticationBaseViewState();
}

class _AuthenticationBaseViewState extends State<AuthenticationBaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
              left: UIHelper.horizontalMarginMedium,
              right: UIHelper.horizontalMarginMedium),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(UIHelper.horizontalMarginSmall),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      onPressed: widget.dismissActionOnPressed,
                      icon: Icon(
                        Icons.close,
                        size: 36.0,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    UIHelper.verticalSpaceSmall,
                    Text(
                      widget.viewTitle,
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      top: UIHelper.verticalMarginMedium,
                      bottom: UIHelper.verticalMarginSmall,
                      left: UIHelper.horizontalMarginSmall,
                      right: UIHelper.horizontalMarginSmall),
                  child: widget.contentWidget,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}