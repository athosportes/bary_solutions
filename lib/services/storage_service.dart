import 'package:flutter/material.dart';

import 'package:bary_solutions/services/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class StorageService extends GetxController {
  static final authService = Get.find<AuthService>();

  final _currentUserUid = authService.user.uid;
  final FirebaseStorage storage = FirebaseStorage.instance;

  var uploading = false.obs;
  var total = 0.0.obs;

  RxList refs = [].obs;
  RxList arquivos = [].obs;
  var loading = true.obs;

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    String ref = 'photos/profile-photos/${_currentUserUid}/${_currentUserUid}.jpg';
    try {
      return storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload');
    }
  }

  pickAndUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);

      task.snapshotEvents.listen((snap) async {
        if (snap.state == TaskState.running) {
          // authService.getProfilePhoto();
          uploading.value = true;
          total.value = (snap.bytesTransferred / snap.totalBytes) * 100;
        } else if (snap.state == TaskState.success) {
          uploading.value = false;
        }
      });
    }
  }


}
