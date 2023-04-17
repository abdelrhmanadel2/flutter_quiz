import 'package:flutter_quiz/model/kid_model.dart';
import 'package:flutter_quiz/model/response_model.dart';
import 'package:flutter_quiz/services/api_service.dart';
import 'package:flutter_quiz/services/services.dart';
import 'package:get/get.dart';

class KidsService extends GetxService {
  static ApiService api = ApiService();

  static Future<KidsModel> addKid({required name, required patertId, required int age, onSuccess}) async {
    var kid;
    await api.normalRequest(Services.addKid, "POST", data: {'name': name, "age": age, "userID": patertId}, onSuccess: (data) {
      var res = ResponseModel.fromJson(data);
      kid = KidsModel.fromJson(res.data);
      if (onSuccess != null) onSuccess(kid);
    });

    return kid;
  }

  static Future<KidsModel?> getKidByAccountID({id, onSuccess}) async {
    var kid;
    await api.normalRequest(Services.getKid, "GET", queryParamters: {"id": id}, onSuccess: (data) async {
      // Get.find<StorageService>().setToken(data);
      var res = ResponseModel.fromJson(data);
      kid = KidsModel.fromJson(res.data);

      // await Get.find<StorageService>().setAccountData(kid);
      if (onSuccess != null) onSuccess(kid);
    });

    return kid;
  }

  static Future<List<KidsModel>> getParetKids({required patertId, onSuccess}) async {
    List<KidsModel> kids = [];
    await api.normalRequest(Services.getKidsList, "GET", queryParamters: {"id": patertId}, onSuccess: (data) {
      var res = ResponseModel.fromJson(data);
      for (var element in res.data) {
        kids.add(KidsModel.fromJson(element));
      }

      if (onSuccess != null) onSuccess(kids);
    });

    return kids;
  }
}
