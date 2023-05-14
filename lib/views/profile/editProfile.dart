import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/model/account_model.dart';
import 'package:flutter_quiz/services/storage_service.dart';
import 'package:flutter_quiz/views/profile/profileService.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  AccountModel? record;
  @override
  void initState() {
    super.initState();
    record = Get.find<StorageService>().accountData;
    nameController.text = record?.name ?? '';
    emailController.text = record?.email ?? '';
  }

  updateName() {
    ProfileService.updateName(
        id: record!.sId,
        name: nameController.text,
        onSuccess: () {
          Navigator.of(context).pop();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الملف الشخصي'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'الاسم',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              enabled: false,
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'الايميل',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  updateName();
                },
                child: const Text('حفظ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
