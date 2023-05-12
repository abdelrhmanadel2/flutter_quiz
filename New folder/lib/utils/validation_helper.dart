import 'package:get/get.dart';

class ValidatorHelper {
  ValidatorHelper._privateConstructor();

  static final ValidatorHelper instance = ValidatorHelper._privateConstructor();

  // String? validateName(String? name) => validateEmptyField(name);

  String? validateKidsAge(String? number) {
    // print("isNumberNotValid(number!)${isNumberNotValid(number!)}");
    if (number == null || number.isEmpty) {
      return "Required Field";
    } else if (number.isNotEmpty && isNumberNotValid(number) || double.tryParse(number)! < 11) {
      return "Age Must Be > 11";
    }
    return null;
  }

  String? validateyYoungKidsAge(String? number) {
    // print("isNumberNotValid(number!)${isNumberNotValid(number!)}");
    if (number == null || number.isEmpty) {
      return "Required Field";
    } else if (number.isNotEmpty && isNumberNotValid(number) || double.tryParse(number)! < 6) {
      return "Age Must Be > 6";
    }
    return null;
  }

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return "Required Field";
    } else if (isNotValidName(text)) {
      return "Name must be longer than 3 letter";
    } else {
      return null;
    }
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

  String? validateEmail(String? email) {
    if (email == null || isEmailNotValid(email)) {
      return "Invalid Email";
    }

    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword != password || isPasswordNotValid(password ?? " ")) {
      return "Password And Confirm Password Don't Mach";
    }

    return null;
  }

  bool isNotValidName(String password) {
    return !RegExp(r'^\S{3,}$').hasMatch(password);
  }

  bool isPasswordNotValid(String password) {
    return !RegExp(r'^\S{8,}$').hasMatch(password);
  }

  bool isNumberNotValid(String number) {
    return !RegExp(r'^[0-9\u0660-\u0669]+$').hasMatch(number);
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
    return !RegExp(r"^[\w-\.]{5,}@([\w-]{2,}\.)+[\w-]{2,4}$").hasMatch(email);
    // return !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]{3,50}@[a-zA-Z0-9]{3,30}\.[a-zA-Z]{2, 5 }").hasMatch(email);
  }
}
