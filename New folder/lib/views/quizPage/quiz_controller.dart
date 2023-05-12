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
import 'package:get/get.dart';

class QuizController extends GetxController {
  QuizController(this.kids);
  bool loading = true;
  late int currentIndex;
  late int currentLevel;
  int mathCount = 0;
  int logicCount = 0;
  int questionCount = 0;
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
      update();
    } else {
      currentIndex = 0;
      currentLevel = 1;
      levelQuestions = RxList<QuizQuestions>.from([]);
      getLevelQuestions();
      quiz = QuizModel(
          kidId: kids.sId,
          questions: levelQuestions,
          currentQuestion: currentIndex,
          level: currentLevel,
          totalResult: IQResult(
            accountId: kids.sId,
            mathAnswered: 0,
            logicAnswered: 0,
            mentalAge: 0,
            correctCount: 0,
            questionsCount: levelQuestions.length,
            iq: 0,
          ));
      loading = false;
      update();
    }
    print('result: ${quiz.totalResult?.toJson()}');
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
    } else if (quiz.totalResult!.mathAnswered == quiz.totalResult!.logicAnswered) {
      precentage = 0.6;
    } else if (quiz.totalResult!.mathAnswered! < quiz.totalResult!.logicAnswered!) {
      precentage = quiz.totalResult!.logicAnswered! / quiz.totalResult!.correctCount!;
    } else if (quiz.totalResult!.mathAnswered! > quiz.totalResult!.logicAnswered!) {
      precentage = quiz.totalResult!.mathAnswered! / quiz.totalResult!.correctCount!;
    }
    return precentage;
  }

  Future getBabyLevelQuestions() async {
    // levelQuestions.clear();
    loading = true;
    update();
    questionCount = (currentLevel == 1)
        ? 10
        : (currentLevel == 2)
            ? 15
            : 5;
    await QuizService.getLevelQuestions("baby", currentLevel, questionCount, calculateprecentage(), onSuccess: (data) {
      levelQuestions.addAll(data);
      levelQuestions.shuffle();
      quiz.totalResult?.questionsCount = levelQuestions.length;
      loading = false;
      update();
    });
  }

  Future getYoungLevelQuestions() async {
    // levelQuestions.clear();
    loading = true;
    update();
    questionCount = (currentLevel == 1)
        ? 10
        : (currentLevel == 2)
            ? 15
            : 5;
    await QuizService.getLevelQuestions("young", currentLevel, questionCount, calculateprecentage(), onSuccess: (data) {
      levelQuestions.addAll(data);
      levelQuestions.shuffle();

      quiz.totalResult?.questionsCount = levelQuestions.length;

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
    quiz.totalResult?.iq = ((quiz.totalResult!.correctCount! / quiz.totalResult!.questionsCount!) * 160).truncateToDouble();
    quiz.totalResult?.mentalAge = ((quiz.totalResult?.iq ?? 0) * kids.age! / 100).truncateToDouble();
    print((quiz.totalResult!.correctCount! / quiz.totalResult!.questionsCount!) * 160);
    print(quiz.totalResult?.iq);
  }

  saveResult() async {
    storage.setQuizData(quiz);

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

  deleteCurrentQuiz() {
    QuizService.deleteCurrentQuiz(kids.sId);
  }

  handedlLevels() async {
    if (currentLevel == 3) {
      // calculateResult();
      // deleteCurrentQuiz();

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
    print("tage: ${question.tag} mathCount :${quiz.totalResult!.mathAnswered} logicCount :${quiz.totalResult!.logicAnswered}");
    // quiz.result!.correctCount = quiz.result!.correctCount! + 1;

    // if (question.tag == "Math") quiz.result!.mathCount = quiz.result!.mathCount! + 1;

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
      saveResult();
    }
  }
}
