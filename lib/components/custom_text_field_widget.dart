import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData prefixIcon;
  final bool? obscureText;
  final String Function(String? value)? validator;
  final void Function(String? value)? onSaved;

  const CustomTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.obscureText,
    this.hint,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        hintText: hint,
        label: Text(label),
        labelStyle: TextStyle(fontSize: 18, fontFamily: 'Nunito'),
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
