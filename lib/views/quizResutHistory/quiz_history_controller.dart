import 'package:flutter/cupertino.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/iq_result.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/views/quizPage/quiz_service.dart';
import 'package:get/get.dart';

class ResultHistoryController extends GetxController {
  ResultHistoryController();
  RxList<IQResult> resultList = List<IQResult>.from([]).obs;
  ScrollController scrollController = ScrollController();

  RxBool isLoadingMore = false.obs;
  RxBool isLoading = false.obs;
  final storage = Get.find<StorageService>();

  late AccountModel user;

  @override
  void onInit() {
    user = storage.accountData!;
    getResultHistory();
    // TODO: implement onInit
    super.onInit();
  }

  Future getResultHistory() async {
    isLoading = true.obs;

    await QuizService.getUerQuizResult(user.sId!, onSuccess: (res) {
      resultList.clear();

      resultList.addAll(res);

      isLoading = false.obs;
    });
  }
}
