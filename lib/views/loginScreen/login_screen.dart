import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/app_bar.dart';
import 'package:flutter_quiz/components/background.dart';
import 'package:flutter_quiz/components/input_field_text.dart';
import 'package:flutter_quiz/utils/utils.dart';
import 'package:flutter_quiz/views/loginScreen/login_controller.dart';
import 'package:flutter_quiz/views/signupScreen/signup_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Background(
        child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) => SafeArea(
                  child: Form(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.formKey,

                    child: SingleChildScrollView(
                      padding: const EdgeInsetsDirectional.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'اختبار',
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xffe46b10)),
                                  children: [
                                    TextSpan(
                                      text: 'الذكاء',
                                      style: TextStyle(color: Colors.black, fontSize: 30),
                                    ),
                                    TextSpan(
                                      text: '\n للاطفال  ',
                                      style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
                                    ),
                                  ])),
                          const SizedBox(
                            height: 18,
                          ),
                          CustomInputfield(
                            labelText: "البريد الألكتروني",
                            // isAutoValidate: true,
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: controller.validatorHelber.validateName,
                          ),
                          const SizedBox(height: 20),
                          CustomInputfield(
                            labelText: "الرقم السري",
                            controller: controller.passwordController,
                            validator: controller.validatePassword,
                            // isAutoValidate: true,
                            obsecure: !controller.visiblePsd,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 22),
                          const SizedBox(height: 22),
                          const SizedBox(height: 25),
                          Center(
                            child: SizedBox(
                              width: Get.width * 0.5,
                              height: 45,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                                  child: ElevatedButton(
                                      onPressed: () => controller.sendPressed(),
                                      child: const Text(
                                        'ادخل الان',
                                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16, fontWeight: FontWeight.w600),
                                      ))),
                            ),
                          ),
                          spacer(100),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                  onTap: () {
                                    Get.off(SignupScreen());
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        'ليس لدي حساب؟ ',
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'تسجيل الان',
                                        style: TextStyle(color: Color(0xfff79c4f), fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                      ),
                                      SizedBox(width: 4),
                                    ],
                                  ))),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
