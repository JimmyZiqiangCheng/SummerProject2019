import 'dart:async';
import 'package:project_valkyrie/core/data_models/user.dart';
import 'package:project_valkyrie/core/services/firebase_api.dart';

class AuthenticationService {
  final FirebaseApi _api;

  AuthenticationService({FirebaseApi api}) : _api = api;

  StreamController<User> _userStreamController = StreamController<User>();
  Stream<User> get user => _userStreamController.stream;

  Future<bool> login(String email, String password) async {
    var userInfo = await _api.loginWithEmailAndpassword(email, password);
    print("Login user ${userInfo.name}");
    var hasUser = userInfo != null;
    if (hasUser) {
      _userStreamController.add(userInfo);
    }
    return hasUser;
  }
}