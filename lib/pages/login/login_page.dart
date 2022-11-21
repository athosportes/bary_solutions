import 'package:flutter/material.dart';

import 'package:bary_solutions/pages/login/login_controller.dart';
import 'package:bary_solutions/services/auth_service.dart';
import 'package:bary_solutions/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../widgets/custom_elevated_button_widget.dart';

class LoginPage extends GetView<LoginController> {
  final LoginController controller = Get.find<LoginController>();
  final AuthService authService = Get.find<AuthService>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            padding: _initialPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _mainImage(),
                _spacer(),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      _emailTextField(),
                      _passwordTextField(),
                      _button(),
                      _forgotThePassword()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _forgotThePassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
              child: Text(
            'Esqueceu sua senha?',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                decoration: TextDecoration.underline),
          ))
        ],
      ),
    );
  }

  EdgeInsets _initialPadding() =>
      EdgeInsets.only(bottom: 32, left: 32, right: 32, top: 120);

  Image _mainImage() =>
      Image.asset('assets/images/logo.png', width: 225, height: 110);

  SizedBox _spacer() => SizedBox(height: 80);

  Widget _emailTextField() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(top: 30),
        child: CustomFormFieldWidget(
          controller: controller.emailController.value,
          observable: controller.emailObx.value,
          onFocusChange: (focus) => {controller.emailObx.value = focus},
          icon: CupertinoIcons.mail,
          title: 'Endereço de email',
          label: 'Digite seu email',
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(top: 30),
        child: CustomFormFieldWidget(
          suffixIconOnPressed: () => controller.suffixIconOnPressed(),
          controller: controller.passwordController.value,
          observable: controller.passwordObx.value,
          isPassword: true,
          obscureText: !controller.passwordVisible.value,
          onFocusChange: (value) {
            controller.setPasswordObx(value);
          },
          icon: CupertinoIcons.lock,
          title: 'Sua senha',
          label: '**********',
        ),
      ),
    );
  }

  Padding _button() {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: CustomElevatedButtonWidget(
        isLoading: false,
        labelButton: 'Entrar',
        onPressed: () {
          String _email = controller.emailController.value.text;
          String _password = controller.passwordController.value.text;
          // widget._loginController.handleLogin(_email, _password);
          authService.login(_email, _password);
        },
      ),
    );
  }
}
