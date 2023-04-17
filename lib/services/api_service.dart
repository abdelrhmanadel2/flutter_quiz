import 'package:dio/dio.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/utils/utils.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quickalert/quickalert.dart';

class ApiService extends GetxService {
  static final ApiService _apiUtil = ApiService._();
  ApiService._() {
    init();
  }
  factory ApiService() {
    return _apiUtil;
  }

  Dio dio = Dio();

  void init() {
    // dio.options.baseUrl = "https://seal-app-njkkz.ondigitalocean.app/api/v1/";
    dio.options.baseUrl = "http://192.168.1.7:3801/";
    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 200000);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: true,
      compact: true,
    ));
  }

  // errorWidget(str) => Get.defaultDialog(title: errorTitle.tr, middleText: " ${str ?? " "}");

  dynamic errorHandler(DioError error, errorDialog) async {
    if (error.type == DioErrorType.connectionTimeout) {
      statusDialog('Server maybe Down please connect your system Adminstrator.', QuickAlertType.error);
    } else if (error.type == DioErrorType.sendTimeout) {
      statusDialog('Error occurred pls check internet and retry.', QuickAlertType.warning);
    } else if (error.type == DioErrorType.badResponse) {
      (errorDialog != null)
          ? await errorDialog(error.response?.data["message"] ?? "")
          : statusDialog(error.response?.data["message"], QuickAlertType.error);
    }
  }
  // }

  Future<dynamic> normalRequest<T>(
    String endPoint,
    String method, {
    dynamic data,
    Map<String, dynamic>? queryParamters,
    String contentType = "application/json",
    Function(int, int)? beforeSend,
    Function(String errorMsg)? errorDialog,
    Function(dynamic successMsg)? onSuccess,
    Function(String errorMsg)? errorMessage,
  }) async {
    var headers = {
      // "Authorization": "Bearer ${Get.find<StorageService>().token}",
      // "Accept-Language": Get.find<StorageService>().activeLocale.toString()
    };
    // print(Get.find<ConnectionService>().hasConnection.value);
    var resData;
    try {
      // showWaitingDialog(
      //     request:
      var result = await Future.wait([
        dio.request<T>(endPoint, data: data ?? {}, queryParameters: queryParamters, onReceiveProgress: (received, total) {
          // showProgressDialog();
          print("Total $total");
          if (total == received) {
            print("111111111111111111111111111111111111111111111");
            Get.until((route) => !Get.isDialogOpen!);

            // (beforeSend != null) ? Navigator.pop(Get.context!) : print("${(received / total * 100).toStringAsFixed(0)}%");
          }
        },

            // onSendProgress: showProgressDialog(),
            onSendProgress: (count, total) {
          if (beforeSend != null) beforeSend(count, total);
        },
            options: Options(
              method: method,
              contentType: contentType,
              // headers: headers,
            ))
      ]);
      // print("beforeSend != null${beforeSend != null}");
      // if (beforeSend != null) {
      //   Navigator.pop(Get.context!);
      // }
      resData = result[0].data;
      if (onSuccess != null) {
        await onSuccess(result[0].data);
      }
      // Get.until((route) => !Get.isDialogOpen!);

      return resData;
    } on DioError catch (error) {
      Get.until((route) => !Get.isDialogOpen!);

      await errorHandler(error, errorDialog);
      return resData;
    }
  }
}
