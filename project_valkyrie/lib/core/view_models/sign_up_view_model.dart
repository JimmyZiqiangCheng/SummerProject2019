import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/services/authentication_service.dart';
import 'package:project_valkyrie/core/view_models/base_view_model.dart';

class SignUpViewModel extends BaseViewModel {
  AuthenticationService _authenService;

  SignUpViewModel({@required AuthenticationService authenticationService})
      : _authenService = authenticationService;

  Future<bool> signup(String email, String password) 
  async {
    print('signup with $email and $password');
    setBusy(true);
    var success = true;
    setBusy(false);
    return success;
  }
}