import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/app_bar.dart';
import 'package:flutter_quiz/components/loading_request_widget.dart';
import 'package:flutter_quiz/components/quiz_card.dart';
import 'package:flutter_quiz/services/theme.dart';
import 'package:flutter_quiz/views/quizPage/quiz_controller.dart';
import 'package:get/get.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        titleCenter: true,
        title: "IQ TEST",
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: GetBuilder<QuizController>(
            init: QuizController(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Text(
                              'Level :${controller.currentLevel} ',
                              style: Get.textTheme.headlineMedium,
                            ),
                            Text(
                              'Result :${controller.quiz.result?.correctCount ?? 0} /${controller.levelQuestions.length}',
                              style: Get.textTheme.headlineMedium,
                            ),
                            Text(
                              'Question :${controller.quiz.currentQuestion! + 1}',
                              style: Get.textTheme.headlineMedium,
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
                  (controller.loading || controller.levelQuestions.isEmpty)
                      ? const RequestLoadingWidgget()
                      : QuestionCard(
                          question: controller.levelQuestions[controller.currentIndex],
                          correctAns: controller.correctAns,
                        ),
                  // Obx(() => (controller.quiz.isEmpty)
                  //     ? RequestLoadingWidgget()
                  //     : Expanded(
                  //         child: PageView.builder(
                  //           physics: const NeverScrollableScrollPhysics(),
                  //           controller: controller.pageController,
                  //           onPageChanged: controller.updateQuiz,
                  //           itemCount: controller.quiz.length,
                  //           itemBuilder: (context, index) => QuizCard(quiz: controller.quiz[index]),
                  //         ),
                  //       )),
                ],
              );
            }),
      ),
    );
  }
}
