import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/kid_model.dart';
import 'package:flutter_quiz/model/response_model.dart';
import 'package:flutter_quiz/services/api_service.dart';
import 'package:flutter_quiz/services/services.dart';
import 'package:get/get.dart';

class AdminHomeService extends GetxService {
  static ApiService api = ApiService();

  static Future<List<AccountModel>> getUsers({onSuccess}) async {
    List<AccountModel> kids = [];
    await api.normalRequest(Services.getAllUsers, "GET", onSuccess: (data) {
      var res = ResponseModel.fromJson(data);
      for (var element in res.data) {
        kids.add(AccountModel.fromJson(element));
      }
      if (onSuccess != null) onSuccess(kids);
    });

    return kids;
  }

  static Future deleteUser({id, onSuccess}) async {
    var user;
    await api.normalRequest(Services.deleteUser, "GET", queryParamters: {"id": id}, onSuccess: (data) async {
      // Get.find<StorageService>().setToken(data);
      var res = ResponseModel.fromJson(data);
      if (onSuccess != null) onSuccess(res.message);
    });

    return user;
  }
}
