import 'package:flutter/material.dart';

class CustomIconInput extends StatelessWidget {
  final IconData icon;
  final Color color;
  

  const CustomIconInput({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
    );
  }
}
