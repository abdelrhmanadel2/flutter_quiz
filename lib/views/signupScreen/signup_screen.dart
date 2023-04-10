import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/input_field_text.dart';
import 'package:flutter_quiz/views/loginScreen/login_screen.dart';
import 'package:flutter_quiz/views/signupScreen/signup_controller.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: GetBuilder<SignupController>(
            init: SignupController(),
            builder: (controller) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 70),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          const SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Sign Up",
                            style: theme.textTheme.headline4,
                          ),
                          const SizedBox(height: 20),
                          CustomInputfield(
                            labelText: "Name",
                            // isAutoValidate: true,
                            controller: controller.nameController,
                            validator: controller.validateName,
                          ),
                          const SizedBox(height: 20),
                          CustomInputfield(
                            labelText: "UserName",
                            // isAutoValidate: true,
                            controller: controller.userNameController,
                            validator: controller.validateName,
                          ),
                          const SizedBox(height: 20),
                          CustomInputfield(
                            labelText: "Age",
                            // isAutoValidate: true,
                            keyboardType: TextInputType.number,
                            controller: controller.ageController,
                            validator: controller.validatorHelber.validateAge,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.off(LoginScreen());
                                    // Get.offAllNamed(AppData.loginScreen);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text("Alredy Have An Account?"),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_right_alt_rounded,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Center(
                            child: SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                                  child: ElevatedButton(onPressed: () => controller.sendPressed(), child: const Text("SignUp"))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )));

    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Sign up"),
    //   ),
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         Text(
    //           "Sign up",
    //           style: theme.textTheme.headline1,
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
