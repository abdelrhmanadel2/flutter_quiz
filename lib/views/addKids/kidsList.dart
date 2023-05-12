import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_quiz/components/input_field_text.dart';
import '../quizPage/quiz_page.dart';
import '../quizResutHistory/quiz_history.dart';
import 'kids_list_controller.dart';

class AddChild extends StatelessWidget {
  const AddChild({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KidsListController>(
        init: KidsListController(),
        initState: (_) {},
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("قائمه الأطفال", style: TextStyle(color: Colors.white)),
            ),
            body: ListView.builder(
                padding: EdgeInsets.only(top: 38.0, right: 10, left: 10, bottom: 100),
                itemCount: controller.kidsList.length,
                itemBuilder: (content, index) {
                  var kid = controller.kidsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 8,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            //  name
                            Text(' الطفل : ${kid.name} '),
                            // age
                            Text('عمره: ${kid.age}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
                                  onPressed: () {
                                    Get.to(() => QuizHistoryPage(user: kid.sId!));
                                  },
                                  child: const Text("عرض النتائج"),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
                                  onPressed: () {
                                    Get.to(
                                      () => QuizPage(
                                        kid: kid,
                                      ),
                                    );

                                    // Navigator.push(
                                    //     context,

                                    // MaterialPageRoute(
                                    //     builder: (context) => QuizPage(
                                    //           kid: kid,
                                    //         )));
                                  },
                                  child: const Text("انتقل للاختبار"),
                                )
                              ],
                            ),
                          ])),
                    ),
                  );
                }),
            floatingActionButton: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
              //   backgroundColor: Colors.blue,
              child: const Text(
                "اضافه طفل",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                Get.defaultDialog(
                    title: "اضف طفل جديد",
                    onConfirm: () => controller.addKid(),
                    content: Column(
                      children: [
                        CustomInputfield(
                          labelText: "اسم المستخدم",
                          // isAutoValidate: true,
                          controller: controller.nameController,
                          validator: controller.validateName,
                        ),
                        const SizedBox(height: 20),
                        CustomInputfield(
                          labelText: "عمر الطفل",
                          // isAutoValidate: true,
                          keyboardType: TextInputType.number,
                          controller: controller.ageController,
                          validator: controller.validateAge,
                        ),
                      ],
                    ));
              },
            ),
          );
        });
  }
}
