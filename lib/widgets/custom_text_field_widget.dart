import 'package:flutter/material.dart';

import '../constants/constants.dart' as textStyle;

class CustomFormField extends StatelessWidget {
  final String label;
  final String title;
  final IconData? icon;
  final Widget? suffixIcon;
  final void Function(bool)? onFocusChange;
  final void Function()? suffixIconOnPressed;
  final bool obscureText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? observable;
  final bool? passwordVisible;
  final bool? isPassword;

  const CustomFormField({
    Key? key,
    required this.label,
    required this.title,
    this.icon,
    this.onFocusChange,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.passwordVisible = false,
    this.isPassword = false,
    this.observable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon? iconInputShow(icon) {
      return icon != null
          ? Icon(
              icon,
              color: observable! ? Theme.of(context).primaryColor : null,
            )
          : null;
    }

    IconButton? _suffixIconShow() {
      return isPassword!
          ? IconButton(
              icon: Icon(
                  // Based on passwordVisible state choose the icon
                  passwordVisible! ? Icons.visibility : Icons.visibility_off,
                  color: observable! ? Theme.of(context).primaryColor : null),
              onPressed: suffixIconOnPressed)
          : null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: Text(title, style: textStyle.inputHeader,),
        ),
        Focus(
          child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            obscureText: obscureText,
            cursorColor: Colors.grey.shade500,
            style: TextStyle(),
            decoration: InputDecoration(
              suffixIcon: _suffixIconShow(),
              prefixIcon: iconInputShow(icon),
              hintText: label,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              label: Text(label),
            ),
          ),
          onFocusChange: onFocusChange,
        ),
      ],
    );
  }
}
