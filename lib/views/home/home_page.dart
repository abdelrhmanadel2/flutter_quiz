import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/app_bar.dart';
import 'package:flutter_quiz/components/feature_tile.dart';
import 'package:flutter_quiz/services/theme.dart';
import 'package:flutter_quiz/views/home/home_contrroller.dart';
import 'package:flutter_quiz/views/quizPage/quiz_page.dart';
import 'package:flutter_quiz/views/quizResutHistory/quiz_history.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(
      //   title: "",
      //   titleCenter: true,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: TextButton(
      //           onPressed: () {
      //             controller.logOut();
      //           },
      //           child: const Text("Sign Out")),
      //     )
      //   ],
      // ),
      // backgroundColor: purpleColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FeatureTile(
              leadingIcon: Icons.quiz_outlined,
              title: "Strat Quiz",
              navigation: controller.navigate,
            ),
            const SizedBox(
              height: 20,
            ),
            FeatureTile(
              leadingIcon: Icons.history,
              title: "Quiz History",
              navigation: () => Get.to(() => QuizHistoryPage(
                    user: controller.kid!.sId!,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
