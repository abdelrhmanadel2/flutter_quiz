import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz/components/navAdmin.dart';

import 'package:flutter_quiz/components/loading_request_widget.dart';
import 'package:flutter_quiz/components/nav-forkids.dart';
import 'package:flutter_quiz/components/nav.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import '../loginScreen/login_service.dart';
import '../welcomePage/welcome.dart';

class RouterPage extends StatefulWidget {
  const RouterPage({Key? key}) : super(key: key);
  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  final _storage = Get.find<StorageService>();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () async {
      chekIfLoggedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Get.theme.scaffoldBackgroundColor,
        //   // title: "AFRO",
        // ),
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Wrap(
          children: const [RequestLoadingWidgget()],
        ),
      ]),
    ));
  }

  void chekIfLoggedIn() async {
    if (_storage.accountData?.sId != null) {
      await getUserAccess();
    } else {
      Get.off(() => const WelcomePage());
    }
  }

  getUserAccess() async {
    await LoginService.authenticateById(
        id: _storage.accountData?.sId,
        onSuccess: (AccountModel data) async {
          if (data.type == "admin")
            Get.off(() => NavAdmin());
          else if (data.type == "parent") {
            Get.off(() => NavParernt());
          } else if (data.type == "kids") {
            Get.off(() => Navkid());
          }
        });
  }
}
