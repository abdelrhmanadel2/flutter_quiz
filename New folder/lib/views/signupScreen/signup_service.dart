import 'dart:developer';

import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/kid_model.dart';
import 'package:flutter_quiz/model/response_model.dart';
import 'package:flutter_quiz/services/api_service.dart';
import 'package:flutter_quiz/services/services.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:get/get.dart';

// ignore: avoid_classes_with_only_static_members
class SignupService {
  static ApiService api = ApiService();

  static Future<AccountModel> registerKid({required name, required email, required int age, required password, onSuccess}) async {
    var user;
    await api.normalRequest(Services.register, "POST",
        data: {'password': password, 'name': name, "email": email, "age": age, "category": age < 10 ? "baby" : "young", "type": "kids"},
        onSuccess: (data) {
      var res = ResponseModel.fromJson(data);
      user = AccountModel.fromJson(res.data);
      if (onSuccess != null) onSuccess(user);
    });

    return user;
  }

  static Future<AccountModel> registerParent({name, required email, required password, onSuccess}) async {
    var user;
    await api.normalRequest(Services.register, "POST", data: {'password': password, "email": email, "name": name, "type": "parent"},
        onSuccess: (data) {
      var res = ResponseModel.fromJson(data);
      user = AccountModel.fromJson(res.data);
      if (onSuccess != null) onSuccess(user);
    });

    return user;
  }
}
