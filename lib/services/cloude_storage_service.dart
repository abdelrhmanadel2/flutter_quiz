import 'package:firebase_storage/firebase_storage.dart';

import 'package:get/get.dart';

import '../model/answer.dart';

class CloudeStorageService extends GetxService {
  Future<List<AnswerModel>> geturlsFromDirectory(String path) async {
    ListResult futureFiles = await FirebaseStorage.instance.ref(path).listAll();
    List<AnswerModel> files = [];
    print("files ${futureFiles.items.length}");
    for (var element in futureFiles.items) {
      if (!element.name.contains("Quiz")) {
        final imageUrl = await element.getDownloadURL();
        files.add(AnswerModel(name: element.name.split(".")[0], url: imageUrl, isAnswer: element.name.contains('Answer')));
      }
    }

    return files;
  }

  Future<String> getFileUrl({required path}) async {
    final storageRef = FirebaseStorage.instance.ref();
    String imageUrl = "";
// Create a reference with an initial file path and name
    final pathReference = storageRef.child(path);
    try {
      imageUrl = await pathReference.getDownloadURL();
    } catch (e) {
      print("No image found");
    }
    return imageUrl;
  }
}
