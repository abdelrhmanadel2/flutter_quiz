import 'dart:developer';

import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/response_model.dart';
import 'package:flutter_quiz/services/api_service.dart';
import 'package:flutter_quiz/services/services.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:get/get.dart';

// ignore: avoid_classes_with_only_static_members
class SignupService {
  static ApiService api = ApiService();

  static Future<AccountModel> register({required name, required userName, required int age, required password, onSuccess}) async {
    var user;
    await api.normalRequest(Services.register, "POST",
        data: {'password': password, 'name': name, "userName": userName, "age": age, "category": age > 10 ? "adult" : "kids"}, onSuccess: (data) {
      var res = ResponseModel.fromJson(data);
      user = AccountModel.fromJson(res.data);
      if (onSuccess != null) onSuccess(user);
    });

    return user;
  }
}
