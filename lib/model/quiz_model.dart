import 'package:flutter_quiz/model/quiz_question.dart';

import 'iq_result.dart';

class QuizModel {
  int? level;
  int? currentQuestion;
  late bool levelDone;
  String? kidId;
  IQResult? totalResult;
  IQResult? levelResult;
  List<QuizQuestions>? questions;

  QuizModel({this.level, this.currentQuestion, this.levelResult, this.totalResult, this.questions, this.kidId, this.levelDone = false});

  QuizModel.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    kidId = json['kidId'];
    levelDone = json['levelDone'];
    currentQuestion = json['currentQuestion'];
    levelResult = json['levelResult'] != null ? IQResult.fromJson(json['levelResult']) : null;
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
    data['levelDone'] = levelDone;
    data['currentQuestion'] = currentQuestion;
    if (totalResult != null) {
      data['totalResult'] = totalResult!.toJson();
    }
    if (levelResult != null) {
      data['levelResult'] = levelResult!.toJson();
    }
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
