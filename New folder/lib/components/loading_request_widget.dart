import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestLoadingWidgget extends StatelessWidget {
  const RequestLoadingWidgget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Wrap(children: [CircularProgressIndicator()]),
      ),
    );
  }
}
