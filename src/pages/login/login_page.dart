import '../../../src/components/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/custom_elevated_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  ValueNotifier<bool> emailNotifier = ValueNotifier(false);
  ValueNotifier<bool> passwordNotifier = ValueNotifier(false);
  ValueNotifier<bool> showPassword = ValueNotifier(false);

  final TextEditingController _emailController = TextEditingController();

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
                  key: _formKey,
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
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                decoration: TextDecoration.underline),
          ))
        ],
      ),
    );
  }

  Padding _button() {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: CustomElevatedButton(
        labelButton: 'Entrar',
        onPressed: () {},
      ),
    );
  }

  EdgeInsets _initialPadding() =>
      EdgeInsets.only(bottom: 32, left: 32, right: 32, top: 120);

  Image _mainImage() =>
      Image.asset('assets/images/logo.png', width: 225, height: 110);

  SizedBox _spacer() => SizedBox(height: 80);

  Padding _emailTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: CustomFormField(
        valueNotifier: emailNotifier,
        onFocusChange: (focus) => {emailNotifier.value = focus},
        icon: CupertinoIcons.mail,
        title: 'Endereço de email',
        label: 'Digite seu email',
      ),
    );
  }

  Padding _passwordTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: CustomFormField(
        suffixIconOnPressed: () {
          // Update the state i.e. toogle the state of passwordVisible variable
          setState(() {
            _passwordVisible = !_passwordVisible;
          });
        },
        onChanged: (value) => _emailController.value,
        controller: _emailController,
        isPassword: true,
        obscureText: !_passwordVisible,
        valueNotifier: passwordNotifier,
        onFocusChange: (focus) => {passwordNotifier.value = focus},
        icon: CupertinoIcons.lock,
        title: 'Sua senha',
        label: '**********',
      ),
    );
  }
}
