import 'package:get/get.dart';

class ValidatorHelper {
  ValidatorHelper._privateConstructor();

  static final ValidatorHelper instance = ValidatorHelper._privateConstructor();

  String? validateName(String? name) => validateEmptyField(name);
  String? validateAge(String? number) {
    // print("isNumberNotValid(number!)${isNumberNotValid(number!)}");
    if (number == null || number.isEmpty) {
      return "Required Field";
    } else if (number.isNotEmpty && isNumberNotValid(number) || double.tryParse(number)! < 1) {
      return "Age Must Be > 1";
    }
    return null;
  }

  String? validateEmptyField(String? text) {
    if (text == null || text.isEmpty) {
      return "Required Field";
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password == null || isPasswordNotValid(password)) {
      return "Invalid Password";
    }

    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword != password || isPasswordNotValid(confirmPassword)) {
      return "Password And Confirm Password Don't Mach";
    }

    return null;
  }

  bool isPasswordNotValid(String password) {
    return !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password);
  }

  bool isNumberNotValid(String number) {
    return !RegExp(r'^[0-9\u0660-\u0669]+').hasMatch(number);
  }

  bool isSsnNotValid(String number) {
    return !RegExp(r'^[2]{1}[0-9]{13}$').hasMatch(number);
  }

  bool isPhoneNumberNotValid(String number) {
    return !RegExp(r'^01[0-2]{1}[0-9]{8}$').hasMatch(number);
  }

  bool startWithNumber(String number) {
    return RegExp(r'^[0-9]').hasMatch(number);
  }

  bool isFileName(String name) {
    return RegExp(r'^[a-zA-Z0-9][^$%#@%^&*/?<>,.؟\\~;:"\!]+$').hasMatch(name) || RegExp(r'^[\u0621-\u064A\s0-9]+$').hasMatch(name);
  }

  bool isEmailNotValid(String email) {
    return !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}
