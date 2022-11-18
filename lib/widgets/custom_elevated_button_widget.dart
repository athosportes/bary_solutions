import 'package:flutter/material.dart';

import '../constants/constants.dart' as colors;

class CustomElevatedButton extends StatelessWidget {
  final String labelButton;
  final void Function() onPressed;
  final bool? isLoading;

  const CustomElevatedButton({
    super.key,
    required this.labelButton,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
          onPressed: onPressed,
          child: isLoading!
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                )
              : Text(
                  labelButton,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primaryColor,
          )),
    );
  }
}
