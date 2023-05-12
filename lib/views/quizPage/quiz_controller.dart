import 'package:flutter_quiz/views/quizPage/quiz_service.dart';
import 'package:get/get.dart';

import 'package:flutter_quiz/components/quiz_score.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/answer.dart';
import 'package:flutter_quiz/model/iq_result.dart';
import 'package:flutter_quiz/model/kid_model.dart';
import 'package:flutter_quiz/model/quiz_model.dart';
import 'package:flutter_quiz/model/quiz_question.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/utils/utils.dart';

class QuizController extends GetxController {
  QuizController(this.kids);
  bool loading = true;
  late int currentIndex;
  late int currentLevel;
  int mathCount = 0;
  int logicCount = 0;
  int levelQuestionCount = 0;
  RxList<QuizQuestions> levelQuestions = List<QuizQuestions>.from([]).obs;
  final storage = Get.find<StorageService>();
  late KidsModel kids;
  late AccountModel user;
  late QuizModel quiz;
  bool _answered = false;
  bool get answered => _answered;

  @override
  void onInit() async {
    quiz = QuizModel();
    user = storage.accountData!;
    await getCurrentQiz();
    if (quiz.level != null) {
      // quiz = Get.arguments as QuizModel;
      currentIndex = quiz.currentQuestion ?? 0;
      currentLevel = quiz.level ?? 1;
      levelQuestions = RxList<QuizQuestions>.from(quiz.questions ?? []);
      loading = false;
      print('levelResult: ${quiz.levelResult?.toJson()}');
      print('Totalresult: ${quiz.totalResult?.toJson()}');

      update();
    } else {
      resetTest();
      loading = false;
      update();
    }
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
    var precentage = 0.0;
    if (currentLevel == 1) {
      precentage = 0.5;
    } else if (quiz.levelResult!.mathAnswered == quiz.levelResult!.logicAnswered) {
      precentage = 0.6;
    } else if (quiz.levelResult!.mathAnswered! < quiz.levelResult!.logicAnswered!) {
      precentage = quiz.levelResult!.logicAnswered! / quiz.levelResult!.correctCount!;
    } else if (quiz.levelResult!.mathAnswered! > quiz.levelResult!.logicAnswered!) {
      precentage = quiz.levelResult!.mathAnswered! / quiz.levelResult!.correctCount!;
    }
    return precentage;
  }

  Future getBabyLevelQuestions() async {
    // levelQuestions.clear();
    loading = true;
    update();
    levelQuestionCount = (currentLevel == 1)
        ? 10
        : (currentLevel == 2)
            ? 15
            : 5;
    var precentage = calculateprecentage();

    await QuizService.getLevelQuestions("baby", currentLevel, levelQuestionCount, precentage, onSuccess: (data) {
      levelQuestions.clear();
      quiz.levelDone = false;
      var ls = ((1 - precentage) * levelQuestionCount).toInt();

      levelQuestions.addAll(data);
      quiz.totalResult!.questionsCount += levelQuestions.length;
      quiz.levelResult = IQResult(
        mathAnswered: 0,
        correctCount: 0,
        logicAnswered: 0,
        logicCount: ls,
        questionsCount: levelQuestions.length,
      );
      quiz.questions = List.from(data);
      currentIndex = 0;
      quiz.currentQuestion = 0;

      loading = false;
      update();
    });
  }

  Future getYoungLevelQuestions() async {
    // levelQuestions.clear();
    loading = true;
    update();
    levelQuestionCount = (currentLevel == 1)
        ? 10
        : (currentLevel == 2)
            ? 15
            : 5;
    var precentage = calculateprecentage();
    await QuizService.getLevelQuestions("young", currentLevel, levelQuestionCount, precentage, onSuccess: (data) {
      levelQuestions.clear();
      var ls = ((1 - precentage) * levelQuestionCount).toInt();
      quiz.levelDone = false;
      levelQuestions.addAll(data);
      quiz.totalResult!.questionsCount += levelQuestions.length;

      quiz.levelResult = IQResult(
        mathAnswered: 0,
        correctCount: 0,
        logicAnswered: 0,
        logicCount: ls,
        mathCount: (precentage * levelQuestionCount).toInt(),
        questionsCount: levelQuestions.length,
      );

      quiz.totalResult!.questionsCount += levelQuestions.length;
      print("questionsCount ${quiz.totalResult?.questionsCount}");

      levelQuestions.shuffle();
      quiz.questions = List.from(data);

      currentIndex = 0;
      quiz.currentQuestion = 0;
      loading = false;
      update();
    });
  }

