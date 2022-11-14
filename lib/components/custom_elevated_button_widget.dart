import 'package:bary_solutions/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  
  final String labelButton;
  final void Function() onPressed;

  const CustomElevatedButton({
    super.key,
    required this.labelButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            labelButton,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.primary,
          )),
    );
  }
}
