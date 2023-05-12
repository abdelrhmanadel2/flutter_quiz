import 'package:flutter/widgets.dart';
import 'package:flutter_quiz/components/quiz_score.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/answer.dart';
import 'package:flutter_quiz/model/iq_result.dart';
import 'package:flutter_quiz/model/kid_model.dart';
import 'package:flutter_quiz/model/quiz_model.dart';
import 'package:flutter_quiz/model/quiz_question.dart';
import 'package:flutter_quiz/utils/utils.dart';
import 'package:flutter_quiz/views/quizPage/quiz_service.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/views/testQuizPage/test-quiz.service.dart';
import 'package:get/get.dart';

class TestQuizController extends GetxController {
  TestQuizController();
  bool loading = true;
  late int currentIndex;
  int mathCount = 0;
  int logicCount = 0;
  int questionCount = 0;
  RxList<QuizQuestions> levelQuestions = List<QuizQuestions>.from([]).obs;
  final storage = Get.find<StorageService>();
  late QuizModel quiz;
  bool _answered = false;
  bool get answered => _answered;
  @override
  void onInit() async {
    quiz = QuizModel();
    currentIndex = 0;
    levelQuestions = RxList<QuizQuestions>.from([]);
    getLevelQuestions();
    quiz = QuizModel(
        questions: levelQuestions,
        currentQuestion: currentIndex,
        totalResult: IQResult(
          mathAnswered: 0,
          logicAnswered: 0,
          mentalAge: 0,
          correctCount: 0,
          questionsCount: levelQuestions.length,
          iq: 0,
        ));
    loading = false;
    update();
    print('result: ${quiz.totalResult?.toJson()}');
    super.onInit();
  }

  Future getLevelQuestions() async {
    loading = true;
    update();
    await TestQuizService.getTestQuestions(onSuccess: (data) {
      levelQuestions.addAll(data);
      levelQuestions.shuffle();
      quiz.totalResult?.questionsCount = levelQuestions.length;
      loading = false;
      update();
    });
  }

  calculateResult() {
    quiz.totalResult?.iq = ((quiz.totalResult!.correctCount! / quiz.totalResult!.questionsCount!) * 160).truncateToDouble();
    print((quiz.totalResult!.correctCount! / quiz.totalResult!.questionsCount!) * 160);
    print(quiz.totalResult?.iq);
  }

  goToNextQuestion() async {
    quiz.currentQuestion = currentIndex;
    print("currentIndex != levelQuestions.length ${currentIndex != levelQuestions.length}");
    print("currentIndex ${currentIndex}");
    print("levelQuestions.length ${levelQuestions.length}");
    if (!loading && currentIndex + 1 < levelQuestions.length) {
      calculateResult();
      updateQuiz(currentIndex);
      update();
    } else {
      Get.off(() => QuizScore(
            result: quiz.totalResult!,
          ));
    }
  }

  void correctAns(AnswerModel selectedAnswer, QuizQuestions question) {
    _answered = true;
    print("tage: ${question.tag} mathCount :${quiz.totalResult!.mathAnswered} logicCount :${quiz.totalResult!.logicAnswered}");
    if (selectedAnswer.isAnswer!) {
      quiz.totalResult!.correctCount = quiz.totalResult!.correctCount! + 1;
      if (question.tag == "Math") quiz.totalResult!.mathAnswered = quiz.totalResult!.mathAnswered! + 1;
      if (question.tag == "Logic") quiz.totalResult!.logicAnswered = quiz.totalResult!.logicAnswered! + 1;
      showSnack(massage: "Correct Answer");
    } else {
      showSnack(massage: "Wrong Answer");
    }
    goToNextQuestion();
  }

  void updateQuiz(int index) {
    if (currentIndex < levelQuestions.length) {
      currentIndex = index + 1;
    }
  }
}
