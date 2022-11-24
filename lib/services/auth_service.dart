import 'package:flutter/material.dart';

import 'package:bary_solutions/widgets/full_screen_loading_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:bary_solutions/models/user_model.dart';
import 'package:bary_solutions/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import '../constants/constants.dart' as colors;

class AuthService extends GetxController {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;
  Rx<UserModel?> userInformations = Rx(UserModel(id: '', email: '', estabelecimento: '', nome: '', ativo: false));
  var userIsAuthenticated = false.obs;
  RxString profilePhotoUrl = ''.obs;
  var haveProfilePhoto = false.obs;

  @override
  void onInit() async {
    super.onInit();

    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.authStateChanges());
    ever(_firebaseUser, (User? user) async {
      if (user != null) {
        userIsAuthenticated.value = true;
        await Get.toNamed(Routes.HOME);
      } else {
        userIsAuthenticated.value = false;
        await Get.toNamed(Routes.INITIAL);
      }
    });
  }

  User get user => _firebaseUser.value!;
  static AuthService get to => Get.find<AuthService>();

  showSnack(String title, String error) {
    Get.snackbar(title, error,
        backgroundColor: colors.primaryColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP);
  }

  Future<void> checkUserHasEstablishment() async {
    await firestore
        .collection('USUARIO')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((docs) {
      final user = UserModel.fromSnapshot(docs);
      userInformations.value = user;
    });
  }

  login(String email, String password) async {
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator(color: colors.primaryColor)),
        barrierDismissible: false,
      );
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser;
      await getProfilePhoto();
    } on FirebaseAuthException catch (e) {
      Get.back();
      String error = 'Erro';
      switch (e.code) {
        case 'wrong-password':
          error = 'Usuário ou senha incorretos';
          break;
        case 'too-many-requests':
          error =
              'Várias tentativas de login incorretas, favor aguardar e tentar novamente';
          break;
        default:
      }
      showSnack("Erro ao realizar login", error);
    }
  }

  logout() async {
    try {
      FullScreenLoadingWidget();
      await _auth.signOut();
    } catch (e) {
      Get.back();
      showSnack("Erro sair", e.toString());
    }
  }

  Future<String> getProfilePhoto() async {
    try {
      final storageRef =
          storage.ref().child("photos/profile-photos/${user.uid}");
      final listResult = await storageRef.listAll();
      for (var item in listResult.items) {
        haveProfilePhoto.value = true;
        var url = await item.getDownloadURL();
        profilePhotoUrl.value = url;
        return url;
      }
    } on FirebaseStorage catch (e) {
      e.app.name;
    }
    return '';
  }
}
