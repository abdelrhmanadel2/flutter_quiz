import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/quiz_model.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/views/loginScreen/login_screen.dart';
import 'package:flutter_quiz/views/quizPage/quiz_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final storage = Get.find<StorageService>();
  var user;
  late QuizModel? quiz;
  HomeController();
  @override
  onInit() {
    quiz = storage.quizData;
    if (quiz != null) {
      print(quiz);
      // Get.to(() => QuizPage(), arguments: quiz);
    }
    super.onInit();
  }

  logOut() {
    storage.setAccountData(null);
    Get.off(() => LoginScreen());
  }

  navigate() {
    quiz = storage.quizData;
    Get.to(() => const QuizPage(), arguments: quiz);
    update();
  }
}
