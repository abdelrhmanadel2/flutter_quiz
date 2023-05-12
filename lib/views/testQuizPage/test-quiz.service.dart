import 'package:flutter_quiz/model/quiz_question.dart';
import 'package:flutter_quiz/model/response_model.dart';
import 'package:flutter_quiz/services/api_service.dart';
import 'package:flutter_quiz/services/services.dart';

class TestQuizService {
  static ApiService api = ApiService();

  static Future<List<QuizQuestions>> getTestQuestions({onSuccess}) async {
    List<QuizQuestions> questions = [];
    // showProgressDialog();
    await api.normalRequest(
      Services.getLevelQuestions,
      "POST",
      data: {"count": 4, "percentage": 0.5},
      onSuccess: (data) async {
        var res = ResponseModel.fromJson(data);
        print("res.data${data}");
        print("res.data${res.data.length}");
        for (var element in res.data) {
          var item = QuizQuestions.fromJson(element);

          questions.add(item);
          print("item.options${item.options}");
        }

        if (onSuccess != null) onSuccess(questions);
      },
    );
    print("السؤال$questions");
    return questions;
  }
}
