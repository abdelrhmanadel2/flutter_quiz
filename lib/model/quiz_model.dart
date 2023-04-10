import 'package:flutter_quiz/model/iq_result.dart';
import 'package:flutter_quiz/model/quiz_question.dart';

class QuizModel {
  int? level;
  int? currentQuestion;
  IQResult? result;
  List<QuizQuestions>? questions;

  QuizModel({this.level, this.currentQuestion, this.result, this.questions});

  QuizModel.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    currentQuestion = json['currentQuestion'];
    result = json['result'] != null ? IQResult.fromJson(json['result']) : null;
    if (json['questions'] != null) {
      questions = <QuizQuestions>[];
      json['questions'].forEach((v) {
        questions!.add(QuizQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['level'] = this.level;
    data['currentQuestion'] = this.currentQuestion;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
