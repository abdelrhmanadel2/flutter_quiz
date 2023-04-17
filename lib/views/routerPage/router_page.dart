import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/loading_request_widget.dart';
import 'package:flutter_quiz/components/nav-forkids.dart';
import 'package:flutter_quiz/components/nav.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/views/home/home_page.dart';
import 'package:flutter_quiz/views/home/user_home_pinding.dart';
import 'package:flutter_quiz/views/loginScreen/login_screen.dart';
import 'package:flutter_quiz/views/loginScreen/login_service.dart';
import 'package:flutter_quiz/views/welcomePage/welcome.dart';
import 'package:get/get.dart';

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
        onSuccess: (AccountModel data) async => {(data.type == "parent") ? Get.off(() => NavParernt()) : Get.off(() => Navkid())});
  }
}
