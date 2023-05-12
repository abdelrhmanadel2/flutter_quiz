import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz/components/nav-forkids.dart';
import 'package:flutter_quiz/components/nav.dart';
import 'package:flutter_quiz/components/navAdmin.dart';

import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/utils/validation_helper.dart';
import '../home/home_page.dart';
import 'login_service.dart';

const wrongCode = 'assets/images/wrong_code.png';

class LoginController extends GetxController {
  final validatorHelber = ValidatorHelper.instance;

  RxBool _visiblePsd = false.obs;
  var response;
  //fixme make it false

  RxBool _isEnableLogin = false.obs;

  bool get isEnableLogin => _isEnableLogin.value;
  bool get visiblePsd => _visiblePsd.value;

  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }

  set isEnableLogin(bool value) {
    _isEnableLogin.value = value;
    print('LoginController.isEnableSignup value= $value');
    update();
  }

  final formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController emailController;
  bool passValidated = false;
  bool emailValidated = false;
  bool formValidated = false;
  bool nameState = false;
  bool passState = false;
  bool emailState = false;

  // InqueryModel? _inqueryModel;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clear() {
    passwordController.clear();
    // phoneController.clear();
    emailController.clear();
  }

  Future<void> sendInquiry() async {
    try {
      await LoginService.authenticate(
          email: emailController.text,
          password: passwordController.text,
          onSuccess: (data) async {
            if (data.type == "admin")
              Get.off(() => NavAdmin());
            else if (data.type == "parent") {
              Get.off(() => NavParernt());
            } else if (data.type == "kids") {
              Get.off(() => Navkid());
            }

            Get.find<StorageService>().setAccountData(data);
            // Subscrip(),
            // Get.offAllNamed(AppData.initialRoute),
          });
    } catch (e) {}

    // late String successMessage;
    // _inqueryModel = InqueryModel(
    //     name: nameController.text,
    //     email: nameController.text,
    //     mobileNo: phone,
    //     message: messageController.text);

    // await LoginService.sendInquiry(
    //     inquery: _inqueryModel,
    //     errorDialog: errorDialog,
    //     onSuccess: (successMsg) {
    //       successMessage = successMsg;

    //
    //       Get.defaultDialog(
    //           title: "success",
    //           titlePadding: const EdgeInsets.symmetric(vertical: 10),
    //           middleText: successMsg);
    //     });
  }

  void onUpdate(String? value) {
    if (value == "") {
      emailValidated = false;
    }
    update();
  }

  // String? validateHrCode(String? username) {
  //   final validateEmail = validatorHelber.validateHrCode(username);
  //   print("validateEmail $validateEmail");
  //   if (validateEmail == null) {
  //     passState = true;
  //   }
  //   passValidated = true;
  //   return validateEmail;
  // }

  String? validatePassword(String? password) {
    final validatePassword = validatorHelber.validateName(password);
    print("validatePassword $validatePassword");

    if (validatePassword == null) {
      passState = true;
    }
    passValidated = true;
    return validatePassword;
  }

  Future<void> sendPressed() async {
    formValidated = formKey.currentState!.validate();
    if (formValidated) {
      formKey.currentState?.save();
      await sendInquiry();
    }
  }

  // Subscrip() async {
  //   await FirebaseMessaging.instance.subscribeToTopic('User');
  //   print('Subscribe To Topic');
  // }

  @override
  String toString() {
    return 'LoginController{ _email: ${emailController.value}, _password: ${passwordController.value}}';
  }
}
