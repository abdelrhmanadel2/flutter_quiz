import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/app_bar.dart';
import 'package:flutter_quiz/components/loading_request_widget.dart';
import 'package:flutter_quiz/components/quiz_card.dart';
import 'package:flutter_quiz/model/kid_model.dart';
import 'package:flutter_quiz/services/theme.dart';
import 'package:flutter_quiz/utils/utils.dart';
import 'package:flutter_quiz/views/quizPage/quiz_controller.dart';
import 'package:get/get.dart';

class QuizPage extends StatelessWidget {
  final KidsModel kid;
  const QuizPage({super.key, required this.kid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        titleCenter: true,
        title: "اختبار الذكاء",
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: GetBuilder<QuizController>(
            init: QuizController(kid),
            builder: (controller) {
              return (controller.loading || controller.levelQuestions.isEmpty)
                  ? const RequestLoadingWidgget()
                  : (controller.currentLevel != 3 && controller.quiz.levelDone)
                      ? Card(
                          child: Center(
                            child: Column(
                              children: [
                                spacer(20),
                                Text(
                                  "نتيجه المستوي  (${controller.currentLevel})",
                                  style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                                ),
                                spacer(20),
                                Text(
                                  'النتيجه  : ${(((controller.quiz.levelResult?.correctCount ?? 0) / (controller.quiz.levelResult?.questionsCount ?? 1)) * 100).toStringAsFixed(1)} %',
                                  style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                                ),
                                spacer(20),
                                Text(
                                  'المنطق : ${controller.quiz.levelResult?.logicCount ?? 0} من ${controller.quiz.levelResult?.logicAnswered ?? 0}  ',
                                  style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                                ),
                                spacer(20),
                                Text(
                                  'الرياضيات :   ${controller.quiz.levelResult?.mathCount ?? 0} من  ${controller.quiz.levelResult?.mathAnswered ?? 0}  ',
                                  style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                                ),
                                spacer(20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    if (((controller.quiz.levelResult?.correctCount ?? 0) / (controller.quiz.levelResult?.questionsCount ?? 1)) < 0.7)
                                      ElevatedButton(onPressed: controller.resetTest, child: Text("أعاده الأختبار")),
                                    // if (((controller.quiz.levelResult?.correctCount ?? 0) / (controller.quiz.levelResult?.questionsCount ?? 1)) < 0.7)
                                    ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("الخروج من الأختبار")),
                                    if (((controller.quiz.levelResult?.correctCount ?? 0) / (controller.quiz.levelResult?.questionsCount ?? 1)) > 0.7)
                                      ElevatedButton(onPressed: controller.goToNextLevel, child: Text("الأنتقال للمستوي التالي"))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              margin: EdgeInsets.all(10),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                child: Column(
                                  children: [
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                      //Text('النتيجه :${controller.quiz.totalResult?.correctCount ?? 0} /${controller.levelQuestions.length}',),
                                      // style: Get.textTheme.headlineMedium,

                                      Text(
                                        'السؤال  :${controller.currentIndex + 1}',
                                        // style: Get.textTheme.headlineMedium,
                                      ),
                                      Text(
                                        'المستوى :${controller.currentLevel} ',
                                        // style: Get.textTheme.headlineMedium,
                                      ),
                                    ]),
                                    // SizedBox(height: 10),
                                    // if (controller.loading == false)
                                    //   Align(
                                    //     alignment: Alignment.bottomRight,
                                    //     child: OutlinedButton.icon(
                                    //         onPressed: controller.goToNextQuestion,
                                    //         label: const Text("Next"),
                                    //         icon: const Icon(Icons.arrow_forward_ios_rounded)),
                                    //   ),
                                  ],
                                ),
                              ),
                            ),

                            // Divider(
                            //   thickness: 2,
                            //   color: orangeColor,
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            QuestionCard(
                              question: controller.levelQuestions[controller.currentIndex],
                              correctAns: controller.correctAns,
                            ),
                          ],
                        );
            }),
      ),
    );
  }
}
