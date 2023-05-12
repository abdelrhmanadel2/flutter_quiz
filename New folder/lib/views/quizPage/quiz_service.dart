import 'package:flutter_quiz/model/iq_result.dart';
import 'package:flutter_quiz/model/quiz_model.dart';
import 'package:flutter_quiz/model/quiz_question.dart';
import 'package:flutter_quiz/model/response_model.dart';
import 'package:flutter_quiz/services/api_service.dart';
import 'package:flutter_quiz/services/services.dart';
import 'package:flutter_quiz/utils/utils.dart';
import 'package:get/get.dart';

class QuizService {
  static ApiService api = ApiService();

  static Future<List<QuizQuestions>> getLevelQuestions(String category, int level, int count, double precentage, {onSuccess}) async {
    List<QuizQuestions> questions = [];
    // showProgressDialog();
    await api.normalRequest(
      Services.getLevelQuestions,
      "POST",
      data: {"category": category, "level": level, "count": count, "percentage": precentage},
      onSuccess: (data) async {
        var res = ResponseModel.fromJson(data);
        print("res.data${res.data}");
        print("res.data${res.data.length}");
        for (var element in res.data) {
          var item = QuizQuestions.fromJson(element);

          questions.add(item);
          print("item.options${item.options}");
        }

        if (onSuccess != null) onSuccess(questions);
      },
    );
    print("questions $questions");
    return questions;
  }

  static Future<List<IQResult>> getUerQuizResult(String id, {onSuccess}) async {
    List<IQResult> results = [];
    showProgressDialog();
    await api.normalRequest(
      Services.getUserQuizResults,
      "GET",
      queryParamters: {"id": id},
      onSuccess: (data) async {
        var res = ResponseModel.fromJson(data);
        for (var element in res.data) {
          var item = IQResult.fromJson(element);
          results.add(item);
        }

        if (onSuccess != null) onSuccess(results);
      },
    );
    print("results $results");
    return results;
  }

  static Future<IQResult?> createQuizResult(data, {onSuccess}) async {
    IQResult? result;

    await api.normalRequest(
      Services.addQuizResult,
      "POST",
      data: data,
      onSuccess: (data) async {
        var res = ResponseModel.fromJson(data);

        result = IQResult.fromJson(res.data);

        if (onSuccess != null) onSuccess(result);
      },
    );
    print("result $result");
    return result;
  }

  static Future<QuizModel?> addCurrentQuiz(data, {onSuccess}) async {
    QuizModel? result;

    await api.normalRequest(
      Services.addCurrentQuiz,
      "POST",
      data: data,
      onSuccess: (data) async {
        var res = ResponseModel.fromJson(data);

        result = (res.data != null) ? QuizModel.fromJson(res.data) : null;

        if (onSuccess != null) onSuccess(result);
      },
    );
    print("result $result");
    return result;
  }

  static Future<QuizModel?> getCurrentQuiz(id, {onSuccess}) async {
    QuizModel? result;

    await api.normalRequest(
      Services.getCurrentQuiz,
      "GET",
      queryParamters: {"id": id},
      onSuccess: (data) async {
        var res = ResponseModel.fromJson(data);

        result = (res.data != null) ? QuizModel.fromJson(res.data) : null;

        if (onSuccess != null) onSuccess(result);
      },
    );
    print("result $result");
    return result;
  }

  static Future<QuizModel?> deleteCurrentQuiz(id, {onSuccess}) async {
    QuizModel? result;

    await api.normalRequest(
      Services.deleteCurrentQuiz,
      "GET",
      queryParamters: {"id": id},
      onSuccess: (data) async {
        // var res = ResponseModel.fromJson(data);

        // result = (res.data != null) ? QuizModel.fromJson(res.data) : null;

        if (onSuccess != null) onSuccess(result);
      },
    );
    print("result $result");
    return result;
  }

  static Future<IQResult?> getQuizResult(String id, {onSuccess}) async {
    IQResult? result;
    await api.normalRequest(
      Services.getQuizResult,
      "GET",
      queryParamters: {"id": id},
      onSuccess: (data) async {
        var res = ResponseModel.fromJson(data);

        result = IQResult.fromJson(res.data);

        if (onSuccess != null) onSuccess(result);
      },
    );
    print("result $result");
    return result;
  }
}
