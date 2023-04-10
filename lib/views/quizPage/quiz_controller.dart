import 'package:flutter/widgets.dart';
import 'package:flutter_quiz/components/quiz_score.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/answer.dart';
import 'package:flutter_quiz/model/iq_result.dart';
import 'package:flutter_quiz/model/quiz_model.dart';
import 'package:flutter_quiz/model/quiz_question.dart';
import 'package:flutter_quiz/utils/utils.dart';
import 'package:flutter_quiz/views/quizPage/quiz_service.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  QuizController();
  bool loading = true;
  late int currentIndex;
  late int currentLevel;
  int questionCount = 0;
  RxList<QuizQuestions> levelQuestions = List<QuizQuestions>.from([]).obs;
  final storage = Get.find<StorageService>();
  late AccountModel user;
  late QuizModel quiz;
  bool _answered = false;
  bool get answered => _answered;

  @override
  void onInit() {
    user = storage.accountData!;
    quiz = QuizModel();

    if (Get.arguments != null) {
      quiz = Get.arguments as QuizModel;
      currentIndex = quiz.currentQuestion ?? 0;
      currentLevel = quiz.level ?? 1;
      levelQuestions = RxList<QuizQuestions>.from(quiz.questions ?? []);
      loading = false;
    } else {
      currentIndex = 0;
      currentLevel = 1;
      levelQuestions = RxList<QuizQuestions>.from([]);
      getLevelQuestions();
      quiz = QuizModel(
          questions: levelQuestions,
          currentQuestion: currentIndex,
          level: currentLevel,
          result: IQResult(
            accountId: user.sId,
            mathCount: 0,
            logicCount: 0,
            mentalAge: 0,
            correctCount: 0,
            questionsCount: levelQuestions.length,
            iq: 0,
          ));
    }
    print('result: ${quiz.result?.toJson()}');
    super.onInit();
  }

  // preperResult() {
  //   quiz = QuizModel(
  //       questions: levelQuestions,
  //       currentQuestion: currentIndex,
  //       level: currentLevel,
  //       result: IQResult(
  //         accountId: user.sId,
  //         mathCount: 0,
  //         logicCount: 0,
  //         correctCount: 0,
  //         questionsCount: levelQuestions.length,
  //         iq: 0,
  //       ));
  // }

  calculateprecentage() {
    var precentage;
    if (currentLevel == 1) {
      precentage = 0.5;
    } else if (quiz.result!.mathCount == quiz.result!.logicCount) {
      precentage = 0.6;
    } else if (quiz.result!.mathCount! < quiz.result!.logicCount!) {
      precentage = quiz.result!.logicCount! / quiz.result!.correctCount!;
    } else if (quiz.result!.mathCount! > quiz.result!.logicCount!) {
      precentage = quiz.result!.mathCount! / quiz.result!.correctCount!;
    }
    return precentage;
  }

  Future getKidsLevelQuestions() async {
    // levelQuestions.clear();
    loading = true;
    update();
    questionCount = (currentLevel == 1)
        ? 10
        : (currentLevel == 2)
            ? 15
            : 5;
    await QuizService.getLevelQuestions(user.category!, currentLevel, questionCount, calculateprecentage(), onSuccess: (data) {
      levelQuestions.addAll(data);
      quiz.result?.questionsCount = levelQuestions.length;
      loading = false;
      update();
    });
  }

  Future getAdultLevelQuestions() async {
    // levelQuestions.clear();
    loading = true;
    update();
    questionCount = (currentLevel == 1)
        ? 10
        : (currentLevel == 2)
            ? 15
            : 5;
    await QuizService.getLevelQuestions(user.category!, currentLevel, questionCount, calculateprecentage(), onSuccess: (data) {
      levelQuestions.addAll(data);
      quiz.result?.questionsCount = levelQuestions.length;

      loading = false;
      update();
    });
  }

  Future createQuizResult() async {
    // levelQuestions.clear();
    loading = true;

    await QuizService.createQuizResult(quiz.result!.toJson(), onSuccess: (data) {
      storage.setQuizData(null);
      storage.quizData;
      Get.off(() => QuizScore(
            result: data,
          ));
      loading = false;
      update();
    });
  }

  calculateResult() {
    quiz.result?.iq = ((quiz.result!.correctCount! / quiz.result!.questionsCount!) * 160).truncateToDouble();
    quiz.result?.mentalAge = ((quiz.result?.iq ?? 0) * user.age! / 100).truncateToDouble();
    print((quiz.result!.correctCount! / quiz.result!.questionsCount!) * 160);
    print(quiz.result?.iq);
  }

  saveResult() async {
    await storage.setQuizData(quiz);
  }

  Future getLevelQuestions() async {
    if (user.category == "kids") {
      await getKidsLevelQuestions();
    } else {
      await getAdultLevelQuestions();
    }
  }

  goToNextQuestion() async {
    quiz.currentQuestion = currentIndex;
    quiz.level = currentLevel;
    print("currentIndex != levelQuestions.length ${currentIndex != levelQuestions.length}");
    print("currentIndex ${currentIndex}");
    print("levelQuestions.length ${levelQuestions.length}");
    if (!loading && currentIndex + 1 < levelQuestions.length) {
      // Future.delayed(const Duration(seconds: 1), () {
      calculateResult();

      updateQuiz(currentIndex);
      update();
      // });
    } else {
      await handedlLevels();
    }
  }

  handedlLevels() async {
    if (currentLevel == 3) {
      // calculateResult();
      createQuizResult();
      // save
    } else {
      currentLevel++;

      await getLevelQuestions().then((value) => updateQuiz(currentIndex));

      update();
    }
  }

  void correctAns(AnswerModel selectedAnswer, QuizQuestions question) {
    _answered = true;
    // quiz.currentQuestion = currentIndex;
    quiz.level = currentLevel;
    print("tage: ${question.tag} mathCount :${quiz.result!.mathCount} logicCount :${quiz.result!.logicCount}");
    // quiz.result!.correctCount = quiz.result!.correctCount! + 1;

    // if (question.tag == "Math") quiz.result!.mathCount = quiz.result!.mathCount! + 1;

    if (selectedAnswer.isAnswer!) {
      quiz.result!.correctCount = quiz.result!.correctCount! + 1;

      if (question.tag == "Math") quiz.result!.mathCount = quiz.result!.mathCount! + 1;
      if (question.tag == "Logic") quiz.result!.logicCount = quiz.result!.logicCount! + 1;
      showSnack(massage: "Correct Answer");
    } else {
      showSnack(massage: "Wrong Answer");
    }

    goToNextQuestion();
  }

  void updateQuiz(int index) {
    if (currentIndex < levelQuestions.length) {
      currentIndex = index + 1;
      saveResult();
    }
  }
}
