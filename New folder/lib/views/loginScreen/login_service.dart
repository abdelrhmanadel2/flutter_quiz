// ignore: avoid_classes_with_only_static_members
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/response_model.dart';
import 'package:flutter_quiz/services/api_service.dart';
import 'package:flutter_quiz/services/services.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/utils/utils.dart';
import 'package:flutter_quiz/views/home/home_page.dart';
import 'package:get/get.dart';

class LoginService {
  static ApiService api = ApiService();
  static Future authenticate({email, password, onSuccess}) async {
    var user;
    await api.normalRequest(Services.authenticate, "POST", data: {"email": email, "password": password}, onSuccess: (data) async {
      // Get.find<StorageService>().setToken(data);
      var res = ResponseModel.fromJson(data);
      user = AccountModel.fromJson(res.data);

      await Get.find<StorageService>().setAccountData(user);

      if (onSuccess != null) onSuccess(user);
    }, beforeSend: showProgressDialog());

    return user;
  }

  static Future authenticateById({id, onSuccess}) async {
    var user;
    await api.normalRequest(Services.getUser, "GET", queryParamters: {"id": id}, onSuccess: (data) async {
      // Get.find<StorageService>().setToken(data);
      var res = ResponseModel.fromJson(data);
      user = AccountModel.fromJson(res.data);

      await Get.find<StorageService>().setAccountData(user);
      if (onSuccess != null) onSuccess(user);
    });

    return user;
  }
}
