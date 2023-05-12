import 'package:flutter/cupertino.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/iq_result.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/views/quizPage/quiz_service.dart';
import 'package:get/get.dart';

class ResultHistoryController extends GetxController {
  String user;
  ResultHistoryController(this.user);
  RxList<IQResult> resultList = List<IQResult>.from([]).obs;
  ScrollController scrollController = ScrollController();

  RxBool isLoadingMore = false.obs;
  RxBool isLoading = true.obs;
  final storage = Get.find<StorageService>();

  @override
  void onInit() {
    getResultHistory();
    print("getResultHistory");
    // TODO: implement onInit
    super.onInit();
  }

  Future getResultHistory() async {
    isLoading = true.obs;

    await QuizService.getUerQuizResult(user, onSuccess: (res) {
      resultList.clear();

      resultList.addAll(res);

      isLoading = false.obs;
      update();
    });
  }
}
