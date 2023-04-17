import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/app_bar.dart';
import 'package:flutter_quiz/components/quiz_score.dart';
import 'package:flutter_quiz/components/rich_text_widget.dart';
import 'package:flutter_quiz/views/quizResutHistory/quiz_history_controller.dart';
import 'package:get/get.dart';

class QuizHistoryPage extends StatelessWidget {
  final String user;
  const QuizHistoryPage({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    // Get.put(ResultHistoryController(user));
    context.theme;
    return Scaffold(
      appBar: const AppBarWidget(title: "نتائج الأختبارات"),
      body: GetBuilder<ResultHistoryController>(
          init: ResultHistoryController(user),
          initState: (_) {},
          builder: (controller) {
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Obx(() => (controller.resultList.isNotEmpty && controller.isLoading.isFalse)
                          ? ListView.builder(
                              itemCount: controller.resultList.length,
                              itemBuilder: (_, index) {
                                var item = controller.resultList[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    tileColor: Colors.white,
                                    contentPadding: EdgeInsets.all(10),
                                    onTap: () => Get.to(QuizScore(result: item)),
                                    title: Column(children: [
                                      RitchTextWidget(title: "IQ Score", text: item.iq.toString()),
                                      RitchTextWidget(title: "Mental Age", text: item.mentalAge?.toString() ?? "Na"),
                                      RitchTextWidget(title: "Correct Answers", text: "${item.correctCount.toString()}/${item.questionsCount}"),
                                      RitchTextWidget(title: "Logic", text: item.logicCount.toString()),
                                      RitchTextWidget(title: "Math", text: item.mathCount.toString()),
                                    ]),
                                  ),
                                );
                              })
                          : (controller.isLoading.isTrue)
                              ? const Center(child: CircularProgressIndicator())
                              : const Center(
                                  child: Text("No Results Found"),
                                ))),
                ],
              ),
            );
          }),
    );
  }
}
