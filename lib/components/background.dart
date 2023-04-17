import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/clip.dart';
import 'package:get/get.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -100,
            right: -170,
            child: Container(
                child: Transform.rotate(
              angle: -pi / 3.5,
              child: ClipPath(
                clipper: ClipPainter(),
                child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xfffbb442), Color(0xffe46b10)])),
                ),
              ),
            )),
          ),
          // Positioned(
          //     top: 40,
          //     left: 0,
          //     child: GestureDetector(
          //       onTap: () {
          //         print("get.back");
          //         Get.back();
          //       },
          //       child: Container(
          //         padding: EdgeInsets.symmetric(horizontal: 10),
          //         child: Row(
          //           children: <Widget>[
          //             Text("تراجع", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          //             Container(
          //               padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
          //               child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
          //             ),
          //           ],
          //         ),
          //       ),
          //     )),
          Positioned(child: child),
        ],
      ),
    );
  }
}
