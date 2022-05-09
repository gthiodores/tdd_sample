import 'package:tdd_sample/username_validator_interface.dart';

class UsernameValidator extends UsernameValidatorInterface {
  @override
  bool isUsernameValid(String username) {
    if (username.length < 4) {
      return false;
    }

    if (username.trim().isEmpty) {
      return false;
    }

    return double.tryParse(username[0]) == null;
  }
}
