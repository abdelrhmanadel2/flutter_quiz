import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/nav-forkids.dart';
import 'package:flutter_quiz/components/nav.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/utils/validation_helper.dart';
import 'package:flutter_quiz/views/home/home_page.dart';
import 'package:flutter_quiz/views/home/user_home_pinding.dart';
import 'package:flutter_quiz/views/signupScreen/signup_service.dart';
import 'package:get/get.dart';

const wrongCode = 'assets/images/wrong_code.png';

class SignupController extends GetxController {
  final validatorHelber = ValidatorHelper.instance;

  RxBool _visiblePsd = false.obs;

  bool get visiblePsd => _visiblePsd.value;

  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }

  String kind = "parent";
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  // InqueryModel? _inqueryModel;
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    confirmPasswordController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateName(String? name) {
    return validatorHelber.validateName(name);
  }

  String? validateKidAge(String? name) {
    double value = double.tryParse(name ?? "") ?? 0;
    print("isNumberValid ${!validatorHelber.isNumberNotValid(name ?? "--")}");
    if ((validatorHelber.isNumberNotValid(name ?? "--")) || (value < 10 || value > 16)) {
      return "Age Must Be between 10 and 16";
    }
    return null;
  }

  String? validateBabyAge(String? name) {
    double value = double.tryParse(name ?? "") ?? 0;
    print("isNumberValid ${!validatorHelber.isNumberNotValid(name ?? "--")}");
    if ((validatorHelber.isNumberNotValid(name ?? "--")) || (value < 10 || value > 16)) {
      return "Age Must Be between 10 and 16";
    }
  }

  String? validateEmail(String? email) {
    return validatorHelber.validateEmail(email);
  }

  String? validatePassword(String? password) {
    return validatorHelber.validatePassword(password);
  }

  String? validateConfirmPassword(String? password) {
    return validatorHelber.validateConfirmPassword(passwordController.text, password);
  }

  onKindChange(value) {
    kind = value;
    update();
  }

  signupKid() async {
    await SignupService.registerKid(
        name: nameController.text,
        email: emailController.text,
        age: int.parse(ageController.text),
        password: passwordController.text,
        onSuccess: (AccountModel response) {
          Get.find<StorageService>().setAccountData(response);
          Get.off(() => Navkid());
        });
  }

  signupParent() async {
    await SignupService.registerParent(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        onSuccess: (response) {
          Get.find<StorageService>().setAccountData(response);
          Get.off(() => NavParernt());
        });
  }

  Future<void> sendPressed() async {
    var formValidated = formKey.currentState!.validate();

    if (formValidated) {
      formKey.currentState?.save();
      (kind == "parent") ? signupParent() : signupKid();
    }
  }

  Future errorDialog(String err) async {
    return Get.defaultDialog(title: "error /n Pleas Try Agian", titlePadding: EdgeInsets.symmetric(vertical: 10), middleText: err);
  }
}
