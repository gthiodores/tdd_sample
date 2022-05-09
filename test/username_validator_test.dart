import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_sample/username_validator.dart';

void main() {
  /// Username is valid if:
  /// 1. Username length is at least 4
  /// 2. Is not blank
  /// 3. Does not start with number

  late UsernameValidator validator;

  setUp(() {
    validator = UsernameValidator();
  });

  group('length test', () {
    test('should return true if username length is at least 4 ', () {
      final result = validator.isUsernameValid('aaaa');
      expect(result, true);
    });

    test('should return false if username length is less than 4', () {
      final result = validator.isUsernameValid('aaa');
      expect(result, false);
    });
  });

  group('blank test', () {
    test('should return true if username is not blank', () {
      final result = validator.isUsernameValid('    a');
      expect(result, true);
    });

    test('should return false if username is blank', () {
      final result = validator.isUsernameValid('    ');
      expect(result, false);
    });
  });

  group('start with number test', () {
    test('should return true if username does not start with number', () {
      final result = validator.isUsernameValid('aaaa');
      expect(result, true);
    });

    test('should return false if username start with number', () {
      final result = validator.isUsernameValid('1234');
      expect(result, false);
    });
  });
}
