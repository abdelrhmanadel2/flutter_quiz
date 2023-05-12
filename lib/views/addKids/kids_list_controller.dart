import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get/get.dart';

import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/kid_model.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/utils/utils.dart';
import 'package:flutter_quiz/utils/validation_helper.dart';
import 'kids_service.dart';

class KidsListController extends GetxController {
  KidsListController();
  final validatorHelber = ValidatorHelper.instance;

  final storage = Get.find<StorageService>();
  List<KidsModel> kidsList = [];
  late AccountModel user;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    user = storage.accountData!;
    getKidsList();
    super.onInit();
  }

  String? validateName(String? name) {
    return validatorHelber.validateName(name);
  }

  String? validateAge(String? name) {
    double value = double.tryParse(name ?? "") ?? 0;
    print("isNumberValid ${!validatorHelber.isNumberNotValid(name ?? "--")}");
    if ((validatorHelber.isNumberNotValid(name ?? "--")) || (value < 6 || value > 10)) {
      return "Age Must Be between 6 and 10";
    }
  }

  addKid() async {
    var age = int.parse(ageController.text);
    if (nameController.text.isNotEmpty && age > 5 && age < 17) {
      await KidsService.addKid(
          age: age,
          name: nameController.text,
          patertId: user.sId!,
          onSuccess: (data) {
            kidsList.add(data);
            nameController.clear();
            ageController.clear();
            update();
          });
    } else {
      showSnack(massage: "يجب ملئ البيانات اولا والسن يجب ان يكون بين ال6 و ال16");
    }
  }

  getKidsList() async {
    KidsService.getParetKids(
        patertId: user.sId!,
        onSuccess: (data) {
          kidsList.addAll(data);
          update();
        });
  }
}
