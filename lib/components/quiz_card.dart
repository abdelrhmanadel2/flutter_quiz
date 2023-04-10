import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/optional.dart';
import 'package:flutter_quiz/model/quiz_question.dart';

import 'package:get/get.dart';

class QuestionCard extends StatefulWidget {
  final Function correctAns;
  const QuestionCard({Key? key, required this.question, required this.correctAns}) : super(key: key);

  final QuizQuestions question;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool answered = false;

  @override
  void initState() {
    // TODO: implement initState
    answered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
          // color: Get.theme.cardColor,
          ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              height: 140,
              // width: 200,
              fit: BoxFit.contain,
              imageUrl: widget.question.questionImg ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(height: 70, width: 70, child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(
              height: 20,
            ),
            // Text(
            //   widget.question.ask!,
            //   style: Get.textTheme.headlineSmall,
            // ),

            //  Wrap(
            //   spacing: 15,
            //   alignment: WrapAlignment.center,
            //   runAlignment: WrapAlignment.center,
            //   runSpacing: 15,
            //   children: [
            //     ...List.generate(widget.question.options?.length ?? 0, (index) {
            //       var option = widget.question.options![index];
            //       return SizedBox(
            //         // height: 110,
            //         child: AnswerWidget(
            //           answer: option,
            //           press: () => widget.correctAns(option),
            //         ),
            //       );
            //     }),
            //   ],
            // )
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              children: [
                ...List.generate(widget.question.options?.length ?? 0, (index) {
                  var option = widget.question.options![index];
                  return SizedBox(
                    // height: 110,
                    child: AnswerWidget(
                      answer: option,
                      press: () => widget.correctAns(option, widget.question),
                    ),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
