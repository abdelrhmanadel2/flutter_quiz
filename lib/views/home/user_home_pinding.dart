import 'package:flutter_quiz/views/home/home_contrroller.dart';
import 'package:get/get.dart';

class HomePinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    // Get.lazyPut<DailyReportCenterController>(() => DailyReportCenterController());
    // Get.lazyPut<UserDailyReporterController>(() => UserDailyReporterController(null, Get.find<UserHomeController>().siteList ?? []));
  }
}
