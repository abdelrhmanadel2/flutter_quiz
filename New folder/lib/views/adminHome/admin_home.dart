import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/app_bar.dart';
import 'package:flutter_quiz/components/quiz_score.dart';
import 'package:flutter_quiz/components/rich_text_widget.dart';
import 'package:flutter_quiz/utils/utils.dart';
import 'package:flutter_quiz/views/adminHome/admin_home_controller.dart';
import 'package:flutter_quiz/views/quizResutHistory/quiz_history_controller.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});
  @override
  Widget build(BuildContext context) {
    // Get.put(AdminHomeController(user));
    context.theme;
    return Scaffold(
      appBar: const AppBarWidget(title: "قائمه المستخدمين"),
      body: GetBuilder<AdminHomeController>(
          init: AdminHomeController(),
          initState: (_) {},
          builder: (controller) {
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Obx(() => (controller.userList.isNotEmpty && controller.isLoading.isFalse)
                          ? RefreshIndicator(
                              onRefresh: controller.getUserList,
                              child: ListView.builder(
                                  itemCount: controller.userList.length,
                                  itemBuilder: (_, index) {
                                    var item = controller.userList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        tileColor: Colors.white,
                                        contentPadding: EdgeInsets.all(10),
                                        // onTap: () => Get.to(QuizScore(result: item)),
                                        onLongPress: () {
                                          // QuickAlert.show(context: context, type: )
                                          statusDialog("هل انت متأكد من مسح الحساب", QuickAlertType.confirm,
                                              onConfirmBtnTap: () => controller.deleteUser(item.sId));
                                        },
                                        title: Column(children: [
                                          RitchTextWidget(title: "الأسم", text: item.name?.toString()),
                                          RitchTextWidget(title: "البريد الألكتروني", text: item.email?.toString() ?? "Na"),
                                          RitchTextWidget(title: "نوع الحساب", text: "${item.type}"),
                                        ]),
                                      ),
                                    );
                                  }),
                            )
                          : (controller.isLoading.isTrue)
                              ? const Center(child: CircularProgressIndicator())
                              : const Center(
                                  child: Text("No Results Found"),
                                ))),
                ],
              ),
            );
          }),
    );
  }
}
