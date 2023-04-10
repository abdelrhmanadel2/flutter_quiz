import 'package:flutter/material.dart';
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

  //fixme make it false

  RxBool _isEnableSignup = false.obs;

  RxBool _isAcceptTerms = false.obs;

  bool get isAcceptTerms => _isAcceptTerms.value;

  void toggleCheckbox() {
    _isAcceptTerms.value = !_isAcceptTerms.value;
  }

  bool get isEnableSignup => _isEnableSignup.value;
  bool get visiblePsd => _visiblePsd.value;

  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }

  set isEnableSignup(bool value) {
    _isEnableSignup.value = value;
    print('SignupController.isEnableSignup value= $value');
    update();
  }

  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController ageController;
  bool hrCodeValidated = false;
  bool passValidated = false;
  bool emailValidated = false;
  bool formValidated = false;
  bool hrCodeState = false;
  bool passState = false;
  bool emailState = false;

  // InqueryModel? _inqueryModel;
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    userNameController = TextEditingController();
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

  void clear() {
    passwordController.clear();
    // phoneController.clear();
    nameController.clear();
    ageController.clear();
  }

  String? validateName(String? name) {
    var validateName = validatorHelber.validateName(name);
    if (validateName == null && name != "") {
      hrCodeState = true;
      hrCodeValidated = true;
    } else {
      hrCodeValidated = true;
      hrCodeState = false;
    }
    return validateName;
  }

  String? validatePassword(String? password) {
    final validatePassword = validatorHelber.validateName(password);
    if (validatePassword == null) {
      passState = true;
    }
    passValidated = true;
    return validatePassword;
  }

  Future<void> sendInquiry() async {
    try {
      print(toString());

      await SignupService.register(
          name: nameController.text,
          userName: userNameController.text,
          age: int.parse(ageController.text),
          password: passwordController.text,
          onSuccess: (response) {
            Get.find<StorageService>().setAccountData(response);
            Get.off(() => HomePage());
          });
    } catch (e) {}
  }

  Future<void> sendPressed() async {
    formValidated = formKey.currentState!.validate();

    if (formValidated) {
      formKey.currentState?.save();
      await sendInquiry();
    }
  }

  Future errorDialog(String err) async {
    return Get.defaultDialog(title: "error /n Pleas Try Agian", titlePadding: EdgeInsets.symmetric(vertical: 10), middleText: err);
  }

  String toString() {
    return 'SignupController{ _firstName: ${nameController.text},_email: ${ageController.text}, _password: ${passwordController.text}}';
  }
}
