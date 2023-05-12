import 'package:flutter_quiz/model/iq_result.dart';
import 'package:flutter_quiz/model/quiz_question.dart';

class QuizModel {
  int? level;
  int? currentQuestion;
  String? kidId;
  IQResult? totalResult;
  IQResult? levelResult;
  List<QuizQuestions>? questions;

  QuizModel({this.level, this.currentQuestion, this.totalResult, this.questions, this.kidId});

  QuizModel.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    kidId = json['kidId'];
    currentQuestion = json['currentQuestion'];
    totalResult = json['levelResult'] != null ? IQResult.fromJson(json['levelResult']) : null;
    totalResult = json['totalResult'] != null ? IQResult.fromJson(json['totalResult']) : null;
    if (json['questions'] != null) {
      questions = <QuizQuestions>[];
      json['questions'].forEach((v) {
        questions!.add(QuizQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['level'] = level;
    data['kidId'] = kidId;
    data['currentQuestion'] = currentQuestion;
    if (totalResult != null) {
      data['totalResult'] = totalResult!.toJson();
    }
    if (levelResult != null) {
      data['levelResult'] = totalResult!.toJson();
    }
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
