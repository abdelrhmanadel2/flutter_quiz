import 'package:flutter/material.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/views/home/home_page.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/utils/validation_helper.dart';
import 'package:flutter_quiz/views/home/user_home_pinding.dart';
import 'package:flutter_quiz/views/loginScreen/login_service.dart';
import 'package:get/get.dart';

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
  late TextEditingController nameController;
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
    nameController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clear() {
    passwordController.clear();
    // phoneController.clear();
    nameController.clear();
  }

  Future<void> sendInquiry() async {
    try {
      await LoginService.authenticate(
          username: nameController.text,
          password: passwordController.text,
          onSuccess: (data) async => {
                Get.off(() => HomePage()),
                // response = AccountModel.fromJson(data),
                Get.find<StorageService>().setAccountData(data)
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
    return 'LoginController{ _email: ${nameController.value}, _password: ${passwordController.value}}';
  }
}
