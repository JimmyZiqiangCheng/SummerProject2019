import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/constants/app_constants.dart';
import 'package:project_valkyrie/core/services/form_validator.dart';
import 'package:project_valkyrie/core/view_models/login_view_model.dart';
import 'package:project_valkyrie/ui/shared_widgets/base_form_textfield.dart';
import 'package:project_valkyrie/ui/shared_widgets/my_flat_button.dart';
import 'package:project_valkyrie/ui/shared_widgets/password_textfield.dart';
import 'package:project_valkyrie/ui/styles/app_colors.dart';
import 'package:project_valkyrie/ui/styles/app_icons.dart';
import 'package:project_valkyrie/ui/styles/ui_helper.dart';
import 'package:project_valkyrie/ui/views/authentication_base_view.dart';
import 'package:project_valkyrie/ui/views/base_views/base_view_without_appbar.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final String _txtLogin = 'Login';
  final String _txtSigup = 'Signup';
  final String _txtForgotPassword = 'Forgot Your Password?';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  void _login(LoginViewModel model) async {
    final email = _emailTextController.text;
    final password = _passwordTextController.text;
    print('Login with $email and $password');
    var loginSuccess = await model.login(email, password);
    if (loginSuccess) {
      //print('[Provider] Login success with id: ${Provider.of<User>(context).name}');
      Navigator.popAndPushNamed(context, RoutePaths.home);
    } else {
      print('Login falied!');
    }
  }

  @override
  Widget build(BuildContext context) {
    _emailTextController.text = 'abc@gmail.com';
    _passwordTextController.text = '12345678';
    LoginViewModel _model = LoginViewModel(authenticationService: Provider.of(context));
    return BaseViewWithoutAppbar(
      model: _model,
      child: LoginForm(
        formKey: _formKey,
        emailTextController: _emailTextController,
        passwordTextController: _passwordTextController,
      ),
      builder: (context, model, child) => AuthenticationBaseView(
        viewTitle: _txtLogin,
        dismissActionOnPressed: () {
          Navigator.pop(context);
        },
        contentWidget: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // login child form
              child,
              UIHelper.verticalSpaceLarge,
              MyFlatButton(
                isActive: true,
                text: _txtLogin,
                onButtonPressed: () {
                  if (_formKey.currentState.validate()) {
                    _login(model);
                  }
                },
              ),
              UIHelper.verticalSpaceSmall,
              MyFlatButton(
                isActive: false,
                text: _txtSigup,
                onButtonPressed: (){
                  Navigator.popAndPushNamed(context, RoutePaths.signup);
                },
              ),
              UIHelper.verticalSpaceLarge,
              InkWell(
                onTap: (){
                  print('Forgot Your Password...Tapped!');
                },
                child: Container(
                  child: Text(
                    _txtForgotPassword,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.primaryDark,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  const LoginForm(
      {Key key,
      this.emailTextController,
      this.passwordTextController,
      this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Email Address:'),
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
          ),
          UIHelper.verticalSpaceMedium,
          Text('Password:'),
          // email address
          PasswordTextField(
            formKey: formKey,
            controller: passwordTextController,
          ),
        ],
      ),
    );
  }
}