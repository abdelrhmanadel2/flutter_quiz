import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_quiz/components/feature_tile.dart';
import '../quizResutHistory/quiz_history.dart';
import 'home_contrroller.dart';

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
            Padding(
              padding: const EdgeInsets.only(left: 55),
              child: ElevatedButton(
                onPressed: () {
                  controller.navigate();
                },
                child: Text(
                  "ابدا الاختبار",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55),
              child: SizedBox(
                width: 240,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => QuizHistoryPage(
                          user: controller.kid!.sId!,
                        ));
                  },
                  child: Text(
                    "النتيجه",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
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





// FeatureTile(
            //   leadingIcon: Icons.quiz_outlined,
            //   title: "ابدا الاختبار",
            //   navigation: controller.navigate,
            // ),
            // const SizedBox(
            //   height: 20,
            // ),

            // Container(color: Colors.indigo,
            //   child: SizedBox(height: 100,width: 300,
            //     child: Padding(
            //       padding: const EdgeInsets.only(top:25,right: 30),
            //       child: FeatureTile(
            //         leadingIcon: Icons.history,
            //         title: "الدرجات",
            //         navigation: () => Get.to(() => QuizHistoryPage(
            //               user: controller.kid!.sId!,
            //             )),
            //       ),
            //     ),
            //   ),
            // ),
