import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_flat_button.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';
import 'package:project_valkyrie/ui/styles/text_styles.dart';

class WelcomeView extends StatelessWidget {
  final String _txtWelcome = 'Welcome to';
  final String _txtLogo = 'VALKYRIE';
  final String _txtSologan = 'Home is at your fingertips.';
  final String _txtLogin = 'Login';
  final String _txtSigup = 'Signup';
  final String _txtTermOfService = 'Terms of Service';

  const WelcomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
              left: UIHelper.horizontalMarginMedium,
              right: UIHelper.horizontalMarginMedium),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  _txtWelcome,
                  textAlign: TextAlign.center,
                  style: TextStyles.titleStyleLight,
                ),
                Text(
                  _txtLogo,
                  textAlign: TextAlign.center,
                  style: TextStyles.heading3Style,
                ),
                UIHelper.verticalSpaceMedium,
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black12,
                          style: BorderStyle.solid,
                          width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Image.asset('assets/icons/valkyrie_logo.png',
                      height: 220, width: 200, fit: BoxFit.fitWidth),
                ),
                UIHelper.verticalSpaceMedium,
                Text(
                  _txtSologan,
                  textAlign: TextAlign.center,
                  style: TextStyles.subHeaderStyle(),
                ),
                UIHelper.verticalSpaceLarge,
                MyFlatButton(
                  isActive: false,
                  text: _txtLogin,
                  onButtonPressed: () {
                    Navigator.pushNamed(context, RoutePaths.login);
                  },
                ),
                UIHelper.verticalSpaceSmall,
                MyFlatButton(
                  isActive: false,
                  text: _txtSigup,
                  onButtonPressed: () {
                    Navigator.pushNamed(context, RoutePaths.signup);
                  },
                ),
                UIHelper.verticalSpaceMedium,
                InkWell(
                  onTap: () {
                    print('Terms of Service Tapped!');
                  },
                  child: Container(
                    child: Text(
                      _txtTermOfService,
                      textAlign: TextAlign.center,
                      style: TextStyles.textButtonStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
