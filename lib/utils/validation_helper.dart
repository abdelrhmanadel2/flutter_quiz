import 'package:get/get.dart';

class ValidatorHelper {
  ValidatorHelper._privateConstructor();

  static final ValidatorHelper instance = ValidatorHelper._privateConstructor();

  // String? validateName(String? name) => validateEmptyField(name);

  String? validateKidsAge(String? number) {
    // print("isNumberNotValid(number!)${isNumberNotValid(number!)}");
    if (number == null || number.isEmpty) {
      return "الرجاء ادخال عمر الطفل";
    } else if (number.isNotEmpty && isNumberNotValid(number) || double.tryParse(number)! < 11) {
      return "العمر يجب أن يكون أصغر من 11 سنة ";
    }
    return null;
  }

  String? validateyYoungKidsAge(String? number) {
    // print("isNumberNotValid(number!)${isNumberNotValid(number!)}");
    if (number == null || number.isEmpty) {
      return "الحقل مطلوب";
    } else if (number.isNotEmpty && isNumberNotValid(number) || double.tryParse(number)! < 6) {
      return "العمر يجب أن يكون أكبر من 6 سنوات ";
    }
    return null;
  }

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return "الرجاء ادخال اسم";
    } else if (isNotValidName(text)) {
      return "الاسم يجب أن يكون اكثر من 3 أحرف ";
    } else {
      return null;
    }
  }

  String? validateEmptyField(String? text) {
    if (text == null || text.isEmpty) {
      return "الحقل مطلوب ";
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password == null || isPasswordNotValid(password)) {

      return 'كلمة مرور غير مقبولة , يجب أن تحتوي كلمة المرور على  :'

          '\n - 8 أحرف على الأقل'
          '\n  - حرف واحد كبير على الأقل  '
          '\n - رقم واحد على الأقل'
          '\n   رمز واحد على الأقل (? # @ & % ! *) '

      ;    }

    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || isEmailNotValid(email)) {
      return 'الرجاء ادخال صيغة بريد إلكتروني صحيحة ';
    }

    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword != password || isPasswordNotValid(password ?? " ")) {
      return "كلمة المرور غير متطابقة ";
    }

    return null;
  }

  bool isNotValidName(String password) {
    return !RegExp(r'^\S{3,}$').hasMatch(password);
  }

  bool isPasswordNotValid(String password) {
    return !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$').hasMatch(password);
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
    return !RegExp (r'^[a-zA-Z0-9._%+-]+@(gmail|hotmail|outlook|icloud|kku)\.(com|edu\.sa)$').hasMatch(email);

    // return !RegExp(r"^[\w-\.]{5,}@([\w-]{2,}\.)+[\w-]{2,4}$").hasMatch(email);
    // return !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]{3,50}@[a-zA-Z0-9]{3,30}\.[a-zA-Z]{2, 5 }").hasMatch(email);
  }
}