import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/loading_request_widget.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/views/home/home_page.dart';
import 'package:flutter_quiz/views/home/user_home_pinding.dart';
import 'package:flutter_quiz/views/loginScreen/login_screen.dart';
import 'package:flutter_quiz/views/loginScreen/login_service.dart';
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

    Future.delayed(const Duration(seconds: 3), () async {
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
    }
    //  Get.offAllNamed(AppData.adminWearhouseCenter);

    else {
      Get.off(() => const LoginScreen());
    }
    // Get.offAllNamed(AppData.signupFormScreen);
  }

  getUserAccess() async {
    await LoginService.authenticateById(id: _storage.accountData?.sId, onSuccess: (data) async => {Get.off(() => HomePage())});
  }
}
