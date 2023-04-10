import 'dart:developer';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/model/quiz_model.dart';
import 'package:flutter_quiz/model/quiz_question.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class StorageKeys {
  StorageKeys();

  //Declare all storage keys here & create its correpsonding setters & getters
  static const String accountData = 'ACCOUNT_DATA';
  static const String userData = 'USER_DATA';
  static const String quizData = 'QUIZ_DATA';
  static const String isInQuiz = 'IS_IN_QUIZ';
  static const String questionIndex = 'IS_IN_QUIZ';
}

class StorageService extends GetxService {
  StorageService(this._prefs);

  final GetStorage _prefs;

  static Future<StorageService> init() async {
    await GetStorage.init();
    final GetStorage prefs = GetStorage();
    return StorageService(prefs);
  }

  bool get isInQuiz {
    final userStr = _prefs.read(StorageKeys.isInQuiz);
    return userStr == "true";
  }

  set isInQuiz(bool state) {
    _prefs.write(StorageKeys.isInQuiz, state);
  }

  AccountModel? get accountData {
    final userStr = _prefs.read(StorageKeys.accountData);
    print('StorageService.accountData get >>  userdata= $userStr');
    if (userStr != null) {
      return AccountModel.fromJson(userStr);
    } else {
      return null;
    }
  }

  QuizModel? get quizData {
    final quizStr = _prefs.read(StorageKeys.quizData);
    print('StorageService.quizStr get >>  quizStr= $quizStr');
    if (quizStr != null) {
      return QuizModel.fromJson(quizStr);
    } else {
      return null;
    }
  }

  Future<void> setQuizData(QuizModel? quiz) async {
    print('StorageService.accountData quiz= $quiz');
    if (quiz != null) {
      print('StorageService.setQuizData quiz != null');
      log('StorageService.setQuizData quizid= ${quiz.level}');
      await _prefs.write(StorageKeys.quizData, quiz.toJson());
    } else {
      print('StorageService.setQuizData quiz is null');
      _prefs.remove(StorageKeys.quizData);
    }
  }

  Future<void> setAccountData(AccountModel? user) async {
    print('StorageService.accountData user= $user');
    if (user != null) {
      print('StorageService.setAccountData user != null');
      log('StorageService.setAccountData userid= ${user.name}');
      await _prefs.write(StorageKeys.accountData, user.toJson());
    } else {
      print('StorageService.setUserData user is null');
      _prefs.remove(StorageKeys.accountData);
    }
  }
}
