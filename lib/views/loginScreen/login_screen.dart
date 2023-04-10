import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/app_bar.dart';
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
    return Scaffold(
        appBar: AppBarWidget(
          title: "Login",
          titleCenter: true,
          automaticallyImplyLeading: false,
        ),
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) => SafeArea(
                  child: Form(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.formKey,

                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            height: 18,
                          ),
                          CustomInputfield(
                            labelText: "Name",
                            // isAutoValidate: true,
                            controller: controller.nameController,
                            validator: controller.validatorHelber.validateName,
                          ),
                          const SizedBox(height: 20),
                          CustomInputfield(
                            labelText: "Password",
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
                                  child: ElevatedButton(onPressed: () => controller.sendPressed(), child: const Text("logIn"))),
                            ),
                          ),
                          spacer(100),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: () {
                                Get.off(SignupScreen());
                              },
                              child: Text(
                                "Don't Have Account",
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
