import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/answer.dart';

class AnswerWidget extends StatefulWidget {
  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.press,
  }) : super(key: key);

  final AnswerModel? answer;

  final VoidCallback press;

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  // Color getRightColor() {
  //         if (qnController.answered) {
  //           if (widget.index == qnController.checkAns) {
  //             return Colors.white;
  //           } else if (widget.index == qnController.selectAns && qnController.selectAns != qnController.checkAns) {
  //             return pinkColor;
  //           }
  //         }
  //         return orangeColor;
  //       }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.press();
        setState(() {});
      },
      child: Card(
        // margin: const EdgeInsets.only(top: 20),
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        // decoration: BoxDecoration(
        //   border: Border.all(color: getRightColor()),
        //   borderRadius: BorderRadius.circular(15),
        // ),
        child: CachedNetworkImage(
          height: 100,
          width: 100,
          imageUrl: widget.answer?.url ?? "",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              SizedBox(height: 70, width: 70, child: Center(child: CircularProgressIndicator(value: downloadProgress.progress))),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
