import 'package:validators/validators.dart' as validator;

class FormValidator {
  static final RegExp nameRegExp = RegExp(r'^[a-zA-Z ]*$');

  static bool isNull(String value) {
    return validator.isNull(value);
  }

  static bool isEmail(String value) {
    return validator.isEmail(value);
  }

  static bool isName(String value) {
    return nameRegExp.hasMatch(value.toLowerCase());
  }

  static bool isNumber(String value) {
    return validator.isNumeric(value);
  }
}