  Future createQuizResult() async {
    // levelQuestions.clear();
    loading = true;

    await QuizService.createQuizResult(quiz.totalResult!.toJson(), onSuccess: (data) {
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
    quiz.totalResult?.iq = ((quiz.totalResult!.correctCount! / quiz.totalResult!.questionsCount) * 160).truncateToDouble();
    quiz.totalResult?.mentalAge = ((quiz.totalResult?.iq ?? 0) * kids.age! / 100).truncateToDouble();
    print((quiz.totalResult!.correctCount! / quiz.totalResult!.questionsCount) * 160);
    print(quiz.totalResult?.iq);
  }

  saveResult() async {
    quiz.level = currentLevel;
    quiz.currentQuestion = currentIndex;
    await storage.setQuizData(quiz);

    // await QuizService.addCurrentQuiz(quiz.toJson(), onSuccess: (data) {
    //   // if (data != null) quiz = data;
    // });
  }

  getCurrentQiz() async {
    if (user.type == "kids") {
      quiz = storage.quizData ?? QuizModel();
    }

    // await QuizService.getCurrentQuiz(kids.sId, onSuccess: (data) {
    //   if (data != null) quiz = data;
    //   // print("Data ${data.toJson()}");
    // });
  }

  Future getLevelQuestions() async {
    if (kids.category == "baby") {
      await getBabyLevelQuestions();
    } else {
      await getYoungLevelQuestions();
    }
  }

  goToNextQuestion() async {
    print("currentIndex != levelQuestions.length ${currentIndex != levelQuestions.length - 1}");
    print("currentIndex ${currentIndex}");
    print("levelQuestions.length ${levelQuestions.length}");
    if (!loading && currentIndex + 1 < levelQuestions.length) {
      // Future.delayed(const Duration(seconds: 1), () {
      //  calculateResult();

      updateQuiz(currentIndex);
      update();
      // });
    } else {
      await handedlLevels();
    }

    print("currentLevel $currentLevel");
  }

  deleteCurrentQuiz() {
    QuizService.deleteCurrentQuiz(kids.sId);
  }

  handedlLevels() async {
    if (currentLevel == 3) {
      calculateResult();
      deleteCurrentQuiz();

      createQuizResult();
      // save
    } else {
      // currentLevel++;
      // quiz.level = currentLevel;
      // update();
      // print("currentLevel $currentLevel");
      // await getLevelQuestions();
      quiz.levelDone = true;

      saveResult();

      update();
    }
  }

  goToNextLevel() async {
    currentLevel++;
    quiz.level = currentLevel;
    print("currentLevel $currentLevel");

    await getLevelQuestions();
    quiz.totalResult?.correctCount = (quiz.totalResult?.correctCount ?? 0) + quiz.levelResult!.correctCount!;
    quiz.totalResult?.mathCount = (quiz.totalResult?.mathCount ?? 0) + quiz.levelResult!.mathCount!;
    quiz.totalResult?.logicCount = (quiz.totalResult?.logicCount ?? 0) + quiz.levelResult!.logicCount!;
    quiz.totalResult?.mathAnswered = (quiz.totalResult?.mathAnswered ?? 0) + quiz.levelResult!.mathAnswered!;
    quiz.totalResult?.logicAnswered = (quiz.totalResult?.logicAnswered ?? 0) + quiz.levelResult!.logicAnswered!;

    update();
  }

  void correctAns(AnswerModel selectedAnswer, QuizQuestions question) {
    _answered = true;
    // storage.setQuizData(null);
    // quiz.currentQuestion = currentIndex;
    print("questionsCount ${quiz.totalResult?.questionsCount}");

    quiz.level = currentLevel;
    print("tage: ${question.tag} mathCount :${quiz.totalResult!.mathAnswered} logicCount :${quiz.totalResult!.logicAnswered}");
    // quiz.result!.correctCount = quiz.result!.correctCount! + 1;

    // if (question.tag == "Math") quiz.result!.mathCount = quiz.result!.mathCount! + 1;

    if (selectedAnswer.isAnswer!) {
      quiz.levelResult!.correctCount = quiz.levelResult!.correctCount! + 1;
      quiz.totalResult!.correctCount = quiz.totalResult!.correctCount! + 1;

      if (question.tag == "Math") {
        quiz.totalResult!.mathAnswered = quiz.totalResult!.mathAnswered! + 1;
        quiz.levelResult!.mathAnswered = quiz.levelResult!.mathAnswered! + 1;
      }
      if (question.tag == "Logic") {
        quiz.totalResult!.logicAnswered = quiz.totalResult!.logicAnswered! + 1;

        quiz.levelResult!.logicAnswered = quiz.levelResult!.logicAnswered! + 1;
      }

      showSnack(massage: "اجابه صحيحه");
    } else {
      showSnack(massage: "اجابه خاطئه");
    }
    print('Totalresult: ${quiz.totalResult?.toJson()}');

    goToNextQuestion();
  }

  void updateQuiz(int index) {
    // if (currentIndex < levelQuestions.length) {
    currentIndex = index + 1;
    quiz.level = currentLevel;
    quiz.currentQuestion = currentIndex;
    saveResult();
    // }
  }

  resetTest() {
    storage.setQuizData(null);
    currentIndex = 0;
    currentLevel = 1;
    levelQuestions = RxList<QuizQuestions>.from([]);
    quiz = QuizModel(
        kidId: kids.sId,
        questions: levelQuestions,
        currentQuestion: currentIndex,
        level: currentLevel,
        // levelResult: IQResult(mathAnswered: 0, logicAnswered: 0, questionsCount: 0),
        totalResult: IQResult(
          accountId: kids.sId,
          mathAnswered: 0,
          logicAnswered: 0,
          mentalAge: 0,
          correctCount: 0,
          questionsCount: 0,
          iq: 0,
        ));
    getLevelQuestions();

    update();
  }
}
