import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RitchTextWidget extends StatelessWidget {
  final String title;
  final String? text;
  final String? sperator;
  final TextStyle? titleStyle;
  final TextStyle? spanStyle;
  const RitchTextWidget({super.key, required this.title, this.text, this.titleStyle, this.spanStyle, this.sperator});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: '${title} ${sperator ?? ":"}',
      style: titleStyle ??
          Get.textTheme.bodyText2?.merge(
            const TextStyle(fontWeight: FontWeight.bold),
          ),
      children: <TextSpan>[
        TextSpan(text: ' $text', style: spanStyle),
      ],
    ));
  }
}
