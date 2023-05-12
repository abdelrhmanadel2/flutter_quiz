
import 'package:get/get.dart';

import 'home_contrroller.dart';

class HomePinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    // Get.lazyPut<DailyReportCenterController>(() => DailyReportCenterController());
    // Get.lazyPut<UserDailyReporterController>(() => UserDailyReporterController(null, Get.find<UserHomeController>().siteList ?? []));
  }
}
