import 'package:bary_solutions/components/custom_elevated_button_widget.dart';
import 'package:bary_solutions/components/custom_text_field_widget.dart';
import 'package:bary_solutions/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  var user = UserModel();

  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: double.maxFinite,
          color: Colors.white,
          padding: EdgeInsets.only(
            bottom: 32,
            left: 32,
            right: 32,
            top: 120,
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 225,
                  height: 110,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: CustomTextField(
                    onSaved: (text) => user = user.copyWith(email: text),
                    label: '',
                    prefixIcon: Icons.email_outlined,
                    hint: 'Hint',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 36),
                  child: CustomTextField(
                    onSaved: (text) => user = user.copyWith(password: text),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'This field can`t be empty';
                      }
                      if (!validator.isEmail(text)) {
                        return 'Value must be email type';
                      }
                      return '';
                    },
                    label: 'Senha',
                    prefixIcon: Icons.lock_outline_sharp,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 69),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: CustomElevatedButton(
                      onPressed: () {
                        formKey.currentState?.validate();
                      },
                      labelButton: 'Entrar',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Text(
                          'Esqueceu sua senha?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      )
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
}
