import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final storageRef = FirebaseStorage.instance.ref();

  final profilePhotosRef = storageRef.child("photos/profile-photos");

  uploadFiles() {
  }
}
