import 'package:bary_solutions/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailObx = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  
  var passwordObx = false.obs;
  setPasswordObx(bool value) => passwordObx.value = value;

  var passwordVisible = false.obs;
  setPasswordVisible(bool value) => passwordVisible.value = value;

  suffixIconOnPressed() => passwordVisible.value = !passwordVisible.value;

  handleLogin(String email, String password) async {
    await AuthService.to.login(email, password);
  }
}
