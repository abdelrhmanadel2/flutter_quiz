import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/kid_model.dart';
import 'package:flutter_quiz/model/quiz_model.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/views/addKids/kids_service.dart';
import 'package:flutter_quiz/views/loginScreen/login_screen.dart';
import 'package:flutter_quiz/views/quizPage/quiz_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final storage = Get.find<StorageService>();
  AccountModel? user;
  late QuizModel? quiz;
  late KidsModel? kid;
  HomeController();
  @override
  onInit() {
    user = storage.accountData;
    quiz = storage.quizData;
    if (quiz != null) {
      print(quiz);
      // Get.to(() => QuizPage(), arguments: quiz);
    }
    getKidByAccountID();
    super.onInit();
  }

  getKidByAccountID() {
    KidsService.getKidByAccountID(
        id: user?.sId!,
        onSuccess: (data) {
          kid = data;
        });
  }

  logOut() {
    storage.setAccountData(null);
    storage.setQuizData(null);
    Get.off(() => LoginScreen());
  }

  navigate() {
    quiz = storage.quizData;
    if (kid != null) Get.to(() => QuizPage(kid: kid!), arguments: quiz);
    update();
  }
}
