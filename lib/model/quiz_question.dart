

import 'answer.dart';

class QuizQuestions {
  String? sId;
  int? level;
  String? category;
  String? tag;
  String? ask;
  String? questionImg;
  String? questionText;
  int? answer;
  String? folderPath;
  List<AnswerModel>? options;

  QuizQuestions(
      {this.sId, this.level, this.category, this.tag, this.ask, this.questionImg, this.questionText, this.answer, this.folderPath, this.options});
  QuizQuestions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    level = json['level'];
    category = json['category'];
    tag = json['tag'];
    ask = json['ask'];
    questionText = json['questionText'];
    questionImg = json['questionImg'];
    answer = json['answer'];
    folderPath = json['folderPath'];
    if (json['options'] != null) {
      options = <AnswerModel>[];
      json['options'].forEach((v) {
        options!.add(AnswerModel.fromJson(v));
      });
    }
  }
  // getQuestionImage() async {
  //   questionImg = await getQuestion(questionImg);
  //   return questionImg;
  // }

  // getAnswersList() async {
  //   options = await getAnswers(folderPath);
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['level'] = level;
    data['category'] = category;
    data['tag'] = tag;
    data['ask'] = ask;
    data['questionImg'] = questionImg;
    data['questionText'] = questionText;
    data['answer'] = answer;
    data['folderPath'] = folderPath;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// getQuestion(folderPath) async => await CloudeStorageService().getFileUrl(path: folderPath);
// getAnswers(folderPath) async => await CloudeStorageService().geturlsFromDirectory(folderPath);
