import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/background.dart';
import 'package:flutter_quiz/components/input_field_text.dart';
import 'package:flutter_quiz/views/loginScreen/login_screen.dart';
import 'package:flutter_quiz/views/signupScreen/signup_controller.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Background(
        child: GetBuilder<SignupController>(
            init: SignupController(),
            builder: (controller) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 70),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'قم بالتسجيل الان في \nاختبار',
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Color(0xffe46b10)),
                                children: [
                                  TextSpan(
                                    text: ' الذكاء',
                                    style: TextStyle(color: Colors.black, fontSize: 25),
                                  ),
                                  TextSpan(
                                    text: ' للاطفال  ',
                                    style: TextStyle(color: Color(0xffe46b10), fontSize: 25),
                                  ),
                                ]),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'من المستخدم؟',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.orange),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  title: Text(
                                    "طفل",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.orange),
                                  ),
                                  value: "kids",
                                  groupValue: controller.kind,
                                  onChanged: controller.onKindChange,
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                    title: Text(
                                      "احد الوالدين",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.orange),
                                    ),
                                    value: "parent",
                                    groupValue: controller.kind,
                                    onChanged: controller.onKindChange),
                              ),
                            ],
                          ),
                          // Column(
                          //     children: [

                          //         ],
                          //   ),
                          const SizedBox(height: 20),
                          CustomInputfield(
                            labelText: "اسم المستخدم",
                            // isAutoValidate: true,
                            controller: controller.nameController,
                            validator: controller.validateName,
                          ),
                          const SizedBox(height: 20),
                          CustomInputfield(
                            labelText: "البريد الألكتروني",
                            // isAutoValidate: true,
                            controller: controller.emailController,
                            validator: controller.validateEmail,
                          ),
                          if (controller.kind == "kids") const SizedBox(height: 20),
                          if (controller.kind == "kids")
                            CustomInputfield(
                              labelText: "عمر الطفل",
                              // isAutoValidate: true,
                              keyboardType: TextInputType.number,
                              controller: controller.ageController,
                              validator: controller.validateKidAge,
                            ),
                          const SizedBox(height: 20),
                          CustomInputfield(
                            labelText: "الرقم السري",
                            controller: controller.passwordController,
                            validator: controller.validatePassword,
                            // isAutoValidate: true,
                            obsecure: !controller.visiblePsd,
                            suffixIcon: IconButton(
                                icon: Icon(controller.visiblePsd ? Icons.remove_red_eye : Icons.password_outlined),
                                onPressed: controller.toggleVisiblePsd),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 20),
                          CustomInputfield(
                            labelText: "تأكيد الرقم السري",
                            controller: controller.confirmPasswordController,
                            validator: controller.validateConfirmPassword,
                            // isAutoValidate: true,
                            obsecure: !controller.visiblePsd,
                            suffixIcon: IconButton(
                                icon: Icon(controller.visiblePsd ? Icons.remove_red_eye : Icons.password_outlined),
                                onPressed: controller.toggleVisiblePsd),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 20),

                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.off(LoginScreen());
                                    // Get.offAllNamed(AppData.loginScreen);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        'لدي حساب بالفعل',
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'دخول',
                                        style: TextStyle(color: Color(0xfff79c4f), fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                      ),
                                      SizedBox(width: 4),
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
                                  child: ElevatedButton(
                                      onPressed: () => controller.sendPressed(),
                                      child: const Text(
                                        "سجل الأن",
                                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16, fontWeight: FontWeight.w600),
                                      ))),
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
