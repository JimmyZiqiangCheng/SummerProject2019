import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/core/services/form_validator.dart';
import 'package:project_valkyrie/core/view_models/sign_up_view_model.dart';
import 'package:project_valkyrie/ui/shared_widgets/base_form_textfield.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_flat_button.dart';
import 'package:project_valkyrie/ui/shared_widgets/password_textfield.dart';
import 'package:project_valkyrie/ui/styles/app_colors.dart';
import 'package:project_valkyrie/ui/styles/app_icons.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';
import 'package:project_valkyrie/ui/views/authentication_base_view.dart';
import 'package:project_valkyrie/ui/views/base_views/base_view_without_appbar.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _verificationCodeTextController =
      TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignUpViewModel _model =
        SignUpViewModel(authenticationService: Provider.of(context));
    return BaseViewWithoutAppbar(
      model: _model,
      child: SignUpForm(
        formKey: _formKey,
        nameTextController: _nameTextController,
        emailTextController: _emailTextController,
        verificationCodeTextController: _verificationCodeTextController,
        passwordTextController: _passwordTextController,
        onSignupPressed: () {
          print(_model.signup(
              _emailTextController.text, _passwordTextController.text));
        },
      ),
      builder: (context, model, child) => AuthenticationBaseView(
        viewTitle: 'Sign Up',
        dismissActionOnPressed: () {
          Navigator.pop(context);
        },
        contentWidget: child,
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameTextController;
  final TextEditingController emailTextController;
  final TextEditingController verificationCodeTextController;
  final TextEditingController passwordTextController;
  final void Function() onSignupPressed;
  const SignUpForm(
      {Key key,
      this.emailTextController,
      this.passwordTextController,
      this.nameTextController,
      this.verificationCodeTextController,
      this.formKey,
      this.onSignupPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Full name:'),
            BaseFormTextField(
              formKey: formKey,
              controller: nameTextController,
              isValidatorEnable: true,
              validator: (value) {
                if (FormValidator.isNull(value)) {
                  return 'Please enter some text';
                }
                if (!FormValidator.isName(value)) {
                  return "Name should be alphabet only.";
                }
                return null;
              },
              hintText: 'Full name, please...',
              keyboradInputType: TextInputType.text,
              prefixIcon: AppIcons.textFieldPrefixIcon(Icons.person_pin),
            ),
            UIHelper.verticalSpaceMedium,
            Row(children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(width: 1.0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    'Email Address',
                    style: TextStyle(color: Colors.white),
                  )),
              UIHelper.horizontalSpaceSmall,
              Text('or'),
              UIHelper.horizontalSpaceSmall,
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(width: 1.0, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  'Phone Number',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              )
            ]),
            // email address
            BaseFormTextField(
              formKey: formKey,
              controller: emailTextController,
              isValidatorEnable: true,
              validator: (value) {
                if (FormValidator.isNull(value)) {
                  return 'Email should not empty.';
                }
                if (!FormValidator.isEmail(value)) {
                  return "Email is not valid.";
                }
                return null;
              },
              hintText: 'Email address, please...',
              keyboradInputType: TextInputType.emailAddress,
              prefixIcon: AppIcons.textFieldPrefixIcon(Icons.email),
              suffix: RaisedButton(
                onPressed: () {
                  print('verify for ${emailTextController.text}');
                },
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                color: AppColors.primaryTint,
                child: Text(
                  'Verify',
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ),
            ),
            UIHelper.verticalSpaceMedium,
            Text('Verification Code:'),
            BaseFormTextField(
              formKey: formKey,
              controller: verificationCodeTextController,
              isValidatorEnable: true,
              validator: (value) {
                if (FormValidator.isNull(value)) {
                  return 'Code should not empty.';
                }
                if (!FormValidator.isNumber(value)) {
                  return "Code should be number only.";
                }
                return null;
              },
              hintText: 'Verfication code, please...',
              keyboradInputType: TextInputType.number,
              prefixIcon:
                  AppIcons.textFieldPrefixIcon(Icons.confirmation_number),
            ),
            UIHelper.verticalSpaceMedium,
            Text('Password:'),
            // email address
            PasswordTextField(
              formKey: formKey,
              controller: passwordTextController,
            ),
            UIHelper.verticalSpaceLarge,
            MyFlatButton(
              isActive: false,
              text: 'Login',
              onButtonPressed: (){
                Navigator.popAndPushNamed(context, RoutePaths.login);
              },
            ),
            UIHelper.verticalSpaceSmall,
            MyFlatButton(
              isActive: true,
              text: 'Signup',
              onButtonPressed: onSignupPressed,
            ),
          ],
        ),
      ),
    );
  }
}
