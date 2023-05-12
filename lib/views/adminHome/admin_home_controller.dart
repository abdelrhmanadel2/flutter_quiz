import 'package:flutter/cupertino.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/iq_result.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/views/adminHome/admin_home_service.dart';
import 'package:flutter_quiz/views/quizPage/quiz_service.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  AdminHomeController();
  RxList<AccountModel> userList = List<AccountModel>.from([]).obs;
  ScrollController scrollController = ScrollController();

  RxBool isLoadingMore = false.obs;
  RxBool isLoading = true.obs;
  final storage = Get.find<StorageService>();

  @override
  void onInit() {
    getUserList();
    print("getResultHistory");
    // TODO: implement onInit
    super.onInit();
  }

  Future getUserList() async {
    isLoading = true.obs;

    await AdminHomeService.getUsers(onSuccess: (res) {
      userList.clear();

      userList.addAll(res);

      isLoading = false.obs;
      update();
    });
  }

  Future deleteUser(id) async {
    isLoading = true.obs;

    await AdminHomeService.deleteUser(
        id: id,
        onSuccess: (res) {
          Get.back();
          userList.removeWhere(
            (element) => element.sId == id,
          );
          isLoading = false.obs;
          update();
        });
  }
}
