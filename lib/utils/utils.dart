import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/loading_request_widget.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

spacer(double height) {
  return SizedBox(
    height: height,
  );
}

statusDialog(message, type, {onConfirmBtnTap}) => {
      // Get.until((route) => !Get.isDialogOpen!),
      if (Get.isOverlaysOpen || Get.isDialogOpen == true) Get.back(),
      QuickAlert.show(
        confirmBtnText: "okey",
        onConfirmBtnTap: onConfirmBtnTap,
        confirmBtnColor: Get.theme.colorScheme.primary,
        context: Get.context!,
        type: type,
        title: (type == QuickAlertType.success)
            ? "Success"
            : (type == QuickAlertType.warning || type == QuickAlertType.confirm)
                ? "Attention!!"
                : 'Oops...',
        text: message,
      )
    };

showSnack({String? title, required String massage, int duration = 2}) {
  if (Get.isSnackbarOpen) {
    return;
  }
  Future.delayed(const Duration(milliseconds: 10), () {
    Get.showSnackbar(GetSnackBar(
      margin: const EdgeInsets.all(50),
      borderRadius: 12,
      title: title,
      messageText: Text(
        massage,
        style: Get.textTheme.button?.apply(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: duration),
    ));
  });
}

showProgressDialog() {
  Get.until((route) => !Get.isDialogOpen!);

  Future.delayed(Duration.zero, () {
    try {
      // showDialog(
      //   context: Get.context!,
      //   barrierDismissible: false,
      //   builder: (BuildContext context) {
      //     //prevent Back button press
      //     return WillPopScope(
      //         onWillPop: () async => false,
      //         child: const AlertDialog(
      //           backgroundColor: Colors.transparent,
      //           elevation: 0,
      //           content: RequestLoadingWidgget(),
      //         ));
      //   },
      // );
      Get.dialog(const RequestLoadingWidgget(), barrierDismissible: false);
    } catch (e) {
      if (kDebugMode) {
        print("e.toString()");
      }
    }
  });
}
