import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/views/loginScreen/login_screen.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  logOut() {
    Get.find<StorageService>().setAccountData(null);
    Get.find<StorageService>().setQuizData(null);
    Get.off(() => LoginScreen());
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AccountModel? record;

  @override
  void initState() {
    record = Get.find<StorageService>().accountData;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {
                      widget.logOut();
                    },
                    child: const Text("تسجيل الخروج")),
              ),
            ),
            AdvancedAvatar(
              name: record?.name ?? "Unknown",
              // radius: 70,
            ),
            const SizedBox(height: 20),
            itemProfile('Name', record?.name ?? "Unknown", CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Email', record?.email ?? "Unknown", CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 10),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //         padding: const EdgeInsets.all(15),
            //       ),
            //       child: const Text('Edit Profile')),
            // )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(offset: Offset(0, 5), color: Colors.deepOrange.withOpacity(.2), spreadRadius: 2, blurRadius: 10)]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
