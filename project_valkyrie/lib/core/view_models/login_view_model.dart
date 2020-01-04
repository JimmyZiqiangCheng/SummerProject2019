import 'package:flutter/material.dart';
import 'package:project_valkyrie/core/services/authentication_service.dart';
import 'package:project_valkyrie/core/view_models/base_view_model.dart';


class LoginViewModel extends BaseViewModel {
  AuthenticationService _authenService;

  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenService = authenticationService;

  Future<bool> login(String email, String password) async {
    setBusy(true);
    var success = await _authenService.login(email, password);
    setBusy(false);
    return success;
  }
}