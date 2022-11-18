import 'package:bary_solutions/widgets/full_screen_loading_widget.dart';
import 'package:flutter/material.dart';

import 'package:bary_solutions/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../constants/constants.dart' as colors;

class AuthService extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;
  var userIsAuthenticated = false.obs;

  @override
  void onInit() {
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

  login(String email, String password) async {
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator(color: colors.primaryColor)),
        barrierDismissible: false,
      );
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.back();
      print(e.code);
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
}
