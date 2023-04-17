import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/app_bar.dart';
import 'package:flutter_quiz/model/iq_result.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/services/theme.dart';
import 'package:get/get.dart';

class QuizScore extends StatelessWidget {
  final IQResult result;
  const QuizScore({super.key, required this.result});
  @override
  Widget build(BuildContext context) {
    var user = Get.find<StorageService>().accountData!;

    return Scaffold(
      // backgroundColor: purpleColor,
      appBar: AppBarWidget(title: "Result Details"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Name: ${user.name}",
            //   style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            // ),
            // Text(
            //   'Age :${user.age!} Years',
            //   style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            // ),
            Text(
              'Test Result',
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            Text(
              'Result :${result.correctCount ?? 0} /${result.questionsCount}',
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            Text(
              'Logic :${result.logicCount ?? 0}',
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            Text(
              'Math :${result.mathCount ?? 0}',
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            Text(
              'IQ :${(result.iq ?? 0)}',
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            Text(
              'Mental Age :${result.mentalAge} Years',
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
