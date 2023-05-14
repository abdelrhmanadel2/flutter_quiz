import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/response_model.dart';
import 'package:flutter_quiz/services/api_service.dart';
import 'package:flutter_quiz/services/services.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/utils/utils.dart';
import 'package:get/get.dart';

class ProfileService {
  static ApiService api = ApiService();
  static Future updateName({id, name, onSuccess}) async {
    var user;
    await api.normalRequest(Services.updateUserName, "PUT", queryParamters: {"id": id, "name": name}, onSuccess: (data) async {
      // Get.find<StorageService>().setToken(data);
      var res = ResponseModel.fromJson(data);
      user = AccountModel.fromJson(res.data);

      await Get.find<StorageService>().setAccountData(user);

      if (onSuccess != null) onSuccess(user);
    }, beforeSend: showProgressDialog());

    return user;
  }
}
