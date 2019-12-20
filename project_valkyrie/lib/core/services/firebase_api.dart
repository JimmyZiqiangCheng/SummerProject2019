import 'dart:math';
import 'package:project_valkyrie/core/data_models/user.dart';

class FirebaseApi {
  Future<User> loginWithEmailAndpassword(String email, String password) async {
    if (email == 'abc@gmail.com' && password == '12345678') {
      User loggedInUser = User.initial();
      loggedInUser.id = Random().nextInt(9999);
      loggedInUser.email = email;
      loggedInUser.name = 'Somebody with $email';
      loggedInUser.lastAccessed = DateTime.now();
      return loggedInUser;
    } else {
      return null;
    }
  }
}